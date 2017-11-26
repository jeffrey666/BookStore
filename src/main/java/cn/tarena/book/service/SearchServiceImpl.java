package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.SearchMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	private SearchMapper searchMapper;
	
	
	
	/*********************************/
	@Override
	public void updateState(String bookId) {

	}

	@Override
	public void updateDate(String bookId) {

	}

	@Override
	public Book findOne(String bookId) {
		return null;
	}

	@Override
	public void updateBorrower(String userId, String bookId) {

	}

	@Override
	public void addHistory(String userId, String bookId) {
		
	}

	@Override
	public User findUserByBookId(String bookId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deduct(String userId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void gain(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User findUser(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}
	/*********************************/

}
