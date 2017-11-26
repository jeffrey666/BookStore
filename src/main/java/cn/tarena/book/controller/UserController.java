package cn.tarena.book.controller;

import static org.hamcrest.CoreMatchers.nullValue;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.User;

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
	
	//注册用户
	@RequestMapping("/toregist.action")
	public String toRegist(User user,Model model){
		if(StringUtils.isEmpty(user.getUsername())||StringUtils.isEmpty(user.getPassword())){
			model.addAttribute("errorInfo","用户名或密码不能为空");
			return "/regist";
		}
		User exitUser = userService.findUserByUsername(user.getUsername()); 
		if(exitUser!=null){
			model.addAttribute("errorInfo","用户名已存在");
			return "/regist";
		}
		
		userService.addUser(user);
		//成功则跳转至主页
		return "redirect:/";
	}
	//用户的登录
	//用户的登录
	@RequestMapping("/tologin.action")
	public String toLogin(String username,String password,Model model,HttpSession session){
		//非空验证
		if(StringUtils.isEmpty(username)||StringUtils.isEmpty(password)){
			model.addAttribute("errorInfo","用户名或密码不能为空");
			return "/login";
		}
		
		//根据用户名和密码查找单个用户
		User user = userService.findUser(username,password);
		
		if(user==null){
			model.addAttribute("errorInfo","用户名或密码错误");
			return "/login";
		}
		session.setAttribute("_CURRENT_USER", user);
		return "redirect:/";
	}
	//用户退出登录
	@RequestMapping("tologout")
	public String tologout(HttpSession session){
		session.removeAttribute("_CURRENT_USER");
		return "redirect:/";
	}
	
	
	




	@Autowired
	private UserInfoService userInfoService;

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
	public String toUserInfoUpdate() {

		return "/userinfo/jUserInfoUpdate";
	}

	@RequestMapping("/user/userinfo/update")
	public String UserInfoUpdate(User user,
			HttpSession session) {

		userInfoService.update(user.getUserInfo());

		User _CURRENT_USER = (User) session
				.getAttribute("_CURRENT_USER");
		_CURRENT_USER.setUserInfo(user.getUserInfo());

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

		// 旧密码是否正确？
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

	private boolean checkPsws(String new_password) {

		if (StringTool.isEmpty(new_password)) {
			return false;
		}

		return true;

	}

}
