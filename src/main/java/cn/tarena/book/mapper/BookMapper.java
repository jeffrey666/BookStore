package cn.tarena.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.Book;

public interface BookMapper {

	
	public void saveBookUpload(Book book);

	public void saveBookAndUser(@Param("userId")String userId, @Param("bookId")String bookId);

	public List<Book> findAllBookBySeller();
	
	public int countBook();

}
