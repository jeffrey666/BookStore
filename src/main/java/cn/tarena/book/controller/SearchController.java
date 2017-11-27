package cn.tarena.book.controller;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.service.SearchService;
import cn.tarena.book.service.UserService;

@Controller
@RequestMapping("/search")
public class SearchController extends BaseController{

	@Autowired
	private SearchService searchService;
	@Autowired
	private UserService userService;
	
	
	@RequestMapping("/search")
	public String searchBooks(Book book,Model model){
		model.addAttribute("book",book);
		List<Book> books = searchService.findAll(book);
		System.out.println(books);
		model.addAttribute("books",books);
		return "search";
	}
	
	

	
	/**
	 * 在图书详情页面用户点击借书按钮时，实现该过程
	 * @param userId：用户id
	 * @param bookId：图书id
	 * @param model：转发到页面需要的信息
	 * @return 转发到的URL
	 */
	@RequestMapping("/toborrow")
	public String toborrow(Date borrowDate,Date returnTime,String userId,String bookId,Model model) {
		//通过bookId找到拥有者
		User user=searchService.findUserByBookId(bookId);
		//通过bookId更改图书state
		searchService.updateState(bookId);
		//通过bookId更改图书的借阅时间和归还期限
		searchService.updateDate(bookId,borrowDate,returnTime);
		//将借阅人的信息添加到借阅关联表中
		searchService.updateBorrower(userId,bookId);
		//用户扣去相应的积分
		searchService.deduct(userId);
		//图书拥有者得到相应的积分
		searchService.gain(user);
		//在历史记录中添加该条借阅信息
		searchService.addHistory(userId,bookId,borrowDate,returnTime);
		//将图书拥有者的信息添加到model中，以便在页面中显示持有人的信息，让用户能通过页面与图书拥有者联系
		model.addAttribute("user", user);
		//转发到拥有者详情页面
		return "/userinfo";
	}
	/**
	 * 图书详情页面：点击搜索出的书籍列表上的图书时，进入到图书详情页面
	 * @param bookId
	 * @param model
	 * @return
	 */
	@RequestMapping("/toview")
	public String toview(String bookId,Model model) {
		//通过bookId找到该图书
		Book book=searchService.findOne(bookId);
		//将图书添加到model中，以便在图书详情页面上使用
		model.addAttribute("book", book);
		//将当前时间设为借书时间
		Date borrowDate =new Date();
		//当前时间加上借书时间为还书期限
		Date returnTime=borrowDate;
		model.addAttribute("borrowDate", borrowDate);
		model.addAttribute("returnTime", returnTime);
		//转发到图书详情页面
		return "/tobookview";
	}
	

}
