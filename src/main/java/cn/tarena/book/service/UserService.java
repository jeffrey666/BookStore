package cn.tarena.book.service;

import java.util.List;

import cn.tarena.book.pojo.User;

public interface UserService {
	//注册时添加用户
	public void addUser(User user);
//    public List<User> findAllUser();
	//登录时查找单个用户
	public User findUser(String username, String password);
}
