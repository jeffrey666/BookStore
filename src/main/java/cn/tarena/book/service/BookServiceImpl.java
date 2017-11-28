package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.BookMapper;
import cn.tarena.book.mapper.UserInfoMapper;
import cn.tarena.book.pojo.Book;
@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;
	
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public void saveBookUpload(Book book) {
		bookMapper.saveBookUpload(book);

	}

	@Override
	public void saveBookAndUser(String userId, String bookId) {
		//保存用户和书籍关系
		bookMapper.saveBookAndUser(userId, bookId);
		//上传之后用户积分增加50分
		userInfoMapper.saveUserScore(userId,50);
		
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
}
