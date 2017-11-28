package cn.tarena.book.service;

import java.util.Date;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;

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
	/**
	 * 删除我拥有的书
	 * @param string 
	 * @param ids:书本的Id
	 */
	void deleteMyBook(String[] ids, String string);

	/**
	 * 根据选中书本Id改变书本借阅状态
	 * @param dateString 
	 * @param bookId :选中书本的Id
	 * @return
	 */
	public void updateBookState(Date date, String bookId);

	Book findOne(String bookId);

}
