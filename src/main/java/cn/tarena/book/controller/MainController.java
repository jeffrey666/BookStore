package cn.tarena.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/_head.action")
	public String _headAction() {
		return "_head";
	}

	@RequestMapping("/_foot.action")
	public String _footAction() {
		return "_foot";
	}

}
