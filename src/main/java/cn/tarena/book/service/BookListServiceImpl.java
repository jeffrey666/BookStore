package cn.tarena.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.tarena.book.mapper.BookMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.utils.PageBean;
@Service
public class BookListServiceImpl implements BookListService {
	@Autowired
	private BookMapper bookMapper;
	@Override
	public PageBean<Book> findBookList(Integer currentPage,Integer pageSize) {
		
	//设置分页信息，分别是当前页数和每页显示的总记录数【记住：必须在mapper接口中的方法执行之前设置该分页信息】
		if(currentPage==null){
			currentPage=1;
		}
		if(pageSize==null){
			pageSize=5;
		}
	  PageHelper.startPage(currentPage, pageSize);
      
      List<Book> books = bookMapper.findAllBookBySeller();       //全部商品
      int countNums = bookMapper.countBook();            //总记录数
      PageBean<Book> pageData = new PageBean<Book>(currentPage, pageSize, countNums);
      //将全部的书籍存进pageData，自动会截取需要的书籍出来
      pageData.setItems(books);
     return pageData;
		
	}
	
}
