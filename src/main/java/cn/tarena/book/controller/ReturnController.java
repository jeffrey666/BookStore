package cn.tarena.book.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.service.BookService;
import cn.tarena.book.service.UserService;

@Controller
@RequestMapping("/return")
public class ReturnController extends BaseController {
	@Autowired
	private BookService bookService;
	@Autowired
	private UserService userService;

	/**
	 *还书功能 
	 * @param book  选中书本
	 * @return
	 */
	@RequestMapping("/return")
	public String toview(String bookId, Model model) {
		Book book=bookService.findOne(bookId);
		if(book.getState()==1){
		Date currentTime = new Date();
//		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String dateString = formatter.format(currentTime);
		bookService.updateBookState(currentTime,bookId);
		}
		return "redirect:/search/borrowed";
	}

}
