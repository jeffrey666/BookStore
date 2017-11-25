package cn.tarena.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;

@Controller
public class BookUploadController {

	@RequestMapping("saveBookUpload")
	public String saveBookUpload(Book book){
		
		return "index";
	}
}
