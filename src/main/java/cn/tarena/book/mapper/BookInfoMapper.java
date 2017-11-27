package cn.tarena.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;

public interface BookInfoMapper {

	void saveBookUpload(BookInfo bookInfo);
	
	List<Book> tocart(@Param("userId")String userId,@Param("i")int i,@Param("y")int y);

	Integer line(String id);

	List <Book> findNewBooks();

}

