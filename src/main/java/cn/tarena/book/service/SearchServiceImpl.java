package cn.tarena.book.service;

import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.SearchMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchMapper searchMapper;
	
	@Override
	public List<Book> findAll(Book book) {
		
		return searchMapper.findAll(book);
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
