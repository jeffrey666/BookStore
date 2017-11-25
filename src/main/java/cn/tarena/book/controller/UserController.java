package cn.tarena.book.controller;

import javax.servlet.http.HttpSession;

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
