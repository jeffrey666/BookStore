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
<<<<<<< HEAD
import cn.tarena.book.pojo.BookInfo;
=======
>>>>>>> 09cf4a79d592ccaa33368b2846c1a1c47d161e95
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
<<<<<<< HEAD
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
			userService.saveBookUpload("1",book.getBookId());
			
			BookInfo bookInfo =book.getBookInfo();
			bookInfo.setBookInfoId(Id);
			//把书籍信息存到书籍表
			bookService.saveBookUpload(book);
			
			//把书籍信息存到书籍详情表
			bookInfoService.saveBookUpload(bookInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
=======
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
		
>>>>>>> 09cf4a79d592ccaa33368b2846c1a1c47d161e95
		
		return "index";
	}
	
<<<<<<< HEAD

=======
	/*//跳转到上传文件的页面
	  @RequestMapping(value="/gouploadimg", method = RequestMethod.GET)
	  public String goUploadImg() {
	    //跳转到 templates 目录下的 uploadimg.html
	    return "uploadimg";
	  }
	 
	  //处理文件上传
	  @RequestMapping(value="/saveBookUpload", method = RequestMethod.POST)
	  @ResponseBody
	  public String uploadImg(@RequestParam("file") MultipartFile file,
	      HttpServletRequest request) {
	    String contentType = file.getContentType();
	    String fileName = file.getOriginalFilename();
	    System.out.println("fileName-->" + fileName);
	    System.out.println("getContentType-->" + contentType);
	    String filePath = request.getSession().getServletContext().getRealPath("upload");
	    System.out.println(filePath);
	    try {
	      FileUpload.uploadFile(file.getBytes(), filePath, fileName);
	    } catch (Exception e) {
	      // TODO: handle exception
	    }
	    //返回json
	    return "uploadimg success";
	  }*/
	
	
>>>>>>> 09cf4a79d592ccaa33368b2846c1a1c47d161e95
	
}
