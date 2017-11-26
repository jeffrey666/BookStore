package cn.tarena.book.service;

import java.util.List;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface BookService {


	public void updateState(String bookId);

	public void updateDate(String bookId);
	
	public Book findOne(String bookId);

	public void updateBorrower(String userId, String bookId);

	public void addHistory(String userId, String bookId);

	public List<Book> findCartAll(String userId);


}
