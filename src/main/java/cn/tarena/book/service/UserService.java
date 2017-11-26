package cn.tarena.book.service;

import cn.tarena.book.pojo.User;

public interface UserService {


	//注册时添加用户
	public void addUser(User user);

	//登录时查找单个用户
	public User findUser(String username, String password);
	
	public abstract User findUser(String user_id);

	public abstract int updatePsw(String userId,
			String newPassword);

	public abstract User findUserByIdAndPsw(User user);
	
	
	
	//根据用户名查找用户，校验是否注册时候用了重复的用户名
	public abstract User findUserByUsername(String username);



	public void saveBookUpload(String userId, String bookId);


	

}
