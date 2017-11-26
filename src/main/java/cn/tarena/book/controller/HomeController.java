package cn.tarena.book.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.UserInfo;
import cn.tarena.book.service.BookInfoService;

@Controller
public class HomeController {
	
	@Autowired
	private BookInfoService bookInfoService;
	
    @RequestMapping("/")
    public String index() {
        return "/index";
    }
    
    @RequestMapping("/toregist")
    public String regist() {
        return "/regist";
    } 

    @RequestMapping("/login")
	public String toLogin(){
		return "login";
	}

    
    @RequestMapping("details")
    public String details(){
    	return "/details";
    }
    
    @RequestMapping("/tologin")
    public String login(){
    	return "/login";
    }
    
    @RequestMapping("/bookupload")
    public String upload(){
    	return "/bookupload";
    }

    
    @RequestMapping("tosearch")
    public String tosearch(){
    	
    	return "/search";
    }

    @RequestMapping("/tocart")
	public String tocart(Model model){
		
		List<Book> books = bookInfoService.tocart("1");
		model.addAttribute("books",books);
		System.out.println("=============="+books.get(1).getBookInfo().getImgurl());
		return "cart";
	}
    
    @RequestMapping("/tocategory")
    public String category(){
    	return "/category";
    }
    @RequestMapping("/topsellers")
    public String topsellers(){
    	return "sellers";
    }

    


}
