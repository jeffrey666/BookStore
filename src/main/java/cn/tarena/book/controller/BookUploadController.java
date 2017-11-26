package cn.tarena.book.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.tarena.book.pojo.Book;

import cn.tarena.book.pojo.BookInfo;

import cn.tarena.book.service.BookInfoService;
import cn.tarena.book.service.BookService;
import cn.tarena.book.service.UserService;

@Controller
public class BookUploadController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private BookService bookService;
	@Autowired
	private BookInfoService bookInfoService;

	
	@RequestMapping("saveBookUpload")
	public String upload(Book book,HttpServletRequest request,MultipartFile picFile,HttpSession session){
		
		try {
			//获取文件名称
			String filename=picFile.getOriginalFilename();
			//设置文件存放路径
			String uploadDir=request.getSession().getServletContext().getRealPath("/upload/");
			//生成路径
			File dir=new File(uploadDir);
			if(!dir.exists()){
				dir.mkdir();
			}
			//图片上传
			File serverFile=new File(uploadDir+filename);
			picFile.transferTo(serverFile);
			
			//获取书籍图片全路径
			String imgurl=uploadDir+filename;
			book. getBookInfo().setImgurl(imgurl);
			String Id=UUID.randomUUID().toString();
			book.setBookId(Id);
			//新增书数据保存为(未借)
			book.setState(0);
			
			//保存书籍用户关系表
			bookService.saveBookAndUser("1",book.getBookId());
			
			BookInfo bookInfo =book.getBookInfo();
			bookInfo.setBookInfoId(Id);
			//把书籍信息存到书籍表
			bookService.saveBookUpload(book);
			
			//把书籍信息存到书籍详情表
			bookInfoService.saveBookUpload(bookInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return "index";
	}
	

	

	
}
