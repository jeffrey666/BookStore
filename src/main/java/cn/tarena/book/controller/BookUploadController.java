package cn.tarena.book.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;
import cn.tarena.book.pojo.User;
import cn.tarena.book.service.BookInfoService;
import cn.tarena.book.service.BookService;
import cn.tarena.book.user.annotation.RequireRole;
import cn.tarena.book.utils.FileUpload;
import cn.tarena.book.utils.PageBean;


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
			
			//获取当前登录用户		
			User user =(User) session.getAttribute("_CURRENT_USER"); 
			String userID =user.getId();
			
			//保存书籍、书籍详情及用户书籍关联的信息
			bookService.saveBookAndUser(userID,book);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 	
		return "redirect:/";
	}
	
	//榜单下载功能
	@RequestMapping("/list.action")
	public void print(HttpServletResponse response,HttpSession session) throws IOException {
		PageBean<Book> pageBean = (PageBean<Book>) session.getAttribute("pageBean");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String inputDate = sdf.format(new Date());
		
		//获取工作蒲
		Workbook wb = new HSSFWorkbook();

		//获取单元格
		Sheet sheet = wb.createSheet();
		// 行
		Row nRow = null;
		// 列
		Cell nCell = null;

		//行号
		int rowNo = 0;
		//列好
		int colNo = 1;

		// 声明样式对象和字体对象
		CellStyle nStyle = wb.createCellStyle();
		Font font = wb.createFont();

		// 列宽
		sheet.setColumnWidth(0, 2 * 300);
		sheet.setColumnWidth(1, 5 * 300);
		sheet.setColumnWidth(2, 18 * 300);
		sheet.setColumnWidth(3, 10 * 300);
		sheet.setColumnWidth(4, 10 * 300);
		sheet.setColumnWidth(5, 18 * 300);

		// 大标题，合并单元格
		sheet.addMergedRegion(new CellRangeAddress(0, 0, 1, 5)); // 开始行，结束行，开始列，结束列
		// 合并单元格的内容写在合并前第一个单元格中
		nRow = sheet.createRow(rowNo++);

		//设置大标题高度
		nRow.setHeightInPoints(36);
		nCell = nRow.createCell(1);
		//切割标题
		String[] str = inputDate.split("-");
		//设置大标题
		nCell.setCellValue(str[0]+"年"+str[1]+"月"+str[2]+"日借阅榜单");

		//
		nCell.setCellStyle(this.bigTitle(wb, nStyle, font));

		String[] title = new String[] { "序号","书籍名称","书籍作者","书籍状态","书籍借阅次数" };

		//创建表中指定行
		nRow = sheet.createRow(rowNo++);

		//设置标题高度
		nRow.setHeightInPoints(26.25f);

		// 初始化
		nStyle = wb.createCellStyle();
		font = wb.createFont();

		//
		for (int i = 0; i < title.length; i++) {
			nCell = nRow.createCell(i + 1);
			nCell.setCellValue(title[i]);
			nCell.setCellStyle(this.Title(wb, nStyle, font));
		}

		// 初始化
		nStyle = wb.createCellStyle();
		font = wb.createFont();
		
		//序号
		int index = 1;
		// 换行
		for (int j = 0; j < pageBean.getItems().size(); j++) {
			Book book = pageBean.getItems().get(j);
			colNo = 1;

			nRow = sheet.createRow(rowNo++);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue((pageBean.getCurrentPage()-1)*pageBean.getPageSize()+index++);
			nCell.setCellStyle(this.Text(wb, nStyle, font));
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(book.getBookName());
			nCell.setCellStyle(this.Text(wb, nStyle, font));

			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(book.getBookInfo().getAuthor());
			nCell.setCellStyle(this.Text(wb, nStyle, font));

			if(book.getState()==0){
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue("未借");
			nCell.setCellStyle(this.Text(wb, nStyle, font));
			}else{
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue("以借");
				nCell.setCellStyle(this.Text(wb, nStyle, font));
			}
				
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(book.getBookInfo().getBorrowCount());
			nCell.setCellStyle(this.Text(wb, nStyle, font));

		}

		// OutputStream os=new FileOutputStream(new File("D:\\outProduct.xls"));
		
		// 下载
		PageBean<Book> pb = new PageBean<Book>();
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		response.setContentType("text/html;charset=gbk");
		wb.write(os);
		String name = inputDate+"榜单.xls";
		name=new String(name.getBytes("GBK"),"iso-8859-1");// 转换后的目录名或文件名。
		pb.download(os, response, name);

	}

	//大标题的样式
	public CellStyle bigTitle(Workbook wb, CellStyle nStyle, Font font) {
		font.setFontName("宋体");
		font.setFontHeightInPoints((short) 16);
		//字体加粗
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		//横向居中
		nStyle.setAlignment(CellStyle.ALIGN_CENTER);
		//纵向居中
		nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER); //单元格垂直居中

		nStyle.setFont(font);
		return nStyle;
	}

	//标题样式
	public CellStyle Title(Workbook wb, CellStyle nStyle, Font font) {
		font.setFontName("黑体");
		font.setFontHeightInPoints((short) 12);

		//横向居中
		nStyle.setAlignment(CellStyle.ALIGN_CENTER);
		//表格线
		nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER); //单元格垂直居中

		//表格线
		nStyle.setBorderTop(CellStyle.BORDER_THICK);//单元格垂直居中
		nStyle.setBorderBottom(CellStyle.BORDER_THIN);//单元格垂直居中
		nStyle.setBorderLeft(CellStyle.BORDER_THIN);//单元格垂直居中
		nStyle.setBorderRight(CellStyle.BORDER_THIN);//单元格垂直居中

		nStyle.setFont(font);
		return nStyle;
	}

	//文字样式
	public CellStyle Text(Workbook wb, CellStyle nStyle, Font font) {
		//文字样式
		font.setFontName("Times New Roman");
		font.setFontHeightInPoints((short) 10);

		//横向居中
		nStyle.setAlignment(CellStyle.ALIGN_CENTER);
		 //纵向居中
		nStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER); // 鍗曞厓鏍煎瀭鐩村眳涓�

		//表格线

		nStyle.setBorderBottom(CellStyle.BORDER_THIN); //实线
		nStyle.setBorderLeft(CellStyle.BORDER_THIN); //比较粗实线
		nStyle.setBorderRight(CellStyle.BORDER_THIN); //实线

		nStyle.setFont(font);
		return nStyle;
	}
	
	/**
	 * 删除我拥有的书本
	 * @param ids jsp页面传来需要删除的书本id
	 * @return
	 */
	@RequestMapping("/deleteMyBook.action")        
	public String deleteMyBook(@RequestParam(value="bookId",required=false)String[] ids,HttpSession session){
	
		if(ids!=null){
			User user = (User) session.getAttribute("_CURRENT_USER");
			bookService.deleteMyBook(ids,user.getId());
		}
		
		return "redirect:/tocart";
	}
	
}
