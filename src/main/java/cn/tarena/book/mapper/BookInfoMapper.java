package cn.tarena.book.mapper;

import java.util.List;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;

public interface BookInfoMapper {

	void saveBookUpload(BookInfo bookInfo);

	public List<Book> findAllByCount();

}
