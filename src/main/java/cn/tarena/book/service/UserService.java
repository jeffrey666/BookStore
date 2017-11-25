package cn.tarena.book.service;

import cn.tarena.book.pojo.User;

public interface UserService {


	User findUserByBookId(String bookId);

	void deduct(String userId);

	void gain(User user);


}
