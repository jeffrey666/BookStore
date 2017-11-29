package cn.tarena.book.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.tarena.book.mapper.BookMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.utils.PageBean;

@Service
public class BookListServiceImpl implements BookListService {
	@Autowired
	private BookMapper bookMapper;

	@Override
	public PageBean<Book> findBookList(Integer currentPage, Integer pageSize) {

		// 设置分页信息，分别是当前页数和每页显示的总记录数【记住：必须在mapper接口中的方法执行之前设置该分页信息】
		if (currentPage == null) {
			currentPage = 1;
		}
		if (pageSize == null) {
			pageSize = 5;
		}
		// 表示开启分页模式,PageHelper会自动对下面的第一个查询语句进行分页
		PageHelper.startPage(currentPage, pageSize);
		// 分页后的对象集合（实际使用查询所有的方法）
		List<Book> books = bookMapper.findAllBookBySeller();
		// 总记录数
		int countNums = bookMapper.countBook(); 
		//创建封装的实体类，将页信息，记录信息，分页结果全部存放进PageBean对象中
		PageBean<Book> pageData = new PageBean<Book>(currentPage, pageSize, countNums);
		//将分页结果存放进PageBean对象中
		pageData.setItems(books);
		return pageData;

	}

}
