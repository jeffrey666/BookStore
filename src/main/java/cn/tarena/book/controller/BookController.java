package cn.tarena.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.service.BookInfoService;

@Controller
public class BookController {

	@Autowired
	private BookInfoService bookInfoService;
	@RequestMapping("/topsellers")
    public String topsellers(Model model){
		//根据借阅次数查找次数最多的书籍
		List<Book>bookList=bookInfoService.findAllByCount();
		for (Book book : bookList) {
			System.out.println(book);
		}
		model.addAttribute("bookList", bookList);
    	return "borrowlist";
    }
}
