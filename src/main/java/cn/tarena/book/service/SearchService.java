package cn.tarena.book.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	 * @param loginUser
	 */
	void deduct(User loginUser);
	/**
	 * 通过userId给用户增加积分
	 * @param user
	 */
	void gain(User user);
	/**
	 * 通过bookId改变书的状态
	 * @param bookId
	 */
	void updateState(String bookId);
	/**
	 * 通过bookId更改书的借书日期和归还期限
	 * @param bookId
	 */
	void updateDate(String bookId);
	/**
	 * 通过bookId找到书的详细信息
	 * @param bookId
	 * @return
	 */
	Book findOne(String bookId);
	/**
	 * 将借阅信息添加到历史记录中
	 * @param bookId：图书id
	 * @param user：图书所有人id
	 * @param loginUser：登录用户id
	 */
	void addHistory(String bookId, User user, User loginUser);
	/**
	 * 修改借阅信息，添加借阅人的id到借阅表中
	 * @param bookId：图书id
	 * @param loginUser：用户id
	 */
	void updateBorrower(String bookId, String loginUserId);
	/**
	 * 通过用户id查询当前借阅的所有图书
	 * @param loginUserId：登录用户的id
	 * @return：当前借阅的所有图书
	 */
	List<Book> findAllBorrowed(String loginUserId);
	
	/**
	 * 借阅图书
	 * @param httpSession：session缓存
	 * @param bookId：图书id
	 */
	void toborrow(String bookId,HttpSession httpSession);

	/******************************/
}
