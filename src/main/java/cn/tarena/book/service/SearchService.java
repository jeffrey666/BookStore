package cn.tarena.book.service;

import java.util.Date;
import java.util.List;


import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface SearchService {
	/**
	 * @param book:查询条件的封装
	 * @return
	 */

	List<Book> findAll(Book book);
	
	/******************************/

	/**
	 * 根据bookId查找图书的拥有人
	 * @param bookId
	 * @return：图书拥有者的对象
	 */

	User findUserByBookId(String bookId);
	/**
	 * 通过userId扣去用户积分
	 * @param userId
	 */
	void deduct(String userId);
	/**
	 * 通过userId给用户增加积分
	 * @param user
	 */
	void gain(User user);
	/**
	 * 通过userId找到对应的用户
	 * @param userId
	 * @return
	 */
	User findUser(String userId);
	/**
	 * 通过bookId改变书的状态
	 * @param bookId
	 */
	void updateState(String bookId);
	/**
	 * 通过bookId更改书的借书日期和归还期限
	 * @param bookId
	 */
	void updateDate(String bookId,Date borrowDate,Date returnTime);
	/**
	 * 通过bookId找到书的详细信息
	 * @param bookId
	 * @return
	 */
	Book findOne(String bookId);
	/**
	 * 将图书的借阅信息添加到历史记录中
	 * @param userId：借书人的id
	 * @param bookId：图书的id
	 */
	void addHistory(String userId, String bookId,Date borrowDate,Date returnDate);
	/**
	 * 将借阅信息添加到借阅关联表中
	 * @param userId：借书人的id
	 * @param bookId：图书id
	 */
	void updateBorrower(String userId, String bookId);
	
	/******************************/
}
