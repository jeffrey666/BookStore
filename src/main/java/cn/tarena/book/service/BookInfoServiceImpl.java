package cn.tarena.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.BookInfoMapper;
import cn.tarena.book.mapper.BookMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;

@Service
public class BookInfoServiceImpl  implements BookInfoService{

	@Autowired
	private BookInfoMapper bookInfoMapper;
	@Override

	public void saveBookUpload(BookInfo bookInfo) {
		bookInfoMapper.saveBookUpload(bookInfo);
  }
	@Override
	public List<Book> tocart(String userId,int i,int y) {
		return bookInfoMapper.tocart(userId,i,y);
	}
	@Override
	public Integer line(String id) {
		return bookInfoMapper.line(id);
	}
	@Override
	public List<BookInfo> findAll() {
		return bookInfoMapper.findAll();
	}
		
	public List<Book> findNewBooks() {
		
		return bookInfoMapper.findNewBooks();
	}
	@Override
	public Book findOneByBookId(String bookId) {
		//点击书籍详情增加搜索次数
		bookInfoMapper.addSearchVolume(bookId);
		return bookInfoMapper.findOneByBookId(bookId);
	}
	
	
	
	@Override
	public List<Book> findRelateBooks(String category, String bookId) {
		return bookInfoMapper.findRelateBooks(bookId,category);
	}
	@Override
	public List<Book> findAllCategory() {
		return bookInfoMapper.findAllCategory();
	}
}