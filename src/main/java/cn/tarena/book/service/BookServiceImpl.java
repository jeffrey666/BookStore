package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.tarena.book.mapper.BookMapper;
import cn.tarena.book.pojo.Book;
@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;

	@Override
	public void save(Book book) {
		
	}

}
