package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.BookInfoMapper;
import cn.tarena.book.pojo.Book;
<<<<<<< HEAD
import cn.tarena.book.pojo.BookInfo;
=======
>>>>>>> 09cf4a79d592ccaa33368b2846c1a1c47d161e95
@Service
public class BookInfoServiceImpl  implements BookInfoService{

	@Autowired
	private BookInfoMapper bookInfoMapper;
	@Override
<<<<<<< HEAD
	public void saveBookUpload(BookInfo bookInfo) {
		bookInfoMapper.saveBookUpload(bookInfo);
=======
	public void saveBookUpload(Book book) {
		bookInfoMapper.saveBookUpload(book);
		
>>>>>>> 09cf4a79d592ccaa33368b2846c1a1c47d161e95
	}
	

}
