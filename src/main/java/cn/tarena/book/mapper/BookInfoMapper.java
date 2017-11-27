package cn.tarena.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;

public interface BookInfoMapper {

	void saveBookUpload(BookInfo bookInfo);
	
	/**
	 * 分页查询功能
	 * @param userId 用户Id
	 * @param i	当前行数
	 * @param y	需要获取的行数
	 * @return
	 */
	List<Book> tocart(@Param("userId")String userId,@Param("i")int i,@Param("y")int y);
	
	/**
	 * 获取该用户所有书籍的行数
	 * @param id 用户Id
	 * @return
	 */
	Integer line(String id);

	List <Book> findNewBooks();

	List<BookInfo> findAll();

}

