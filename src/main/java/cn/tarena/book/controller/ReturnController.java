package cn.tarena.book.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;
import cn.tarena.book.service.BookInfoService;
import cn.tarena.book.service.UserService;

@Controller
@RequestMapping("/return")
public class ReturnController extends BaseController {
	@Autowired
	private BookInfoService bookInfoService;
	@Autowired
	private UserService userService;

	/**
	 * 在图书详情页面用户点击借书按钮时，实现该过程
	 * 
	 * @param userId：用户id
	 * @param bookId：图书id
	 * @param model：转发到页面需要的信息
	 * @return 转发到的URL
	 */
	@RequestMapping("/toreturn")
	public String toborrow(String userId, Model model){
		List<Book> books = userService.findMyBookListByUserIdReturn(userId);
		model.addAttribute("books", books);
		List<BookInfo> bookInfos = bookInfoService.findAll();
		model.addAttribute("bookInfos", bookInfos);
		return "/return";
	}

	/**
	 * 图书详情页面：点击搜索出的书籍列表上的图书时，进入到图书详情页面
	 * 
	 * @param bookId
	 * @param model
	 * @return
	 */
	@RequestMapping("/return")
	public String toview(String bookId, Model model) {

		return "redirect:return";
	}

}
