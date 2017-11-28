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

	void updateDate(String bookId,Date borrowDate,Date returnDate);

	Book findOne(String bookId);

	void addHistory(String bookId, User user,User loginUser,Date borrowDate);

	void updateBorrower(String userId, User loginUser);

	List<Book> findAll(Book book);

	List<Book> findAllBorrowed(String loginUserId);

}
