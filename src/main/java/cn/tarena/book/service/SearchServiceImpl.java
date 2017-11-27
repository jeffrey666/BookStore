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
	public void deduct(String userId) {
		searchMapper.deduct(userId);
	}

	@Override
	public void gain(User user) {
		searchMapper.gain(user);
	}

	@Override
	public User findUser(String userId) {
		return searchMapper.findUser(userId);
	}

	@Override
	public void updateState(String bookId) {
		searchMapper.updateState(bookId);
	}

	@Override
	public void updateDate(String bookId,Date borrowDate,Date returnTime) {
		searchMapper.updateDate(bookId,borrowDate,returnTime);
	}

	@Override
	public Book findOne(String bookId) {
		return searchMapper.findOne(bookId);
	}

	@Override
	public void addHistory(String userId, String bookId,Date borrowDate,Date returnDate) {
		searchMapper.addHistory(userId,bookId,borrowDate,returnDate);
	}

	@Override
	public void updateBorrower(String userId, String bookId) {
		searchMapper.updateBorrower(userId,bookId);
	}
	/******************************/

	
	
	

}
