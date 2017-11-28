package cn.tarena.book.mapper;


import java.util.List;

import java.util.Date;


import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface SearchMapper {

	User findUserByBookId(String bookId);

	void deduct(User loginUser);

	void gain(User user);

	void updateState(String bookId);

	void updateDate(String bookId,Date borrowDate,Date returnTime);

	Book findOne(String bookId);

	void addHistory(String userId, User user,User loginUser,Date returnDate);

	void updateBorrower(String userId, User loginUser);

	List<Book> findAll(Book book);

	List<Book> findAllBorrowed(String loginUserId);

}
