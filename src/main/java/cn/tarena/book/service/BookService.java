package cn.tarena.book.service;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface BookService {


	void updateState(String bookId);

	void updateDate(String bookId);
	
	Book findOne(String bookId);

	void updateBorrower(String userId, String bookId);

	void addHistory(String userId, String bookId);


}
