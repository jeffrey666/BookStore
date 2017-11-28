package cn.tarena.book.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.SearchMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	private SearchMapper searchMapper;

	@Override
	public List<Book> findAll(Book book) {

		return searchMapper.findAll(book);
	}

	/******************************/

	@Override
	public User findUserByBookId(String bookId) {

		return searchMapper.findUserByBookId(bookId);
	}

	@Override
	public void deduct(User loginUser) {
		String loginUserId=loginUser.getId();
		searchMapper.deduct(loginUserId);
	}

	@Override
	public void gain(User user) {
		String userId=user.getId();
		searchMapper.gain(userId);
	}

	@Override
	public void updateState(String bookId) {
		searchMapper.updateState(bookId);
	}

	@Override
	public void updateDate(String bookId) {
		Date borrowDate = new Date();
		Date returnDate = new Date();
		long time = 2592000000L;
		returnDate.setTime(time + new Date().getTime());
		searchMapper.updateDate(bookId, borrowDate, returnDate);
	}

	@Override
	public Book findOne(String bookId) {
		return searchMapper.findOne(bookId);
	}

	@Override
	public void addHistory(String bookId, User user, User loginUser) {
		Date borrowDate = new Date();
		String userId=user.getId();
		String loginUserId=loginUser.getId();
		searchMapper.addHistory(bookId, userId, loginUserId, borrowDate);
	}

	@Override
	public void updateBorrower(String bookId, String loginUserId) {
		searchMapper.updateBorrower(bookId, loginUserId);
	}

	@Override
	public List<Book> findAllBorrowed(String loginUserId) {
		return searchMapper.findAllBorrowed(loginUserId);
	}

	@Override
	public void toborrow(String bookId,HttpSession httpSession) {
		// 通过session获取登录用户
		User loginUser = (User) httpSession.getAttribute("_CURRENT_USER");
		// 通过bookId找到拥有者
		User user = searchMapper.findUserByBookId(bookId);
		// 通过bookId更改图书state
		updateState(bookId);
		// 通过bookId更改图书的借阅时间和归还期限
		updateDate(bookId);
		// 将借阅人的信息添加到借阅关联表中
		updateBorrower(bookId, loginUser.getId());
		// 登录用户扣去相应的积分
		deduct(loginUser);
		// 图书拥有者得到相应的积分
		gain(user);
		// 在历史记录中添加该条借阅信息
		addHistory(bookId, user, loginUser);
	}
	/******************************/

}
