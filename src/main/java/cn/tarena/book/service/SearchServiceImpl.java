package cn.tarena.book.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;

import cn.tarena.book.mapper.SearchMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.History;
import cn.tarena.book.pojo.User;
import cn.tarena.book.utils.PageBean;
@Service
@Transactional
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchMapper searchMapper;
	
	@Override
	public PageBean findAllByConditions(Book book,Integer currentPage){
		//设置分页信息，分别是当前页数和每页显示的总记录数【记住：必须在mapper接口中的方法执行之前设置该分页信息】
		//搜索页面的每页显示数据固定为6条
		if(currentPage==null){
			currentPage = 1;
		}
		int pageSize = 6;
		PageHelper.startPage(currentPage, pageSize);
		List<Book> books = searchMapper.findAll(book);
		Integer count = searchMapper.findBooksNum(book);
		PageBean<Book> pageBean = new PageBean<Book>(currentPage,pageSize,count);
		pageBean.setItems(books);
		return pageBean;
	}
	
	
	@Override
	public List<Book> findAllBookBySeller() {
		return searchMapper.findAllBookBySeller();
	}
	
	
	
	/******************************/

	

	@Override
	public void toborrow(String bookId, User user) {
		//1.修改用户关系表，添加借阅人ID
		searchMapper.updateBorrower(bookId,user.getId());
		//2.修改书籍状态为借阅状态
		searchMapper.updateState(bookId);
		//3.修改图书详情借阅日期与归还期限，借阅次数+1
		Date borrowDate = new Date();
		long time=borrowDate.getTime();
		Date returnTime = new Date(time+(1000l*60*60*24*30));
		searchMapper.updateDate(bookId, borrowDate, returnTime);
		//4.增加一条借阅历史记录
		History history = new History();
		history.setHistoryId(UUID.randomUUID().toString());
		history.setBookId(bookId);
		history.setBorrowDate(borrowDate);
		history.setUserId(user.getId());
		searchMapper.insertHistoryRecord(history);
		//5.修改借阅人积分-10
		searchMapper.deduct(user.getId());
		//6.修改上传人积分+10
		searchMapper.gain(bookId);
	}

	@Override
	public List<Book> findAllBorrowed(String userId) {
		
		return searchMapper.findAllBorrowed(userId);
		
	}






	
	
	

}
