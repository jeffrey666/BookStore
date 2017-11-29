package cn.tarena.book.mapper;


import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.History;
import cn.tarena.book.pojo.User;

public interface SearchMapper {

	List<Book> findAll(Book book);

	Integer findBooksNum(Book book);

	List<Book> findAllBookBySeller();

	List<Book> findAllBorrowed(String userId);
// ===============================================借阅用到的方法

	void deduct(String userId);

	void gain(String bookId);

	void updateState(String bookId);

	void updateBorrower(@Param("bookId") String bookId,@Param("userId")String userId);
	
	void updateDate(@Param("bookId")String bookId,@Param("borrowDate")Date borrowDate,@Param("returnDate")Date returnTime);

	void insertHistoryRecord(History history);
	
// ===============================================借阅用到的方法^
}
