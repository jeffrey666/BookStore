package cn.tarena.book.service;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.BookInfoMapper;
import cn.tarena.book.mapper.BookMapper;
import cn.tarena.book.mapper.UserInfoMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.BookInfo;
@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private BookInfoMapper bookInfoMapper;
	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	
	@Override
	public void saveBookUpload(Book book) {
		bookMapper.saveBookUpload(book);

	}

	@Override
	public void saveBookAndUser(String userId, Book book) {
		//设置书本的ID
		String Id=UUID.randomUUID().toString();
		book.setBookId(Id);
		//新增书数据保存为(未借)
		book.setState(0);
		
		Date date =new Date();
		BookInfo bookInfo =book.getBookInfo();
		//设置id
		bookInfo.setBookInfoId(Id);
		//设置上传时间
		bookInfo.setUpdateTime(date);
		
		//保存用户和书籍关系
		bookMapper.saveBookAndUser(userId,book.getBookId());
		//上传之后用户积分增加50分
		userInfoMapper.saveUserScore(userId,50);
		
		//把书籍信息存到书籍表
		bookMapper.saveBookUpload(book);
		
		//把书籍信息存到书籍详情表
		bookInfoMapper.saveBookUpload(bookInfo);
		
	}

	@Override
	public void deleteMyBook(String[] ids,String userId) {
		// 删除书，书的信息，书的关系表
		bookMapper.deleteMyUserBookBorrower(ids);
		bookMapper.deleteMyBook(ids);
		bookMapper.deleteMyBookInfo(ids);
		//删除书之后用户积分减少50分
		userInfoMapper.saveUserScore(userId,-50);
		
	}

	@Override
	public void updateBookState(Date date,String bookId) {
		System.out.println(date);
		//更改书籍借阅状态
		bookMapper.updateBookState(bookId);
		//获取并更改bookInfo信息
		bookMapper.updateBookInfo(date,bookId);
		//更改user_book_borrower信息,删除借阅人
		bookMapper.updateUserBookBorrower("",bookId);
		//更改历史记录归回日期
		bookMapper.updateHistoryReturnDate(date,bookId);
	}

	@Override
	public Book findOne(String bookId) {
		return bookMapper.findOne(bookId);
	}
}
