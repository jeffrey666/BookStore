package cn.tarena.book.service;

import cn.tarena.book.pojo.User;

public interface UserService {

	public abstract User findUserByBookId(String bookId);
	//注册时添加用户
	public void addUser(User user);

	//登录时查找单个用户
	public User findUser(String username, String password);


	public abstract void deduct(String userId);

	public abstract void gain(User user);

	public abstract User findUser(String user_id);

	public abstract int updatePsw(String userId,
			String newPassword);

	public abstract User findUserByIdAndPsw(User user);



}
