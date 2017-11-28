package cn.tarena.book.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.service.SearchService;
import cn.tarena.book.utils.MailUtils;

@Controller
@RequestMapping("/search/")
public class SearchController extends BaseController{

	@Autowired
	private SearchService searchService;
	@Autowired
	private MailUtils mailUtils;
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
	 * 在图书详情页面用户点击借书按钮时，实现该过程
	 * @param userId：用户id
	 * @param bookId：图书id
	 * @param model：转发到页面需要的信息
	 * @return 转发到的URL
	 */
	@RequestMapping("/toborrow")
	public String toborrow(HttpSession httpSession,String bookId) {
		//通过session获取登录用户
		User loginUser=(User)httpSession.getAttribute("_CURRENT_USER");
		//通过bookId找到拥有者
		User user=searchService.findUserByBookId(bookId);
		//通过bookId更改图书state
		searchService.updateState(bookId);
		//通过bookId更改图书的借阅时间和归还期限
		searchService.updateDate(bookId);
		//将借阅人的信息添加到借阅关联表中
		searchService.updateBorrower(bookId,loginUser);
		//登录用户扣去相应的积分
		searchService.deduct(loginUser);
		//图书拥有者得到相应的积分
		searchService.gain(user);
		//在历史记录中添加该条借阅信息
		searchService.addHistory(bookId,user,loginUser);
		//重定向到用户当前借阅书籍页面
		return "redirect：/search/borrowed";
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
	
	/**
	 * 测试发送邮件
	 */
	@RequestMapping("/mail")
	public String e(){
		return "sendemail";
	}

    
    @RequestMapping("/sendemail")
    @ResponseBody
    public String sendMail(String email) throws Exception{
        mailUtils.sendSimpleMail(email);
        return "success";
    }
}
