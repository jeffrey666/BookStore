package cn.tarena.book.service;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.tarena.book.mapper.SearchMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.utils.PageBean;
@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchMapper searchMapper;
	
	@Override
	public PageBean findAllByConditions(Book book,Integer currentPage){
		//设置分页信息，分别是当前页数和每页显示的总记录数【记住：必须在mapper接口中的方法执行之前设置该分页信息】
		//搜索页面的每页显示数据固定为6条
		if(currentPage==null){
			currentPage = 1;
		}
		int pageSize = 6;
		PageHelper.startPage(currentPage, pageSize);
		List<Book> books = searchMapper.findAll(book);
		Integer count = searchMapper.findBooksNum(book);
		PageBean<Book> pageBean = new PageBean<Book>(currentPage,pageSize,count);
		pageBean.setItems(books);
		return pageBean;
	}
	
	
	@Override
	public List<Book> findAllBookBySeller() {
		return searchMapper.findAllBookBySeller();
	}
	
	
	
	/******************************/

	
	@Override
	public User findUserByBookId(String bookId) {

		return searchMapper.findUserByBookId(bookId);
	}

	@Override
	public void deduct(User loginUser) {
		searchMapper.deduct(loginUser);
	}

	@Override
	public void gain(User user) {
		searchMapper.gain(user);
	}

	@Override
	public void updateState(String bookId) {
		searchMapper.updateState(bookId);
	}

	@Override
	public void updateDate(String bookId) {
		Date borrowDate=new Date();
		Date returnDate=new Date();
		long time =2592000000L;
		returnDate.setTime(time+borrowDate.getTime());
		searchMapper.updateDate(bookId,borrowDate,returnDate);
	}

	@Override
	public Book findOne(String bookId) {
		return searchMapper.findOne(bookId);
	}

	@Override
	public void addHistory(String bookId, User user, User loginUser) {
		Date borrowDate=new Date();
		searchMapper.addHistory(bookId,user,loginUser,borrowDate);
	}

	@Override
	public void updateBorrower(String bookId,User loginUser) {
		searchMapper.updateBorrower(bookId,loginUser);
	}
	
	@Override
	public List<Book> findAllBorrowed(String loginUserId) {
		return searchMapper.findAllBorrowed(loginUserId);
	}
	/******************************/






	
	
	

}
