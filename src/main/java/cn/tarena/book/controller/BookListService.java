package cn.tarena.book.controller;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.utils.PageBean;

public interface BookListService {

	PageBean<Book> findBookList(Integer currentPage, Integer pageSize);

}
