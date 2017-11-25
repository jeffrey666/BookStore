package cn.tarena.book.service;

import cn.tarena.book.pojo.Book;

public interface BookService {
	/**
	 * 将用户上传的图书保存
	 * @param book
	 */
	void save(Book book);

	void updateState(String bookId);

	void updateDate(String bookId);

	void updateBorrower(String userId, String bookId);

	void addHistory(String userId, String bookId);

	Book findOne(String bookId);
	
	
}
