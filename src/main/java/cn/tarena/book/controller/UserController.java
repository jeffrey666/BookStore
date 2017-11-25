package cn.tarena.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@RequestMapping("/userInfoLeft.action")
	public String userinfoLeft() {
		return "/userinfo/left";
	}

	@RequestMapping("/userInfoMain.action")
	public String userinfoMain() {
		return "/userinfo/main";
	}

	@RequestMapping("/userinfo.action")
	public String userinfoAction() {
		return "/userinfo/fmain_user_info";
	}

	@RequestMapping("/toUserInfoUpdate.action")
	public String toUserInfoUpdate() {

		return "/userinfo/jUserInfoUpdate";
	}

}
