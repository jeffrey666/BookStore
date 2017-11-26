package cn.tarena.book.service;

import cn.tarena.book.pojo.Book;

public interface BookService {

	void saveBookUpload(Book book);
	
	void saveBookAndUser(String userId, String bookId);


}
