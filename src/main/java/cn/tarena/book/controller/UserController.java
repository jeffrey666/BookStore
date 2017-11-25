package cn.tarena.book.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.User;
import cn.tarena.book.service.UserInfoService;

import cn.tarena.book.service.UserService;

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
		userService.addUser(user);
		//成功则跳转至主页
		return "redirect:/";
	}
	//用户登录
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


}
