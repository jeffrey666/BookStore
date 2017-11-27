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
import cn.tarena.book.pojo.User;
import cn.tarena.book.service.BookInfoService;
import cn.tarena.book.service.BookService;
import cn.tarena.book.utils.FileUpload;


@Controller
public class BookUploadController  extends BaseController{
	
	@Autowired
	private BookService bookService;
	@Autowired
	private BookInfoService bookInfoService;
	/**
	 * 图书上传
	 * @param book
	 * @param request
	 * @param picFile
	 * @param session
	 * @return
	 */
	@RequestMapping("saveBookUpload")
	public String upload(HttpSession session,Book book,HttpServletRequest request,MultipartFile picFile){
		
		try {

			//生成八级目录
			String path=FileUpload.filePhoto(); 

			//获取文件名称
			String filename=picFile.getOriginalFilename();
			
			//设置文件存放路径
			String uploadDir=request.getSession().getServletContext().getRealPath("/upload")+path;
			//生成路径
			File dir=new File(uploadDir);
			if(!dir.exists()){
				dir.mkdirs();
			}
			//图片上传  
			File serverFile=new File(uploadDir+"/"+filename);
			picFile.transferTo(serverFile);
			
			//获取书籍图片全路径
			String imgurl="\\upload"+path+"\\"+filename;
			//给图片设置路径
			book. getBookInfo().setImgurl(imgurl);
			//设置书本的ID
			String Id=UUID.randomUUID().toString();
			book.setBookId(Id);
			//新增书数据保存为(未借)
			book.setState(0);
			
			//获取当前登录用户		
			User user =(User) session.getAttribute("_CURRENT_USER"); 
			String userID =user.getId();
			//保存书籍用户关系表
			bookService.saveBookAndUser(userID,book.getBookId());
			
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
