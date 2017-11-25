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
	 public String bookupload(){
	    	return "/bookupload";
	 }
	
	/* @RequestMapping("/toupload")
	 public String toupload(Book book){
		 bookService.save(book);
		 return "";
	 }*/
	
}
