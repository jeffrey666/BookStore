package cn.tarena.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
    @RequestMapping("/")
    public String index() {
        return "/index";
    }
    
    @RequestMapping("/regist")
    public String regist() {
        return "/regist";
    } 
    @RequestMapping("/toupload")
    public String toupload(){
    	return "bookupload";
    }
}
