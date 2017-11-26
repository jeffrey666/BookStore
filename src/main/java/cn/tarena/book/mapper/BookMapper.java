package cn.tarena.book.mapper;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.Book;

public interface BookMapper {

	
	void saveBookUpload(Book book);

	void saveBookAndUser(@Param("userId")String userId, @Param("bookId")String bookId);

}
