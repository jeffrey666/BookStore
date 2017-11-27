package cn.tarena.book.service;

import cn.tarena.book.pojo.Book;

public interface BookService {
	/**
	 * 保存书籍信息
	 * @param book：书籍对象
	 */
	void saveBookUpload(Book book);
	
	/**
	 * 保存书籍和用户的关系
	 * @param userId:用户的id
	 * @param bookId:书籍的id
	 */
	void saveBookAndUser(String userId, String bookId);


}
