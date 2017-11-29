package cn.tarena.book.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.utils.PageBean;

public interface SearchService {
	
    /**
     * @param book:搜索的条件
     * @param currentPage：当前的页数
     * @return
     */
	PageBean findAllByConditions(Book book,Integer currentPage);
	
	/**
	 * @return:进入搜索页面时推荐的热门书籍
	 */
	
	List<Book> findAllBookBySeller();
	
	/******************************/

	/**
	 * 通过用户id查询当前借阅的所有图书
	 * @param loginUserId：登录用户的id
	 * @return：当前借阅的所有图书
	 */
	List<Book> findAllBorrowed(String userId);
	/**
	 * 用户借书处理的一系列逻辑
	 * @param bookId 书的Id
	 * @param user 用户的完整信息
	 */
	void toborrow(String bookId, User user);


	/******************************/
}
