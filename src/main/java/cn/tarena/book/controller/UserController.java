package cn.tarena.book.controller;

import static org.hamcrest.CoreMatchers.nullValue;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.pojo.UserInfo;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.User;
import cn.tarena.book.service.UserInfoService;
import cn.tarena.book.service.UserService;
import cn.tarena.book.user.utils.StringTool;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private UserInfoService userInfoService;

	//注册用户
	@RequestMapping("/toregist.action")
	public String toRegist(User user, Model model) {
		if (StringUtils.isEmpty(user.getUsername())
				|| StringUtils.isEmpty(user.getPassword())) {
			model.addAttribute("errorInfo", "用户名或密码不能为空");
			return "/regist";
		}
		User exitUser = userService
				.findUserByUsername(user.getUsername());
		if (exitUser != null) {
			model.addAttribute("errorInfo", "用户名已存在");
			return "/regist";
		}
		userService.addUser(user);
		//成功则跳转至主页
		return "redirect:/";
	}

	//用户的登录
	@RequestMapping("/tologin.action")

	public String toLogin(String username, String password,
			String remname, String autologin,
			HttpServletResponse response,
			HttpServletRequest request, Model model,
			HttpSession session) {

		if ("true".equals(remname)) {
			Cookie cookie;
			try {
				cookie = new Cookie("remname",
						URLEncoder.encode(username, "utf-8"));
				cookie.setMaxAge(3600 * 24 * 30);
				cookie.setPath(request.getContextPath() + "/");
				response.addCookie(cookie);
			} catch (UnsupportedEncodingException e) {

			}
		} else {
			Cookie cookie = new Cookie("remname", "");
			cookie.setMaxAge(0);
			cookie.setPath(request.getContextPath() + "/");
			response.addCookie(cookie);
		}

		if (StringUtils.isEmpty(username)
				|| StringUtils.isEmpty(password)) {

			model.addAttribute("errorInfo", "用户名或密码不能为空");
			return "/login";
		}
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(
				username, password);
		try {
			subject.login(token);
			User user = (User) subject.getPrincipal();
			session.setAttribute("_CURRENT_USER", user);
			return "redirect:/";
		} catch (AuthenticationException e) {
			model.addAttribute("errorInfo", "用户名或者密码错误");
			return "/login";
		}

	}

	//用户退出登录
	@RequestMapping("tologout")
	public String tologout(HttpSession session) {
		session.removeAttribute("_CURRENT_USER");
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout();
		}
		return "redirect:/";
	}

	//注册时ajax验证用户名是否存在
	@RequestMapping("/AjaxCheckUsername.action")
	@ResponseBody
	public String AjaxCheckUsername(String username) {
		User exitUser = userService.findUserByUsername(username);
		if (exitUser != null) {
			return "用户名已存在";
		}
		return "恭喜,用户名可用";
	}

	@RequestMapping("/user/userInfo/Left.action")
	public String userinfoLeft() {
		return "/userinfo/left";
	}

	@RequestMapping("/user/userInfo/Main.action")
	public String userinfoMain() {
		return "/userinfo/main";
	}

	@RequestMapping("/user/userinfo.action")
	public String userinfoAction() {

		return "/userinfo/fmain_user_info";
	}

	@RequestMapping("/user/toUserInfoUpdate.action")
	public String toUserInfoUpdate(HttpSession session) {

		//更新session中的登录user信息
		User _CURRENT_USER = (User) session
				.getAttribute("_CURRENT_USER");
		User refresh_current_user = userService
				.findUserByUsername(_CURRENT_USER.getUsername());
		session.setAttribute("_CURRENT_USER",
				refresh_current_user);

		return "/userinfo/jUserInfoUpdate";
	}

	@RequestMapping("/user/userinfo/update")
	public String UserInfoUpdate(User user,
			HttpSession session) {

		userInfoService.updateExceptforEmail(user.getUserInfo());
		
		
		//更新session中的登录user的userinfo
		User _CURRENT_USER = (User) session
				.getAttribute("_CURRENT_USER");
		UserInfo refreshUserInfo =  userInfoService.findByUserInfoId(_CURRENT_USER.getUserInfoId());
		_CURRENT_USER.setUserInfo(refreshUserInfo);

		return "/userinfo/main";
	}

	@RequestMapping("/user/toChangePassword.action")
	public String toChangePassword(HttpSession session,
			Model model) {

		User _CURRENT_USER = (User) session
				.getAttribute("_CURRENT_USER");

		model.addAttribute("user_id", _CURRENT_USER.getId());

		return "/userinfo/jChangePassword";
	}

	@RequestMapping("/user/password/update")
	public String passwordUpdate(String user_id, String old_psw,
			String new_password, Model model,
			HttpSession session) {

		//旧密码是否正确？
		if (StringTool.isEmpty(user_id)
				|| StringTool.isEmpty(old_psw)) {
			model.addAttribute("errMsg", "页面出错，请重新登录");
			model.addAttribute("user_id", user_id);
			return "/userinfo/jChangePassword";
		}
		User u = new User();
		u.setId(user_id);
		u.setPassword(old_psw);
		User user = userService.findUserByIdAndPsw(u);
		if (user == null) {
			model.addAttribute("errMsg", "旧密码输入错误，请重试");
			model.addAttribute("user_id", user_id);
			return "/userinfo/jChangePassword";
		}

		// 新密码是否符合格式要求？
		if (!checkPsws(new_password)) {
			model.addAttribute("errMsg", "新密码不符合要求，请修改");
			model.addAttribute("user_id", user_id);
			return "/userinfo/jChangePassword";
		}

		// 数据库更新密码
		//TODO 查看这里的rowsAffected有没有值
		int rowsAffected = userService.updatePsw(user_id,
				new_password);

		//更改完成后 session里面的密码要改成新的
		User _CURRENT_USER = (User) session
				.getAttribute("_CURRENT_USER");
		_CURRENT_USER.setPassword(new_password);

		return "redirect:/user/userInfo/Main.action";
	}

	@RequestMapping("/user/wantChangeEmail.action")
	@ResponseBody
	public String wantChangeEmail(String user_id,
			String new_email) {

		userService.wantChangeEmail(user_id, new_email);

		return "";
	}

	@RequestMapping("/user/verifyEmail")
	public String verifyEmail(String verify_email_id,
			Model model, HttpSession session) {

		String new_email = userService
				.verifyEmail(verify_email_id);

		model.addAttribute("new_email", new_email);

		Object _CURRENT_USER_Object = session
				.getAttribute("_CURRENT_USER");
		if (_CURRENT_USER_Object != null) {
			User _CURRENT_USER = (User) _CURRENT_USER_Object;
			_CURRENT_USER.getUserInfo().setEmail(new_email);
		}

		return "/userinfo/verifyEmailSuccess";
	}

	private boolean checkPsws(String new_password) {

		if (StringTool.isEmpty(new_password)) {
			return false;
		}

		return true;

	}

}
