package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.UserMapper;
import cn.tarena.book.pojo.User;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public User findUserByBookId(String bookId) {
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
		return userMapper.findUserById(user_id);
	}

	@Override
	public int updatePsw(String userId, String newPassword) {
		return userMapper.updatePsw(userId, newPassword);
	}

	@Override
	public User findUser(User user) {
		
		return userMapper.findUser(user);
	}

}
