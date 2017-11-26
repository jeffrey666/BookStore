package cn.tarena.book.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ch.qos.logback.core.util.FileUtil;
import cn.tarena.book.pojo.Book;

import cn.tarena.book.pojo.User;
import cn.tarena.book.service.BookInfoService;
import cn.tarena.book.service.BookService;
import cn.tarena.book.service.UserService;
import cn.tarena.book.utils.FileUpload;

@Controller
public class BookUploadController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;
	@Autowired
	private BookInfoService bookInfoService;

	/*public @ResponseBody String upload(HttpServletRequest request,MultipartFile file){
		
		try {
			String uploadDir=request.getSession().getServletContext().getRealPath("/")+"upload/";
			File dir=new File(uploadDir);
			if(!dir.exists()){
				dir.mkdir();
			}
			String filename=file.getOriginalFilename();
			File serverFile=new File(uploadDir+filename);
			file.transferTo(serverFile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "上传失败";
		} 
		return "shangchu"
	}
	*/
	@RequestMapping("saveBookUpload")
	public String registAction(MultipartFile picFile,Book book,HttpSession session,HttpServletRequest request) throws IOException{
		String path=request.getSession().getServletContext().getRealPath("upload");
		System.out.println(path);
		
		
		//把传递过来的文件保存到e盘
		FileUtils.writeByteArrayToFile(new File(path+"1.jpg"), picFile.getBytes());
		session.setAttribute("Book", book);
		//重定向
		return "success";
	}
	
	
	@RequestMapping("BookUpload")
	public String saveBookUpload(String userId,HttpSession session){
		Book book=(Book) session.getAttribute("Book");
		//测试用户1，把书籍信息和用户书籍关联表中
		userId="1";
		//设置书籍的id
		book.setBookId(UUID.randomUUID().toString());
		//新增书数据保存为(未借)
		book.setState(0);
		userService.saveBookUpload(userId,book.getBookId());
		
		//把书籍信息存到书籍表
		bookService.saveBookUpload(book);
		//把书籍信息存到书籍详情表
		bookInfoService.saveBookUpload(book);
		
		
		return "index";
	}
	
	
}
