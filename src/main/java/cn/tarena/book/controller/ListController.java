package cn.tarena.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.utils.PageBean;

@Controller
public class ListController {
	
	@Autowired
	private BookListService bookListService;
	
	@RequestMapping("/findlist")
	public String list(Integer currentPage,Integer pageSize,Model model){
		
		PageBean<Book> pageBean=bookListService.findBookList(currentPage,pageSize);
		
		model.addAttribute("pageBean",pageBean);
		List<Book> books =pageBean.getItems();
		return "borrowlist";
	}
}
