package cn.tarena.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {

	@RequestMapping("topsellers")
	public String bookHot(){
		
		return "borrowlist";
	}
}
