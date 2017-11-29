package cn.tarena.book.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.service.BookListService;
import cn.tarena.book.utils.PageBean;

@Controller
public class ListController {
	
	@Autowired
	private BookListService bookListService;
	
	@RequestMapping("/findlist")
	public String list(Integer currentPage,Integer pageSize,HttpSession session){
		
		PageBean<Book> pageBean=bookListService.findBookList(currentPage,pageSize);
		
		session.setAttribute("pageBean",pageBean);
		return "borrowlist";
		
	}
}
