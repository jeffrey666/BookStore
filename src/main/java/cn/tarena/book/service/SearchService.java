package cn.tarena.book.service;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface SearchService {
	
	
	

	
	
/*********************************/
	
	User findUserByBookId(String bookId);
	
	void deduct(String userId);

    void gain(User user);

	User findUser(String user_id);

	void updateState(String bookId);

	void updateDate(String bookId);
	
	Book findOne(String bookId);

	void updateBorrower(String userId, String bookId);

	void addHistory(String userId, String bookId);
/*********************************/

	void saveBookUpload(Book book);


}
