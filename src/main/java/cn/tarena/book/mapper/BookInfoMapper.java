package cn.tarena.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;
import cn.tarena.book.pojo.UserInfo;

public interface BookInfoMapper {

	void saveBookUpload(BookInfo bookInfo);
	
	List<Book> tocart(String userId);

}