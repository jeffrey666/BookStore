package cn.tarena.jieshu.controller;

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

}
