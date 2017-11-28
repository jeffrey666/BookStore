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

	public List<BookInfo> findAll();
	/**
	 * 查找新上传的书籍
	 * @return
	 */
	public List<Book> findNewBooks();

	/**根据bookid查询书籍
	 * @param bookId:书籍id
	 * @return
	 */
	public Book findOneByBookId(String bookId);

	/**
	 * 查询相关书籍
	 * @param category:书籍分类
	 * @return
	 */
	public List<Book> findRelateBooks(String category);


}
