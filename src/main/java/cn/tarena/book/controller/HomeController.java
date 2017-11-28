package cn.tarena.book.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.pojo.UserInfo;
import cn.tarena.book.service.BookInfoService;

import cn.tarena.book.service.BookListService;

import cn.tarena.book.user.annotation.RequireRole;


@Controller
public class HomeController {

	@Autowired
	private BookInfoService bookInfoService;
	
	@Autowired
	private BookListService bookListService;

	@RequestMapping("/")
	public String index(Model model) {
		List<Book> BookList =bookInfoService.findNewBooks();
		model.addAttribute("BookList", BookList);
		return "/index";
	}

	@RequestMapping("/toregist")
	public String regist() {
		return "/regist";
	}

	@RequestMapping("/login")
	public String toLogin() {
		return "login";
	}

	@RequestMapping("details")
	public String details(String bookId,Model model) {
		Book book =bookInfoService.findOneByBookId(bookId);
		model.addAttribute("book",book);
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

	@RequestMapping("tosearch")
	public String tosearch() {

		return "/search";
	}

	@RequestMapping("/tocart")
	public String tocart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("_CURRENT_USER");
		
		session.setAttribute("num", 1);
		List<Book> books = bookInfoService.tocart(user.getId(), 0, 4);
		model.addAttribute("books", books);
		System.out.println(books.get(0).getBookInfo().getPubDate()+"====================================");
		return "cart";
	}

	@RequestMapping("lastTocart")
	public String lastTocart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("_CURRENT_USER");
		int num = (int) session.getAttribute("num")-1;
		if (num < 1) {
			return "redirect:tocart";
		}
		Integer line = bookInfoService.line(user.getId());
		int[] column = getColumn(line, num);
		List<Book> books = bookInfoService.tocart(user.getId(), column[0], column[1]);
		model.addAttribute("books", books);
		session.setAttribute("num",num);
		return "cart";
	}

	@RequestMapping("nextTocart")
	public String nextTocart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("_CURRENT_USER");
		int num = (int) session.getAttribute("num")+1;
		int line = bookInfoService.line(user.getId());
		int number = line/4+1;
		if (num > number) {
			num=num-1;
			int[] column = getColumn(line, num);
			List<Book> books = bookInfoService.tocart(user.getId(), column[0], column[1]);
			model.addAttribute("books", books);
			session.setAttribute("num",num);
			return "cart";
		}
		int[] column = getColumn(line, num);
		List<Book> books = bookInfoService.tocart(user.getId(), column[0], column[1]);
		model.addAttribute("books", books);
		session.setAttribute("num",num);
		return "cart";
	}


	@RequestMapping("/tocategory")
	public String category() {
		return "/category";
	}

	@RequestMapping("/topsellers")
	public String topsellers() {
		return "sellers";
	}
	
	
	public int[] getColumn(int line, int i) {
		int[] arr = new int[2];
		arr[0] = (i - 1) * 4;
		if (line - i * 4 + 4 >= 0) {
			arr[1] = 4;
		} else {
			arr[1] = line - arr[0];
		}
		return arr;
	}

}
