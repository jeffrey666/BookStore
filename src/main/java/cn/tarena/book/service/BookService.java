package cn.tarena.book.service;

import cn.tarena.book.pojo.Book;

public interface BookService {

	/**
	 * 将用户上传的图书保存
	 * @param book
	 */
	public void saveBook(Book book);

}
