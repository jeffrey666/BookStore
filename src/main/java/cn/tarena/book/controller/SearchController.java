package cn.tarena.book.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.service.SearchService;

@Controller
@RequestMapping("/search/")
public class SearchController extends BaseController{

	@Autowired
	private SearchService searchService;

	/**
	 * @param book:查询条件
	 * @param model：回传数据
	 * @return：返回搜索结果并返回搜索页面
	 */
	
	@RequestMapping("/search")
	public String searchBooks(Book book,Model model){
		model.addAttribute("book",book);
		List<Book> books = searchService.findAll(book);
		model.addAttribute("books",books);
		return "search";
	}
	
	

	/**
	 * 用户点击借书按钮后拦截该方法
	 * @param httpSession
	 * @param bookId
	 * @return
	 */
	@RequestMapping("/toborrow")
	public String toborrow(String bookId,HttpSession httpSession) {
		//调用service层的方法实现该过程
		searchService.toborrow(bookId,httpSession);
		//重定向到用户当前借阅书籍页面
		return "redirect:/search/borrowed";
	}
	/**
	 * 跳转到已借图书
	 * @param httpSession：取登录用户的信息
	 * @param model：将图书信息添加到model中以便下一个页面使用
	 * @return：当前借阅图书
	 */
	@RequestMapping("/borrowed")
	public String borrowed(HttpSession httpSession,Model model) {
		User loginUser=(User)httpSession.getAttribute("_CURRENT_USER");
		String loginUserId=loginUser.getId();
		List<Book> books=searchService.findAllBorrowed(loginUserId);
		System.out.println(books);
		model.addAttribute("books", books);
		return "/bookinfos";
		
	}
	/**
	 * 测试方法
	 * @return
	 */
	@RequestMapping("/tobook")
	public String toview() {
		return "bookinfos";
	}
  
}
