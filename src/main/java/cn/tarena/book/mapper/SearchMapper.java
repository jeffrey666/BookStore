package cn.tarena.book.mapper;

import java.util.List;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface SearchMapper {

	User findUserByBookId(String bookId);

	void deduct(String userId);

	void gain(User user);

	User findUser(String userId);

	void updateState(String bookId);

	void updateDate(String bookId);

	Book findOne(String bookId);

	void addHistory(String userId, String bookId);

	void updateBorrower(String userId, String bookId);

	List<Book> findAll(Book book);

}
