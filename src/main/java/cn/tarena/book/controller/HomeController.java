package cn.tarena.book.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.service.BookInfoService;
import cn.tarena.book.service.SearchService;
import cn.tarena.book.utils.toCartUtils;



@Controller
public class HomeController {

	@Autowired
	private BookInfoService bookInfoService;
	
	@Autowired
	private SearchService searchService;

	@RequestMapping("/")
	public String index(Model model) {
		List<Book> BookList = bookInfoService.findNewBooks();
		model.addAttribute("BookList", BookList);
		return "/index";
	}

	@RequestMapping("/toregist")
	public String regist() {
		return "/regist";
	}

	@RequestMapping("/login")
	public String toLogin() {
		return "/userinfo/password";
	}

	@RequestMapping("details")
	public String details(String bookId,Model model) {
		Book book =bookInfoService.findOneByBookId(bookId);
		List<Book> bookList= bookInfoService.findRelateBooks(bookId,book.getBookInfo().getCategory());
		model.addAttribute("book",book);
		model.addAttribute("bookList", bookList);
		
		return "/details";
	}

	@RequestMapping("/tologin")
	public String login() {
		return "/login";
	}

	@RequestMapping("/bookupload")
	public String upload(HttpSession session) {
		return "/bookupload";
	}

	@RequestMapping("/tosearch")
	public String tosearch(Model model) {
		List<Book> books = searchService.findAllBookBySeller();
		model.addAttribute("books",books);
		return "/search";
	}

	// 查询仓库一次显示四页
	@RequestMapping("/tocart")
	public String tocart(Model model, HttpSession session) {
		//获取session域中的user对象
		User user = (User) session.getAttribute("_CURRENT_USER");
		//设置页面数
		session.setAttribute("num", 1);
		//获取用户图书
		List<Book> books = bookInfoService.tocart(user.getId(), 0, 4);
		model.addAttribute("books", books);
		return "cart";
	}

	// 实现上一页功能
	@RequestMapping("lastTocart")
	public String lastTocart(String method,Model model, HttpSession session) throws Exception {
		//获取session域中的对象
		User user = (User) session.getAttribute("_CURRENT_USER");
		//获取总行数
		Integer line = bookInfoService.line(user.getId());
		//获取limit(X,Y)值
		int[] column = toCartUtils.cart(session,line,method);
		//获取当前用户图书
		List<Book> books = bookInfoService.tocart(user.getId(), column[0], column[1]);
		model.addAttribute("books", books);
		return "cart";
	}

	// 实现下一页功能
	@RequestMapping("nextTocart")
	public String nextTocart(String method,Model model, HttpSession session) {
		//获取session域中的对象
		User user = (User) session.getAttribute("_CURRENT_USER");
		//获取总行数
		Integer line = bookInfoService.line(user.getId());
		//获取limit(X,Y)值
		int[] column = toCartUtils.cart(session,line,method);
		//获取当前用户图书
		List<Book> books = bookInfoService.tocart(user.getId(), column[0], column[1]);
		model.addAttribute("books", books);
		return "cart";
	}

	@RequestMapping("/tocategory")
	public String category(Model model) {
		//查询所有的书籍
		List<Book> categoryBooks =bookInfoService.findAllCategory();
		model.addAttribute("categoryBooks", categoryBooks);
		return "/category";
	}

	@RequestMapping("/topsellers")
	public String topsellers() {
		return "sellers";
	}

	
	@RequestMapping("/toborrowCart")
	public String borrowCart(){
		return "borrowCart";
	}
}

