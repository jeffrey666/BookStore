package cn.tarena.book.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import cn.tarena.book.pojo.Book;

public interface BookMapper {

	public void saveBookUpload(Book book);

	public void saveBookAndUser(@Param("userId")String userId, @Param("bookId")String bookId);

	public List<Book> findAllBookBySeller();
	
	public int countBook();

	public void deleteMyBook(String[] ids);

	public void deleteMyUserBookBorrower(String[] ids);

	public void deleteMyBookInfo(String[] ids);
	
	@Update("UPDATE book SET state='0' WHERE book_id=#{bookId}")
	public void updateBookState(String bookId);
	
	@Update("UPDATE book_info SET return_date=#{date} WHERE book_info_id=#{bookId}")
	public void updateBookInfo(@Param("date")Date date, @Param("bookId")String bookId);
	
	@Update("UPDATE user_book_borrower SET borrower_id=#{borrower} WHERE book_id=#{bookId}")
	public void updateUserBookBorrower(@Param("borrower")String string, @Param("bookId")String bookId);
	
	@Update("UPDATE history SET return_date=#{date} WHERE book_id=#{bookId}")
	public void updateHistoryReturnDate(@Param("date")Date date, @Param("bookId")String bookId);
	@Select("select * from book where book_id=#{bookId}")
	public Book findOne(String bookId);


}
