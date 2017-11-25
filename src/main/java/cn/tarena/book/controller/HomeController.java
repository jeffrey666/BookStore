package cn.tarena.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
    @RequestMapping("/")
    public String index() {
        return "/index";
    }
    
    @RequestMapping("/toregist")
    public String regist() {
        return "/regist";
    } 
    
    @RequestMapping("details")
    public String details(){
    	return "/details";
    }
    
    @RequestMapping("/tologin")
    public String login(){
    	return "/login";
    }
    

    @RequestMapping("toupload")
    public String upload(){
    	return "/bookupload";
    }

    @RequestMapping("/tocart")
    public String cart(){
    	return "/cart";
    }
    
}
