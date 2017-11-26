package cn.tarena.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.BookMapper;
import cn.tarena.book.pojo.Book;
@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;

	@Override
	public void updateState(String bookId) {

	}

	@Override
	public void updateDate(String bookId) {

	}

	@Override
	public Book findOne(String bookId) {
		return null;
	}

	@Override
	public void updateBorrower(String userId, String bookId) {

	}

	@Override
	public void addHistory(String userId, String bookId) {
		
	}

	@Override
	public List<Book> findCartAll(String userId) {
		
		return bookMapper.findCartAll(userId);
	}

}
