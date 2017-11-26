package cn.tarena.book.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.service.BookService;

@Controller
public class BookUploadController {

	private BookService bookService;
	@RequestMapping("saveBookUpload")
	public String saveBookUpload(Book book){
		
		return "index";
	}
	
	@RequestMapping("/tocart")
	public String saveBookUpload(String userId){
		
		List<Book> books = bookService.findCartAll(userId);
		
		return "";
	}
}
