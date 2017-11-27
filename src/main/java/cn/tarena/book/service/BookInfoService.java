package cn.tarena.book.service;



import java.util.List;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;

public interface BookInfoService {
	
	/**
	 * 保存书籍详情信息
	 * @param bookInfo
	 */
	public void saveBookUpload(BookInfo bookInfo);
	
	
	public List<Book> tocart(String userId,int i,int y);

	public Integer line(String id);

	/**
	 * 查找新上传的书籍
	 * @return
	 */
	public List<Book> findNewBooks();

}
