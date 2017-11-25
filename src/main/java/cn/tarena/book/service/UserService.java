package cn.tarena.book.service;

import cn.tarena.book.pojo.User;

public interface UserService {

	//注册时添加用户
	public void addUser(User user);

	//登录时查找单个用户
	public User findUser(String username, String password);


	User findUserByBookId(String bookId);

	void deduct(String userId);

	void gain(User user);


}
