package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.BookMapper;
import cn.tarena.book.pojo.Book;
@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;

	//保存书籍用户关系表
	@Override
	public void saveBookUpload(Book book) {
		bookMapper.saveBookUpload(book);

	}

	//把书籍信息存到书籍表
	@Override
	public void saveBookAndUser(String userId, String bookId) {
		bookMapper.saveBookAndUser(userId, bookId);

	}
}
