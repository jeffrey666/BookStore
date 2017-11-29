package cn.tarena.book.mapper;


import java.util.List;

import java.util.Date;


import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface SearchMapper {

	User findUserByBookId(String bookId);

	void deduct(String userId);

	void gain(User user);

	User findUser(String userId);

	void updateState(String bookId);

	void updateDate(String bookId,Date borrowDate,Date returnTime);

	Book findOne(String bookId);

	void addHistory(String userId, String bookId,Date borrowDate,Date returnDate);

	void updateBorrower(String userId, String bookId);

	List<Book> findAll(Book book);

	List<Book> findAllBookBySeller();

	Integer findBooksNum(Book book);

}
