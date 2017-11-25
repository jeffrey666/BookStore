package cn.tarena.book.controller;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.User;
import cn.tarena.book.pojo.UserInfo;

@Controller
public class UserController {

	@PostConstruct
	public void developTestInit(HttpSession session) {}

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
