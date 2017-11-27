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

	//保存书籍用户关系表
	@Override
	public void saveBookUpload(Book book) {
		bookMapper.saveBookUpload(book);

	}

	//把书籍信息存到书籍表
	@Override
	public void saveBookAndUser(String userId, String bookId) {
		//保存用户和书籍关系
		bookMapper.saveBookAndUser(userId, bookId);
		//上传之后用户积分增加50分
		userInfoMapper.saveUserScore(userId,50);
		
	}
}
