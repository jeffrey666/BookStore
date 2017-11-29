package cn.tarena.book.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import java.util.Date;


import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface SearchMapper {

	User findUserByBookId(String bookId);

	void deduct(String loginUserId);

	void gain(String  userId);

	void updateState(String bookId);

	void updateDate(@Param("bookId") String bookId,@Param("borrowDate") Date borrowDate,@Param("returnDate") Date returnDate);

	Book findOne(String bookId);

	void addHistory(@Param("bookId")String bookId, @Param("userId")String userId,@Param("loginUserId")String loginUserId,@Param("borrowDate")Date borrowDate);

	void updateBorrower(@Param("bookId")String bookId, @Param("loginUserId")String loginUserId);

	List<Book> findAll(Book book);

	List<Book> findAllBookBySeller();

	Integer findBooksNum(Book book);

	List<Book> findAllBorrowed(String loginUserId);


}
