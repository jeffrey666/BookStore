package cn.tarena.book.service;



import java.util.List;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;

public interface BookInfoService {
	public void saveBookUpload(BookInfo bookInfo);
	
	public List<Book> tocart(String userId,int i,int y);

	public Integer line(String id);

}
