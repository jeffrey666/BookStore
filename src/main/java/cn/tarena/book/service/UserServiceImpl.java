package cn.tarena.book.service;

import cn.tarena.book.mapper.UserMapper;
import cn.tarena.book.pojo.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

	@Override
	public void addUser(User user) {
		//用UUID设定用户Id,状态默认为开启（1为开启，0为禁用）
		String  userId = UUID.randomUUID().toString();
		user.setId(userId);
		user.setState(1);
		userMapper.addUser(user);
		//同时为userinfo表中插入一个用户Id
		userMapper.addUserInfoId(userId);
		
	}

	@Override
	public User findUser(String username, String password) {
		
		return userMapper.findUser(username,password);
	}
   
}
