package cn.tarena.book.service;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.utils.PageBean;

public interface BookListService {
	
	/**
	 * 这是分页用到的方法，返回为一个封装了PageBean对象，可到
	 * 工具类中查看具体的属性
	 * @param currentPage ：需要查询的当前页
	 * @param pageSize：每页需要显示的数量
	 * @return
	 */
	PageBean<Book> findBookList(Integer currentPage, Integer pageSize);

}
