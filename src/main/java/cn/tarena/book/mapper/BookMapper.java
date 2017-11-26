package cn.tarena.book.mapper;

import java.util.List;

import cn.tarena.book.pojo.Book;

public interface BookMapper {

	public List<Book> findCartAll(String userId);

}
