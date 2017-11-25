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
		// TODO Auto-generated method stub

	}

	@Override
	public void updateDate(String bookId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateBorrower(String userId, String bookId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addHistory(String userId, String bookId) {
		// TODO Auto-generated method stub

	}

	@Override
	public Book findOne(String bookId) {
		// TODO Auto-generated method stub
		return null;
	}

}
