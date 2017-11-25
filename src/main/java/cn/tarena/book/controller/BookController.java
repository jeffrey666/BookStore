package cn.tarena.book.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.service.BookService;


@Controller
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	
	@RequestMapping("/toupload")
	public String toupload(){
		return "/upload";
	}
	
	@RequestMapping("upload")
	public String upload(Book book){
		bookService.saveBook(book);
		return "/";
	}
	
	
}
