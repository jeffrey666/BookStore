package cn.tarena.book.service;

import org.springframework.stereotype.Service;

import cn.tarena.book.pojo.Book;
@Service
public class BookServiceImpl implements BookService {

	@Override
	public void save(Book book) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateState(String bookId) {

	}

	@Override
	public void updateDate(String bookId) {

	}

	@Override
	public void updateBorrower(String userId, String bookId) {

	}

	@Override
	public void addHistory(String userId, String bookId) {

	}

	@Override
	public Book findOne(String bookId) {
		return null;
	}

}
