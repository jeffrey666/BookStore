package cn.tarena.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tarena.book.service.UserService;

@Controller
public class HelloController {

	@Autowired
	private UserService userService;

	@RequestMapping("/hello")
	@ResponseBody //可以返回字符串到页面中
	public String hello() {
		String str = userService.findAllUser().toString();
		return str;
	}

	@RequestMapping("/")
	public String index() {
		return "index";
	}

}
