package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;
import cn.tarena.book.mapper.UserMapper;
import cn.tarena.book.mapper.VerifyEmailMapper;
import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;
import cn.tarena.book.pojo.UserInfo;
import cn.tarena.book.pojo.VerifyEmail;
import cn.tarena.book.user.utils.MD5Tool;
import cn.tarena.book.utils.MailUtils;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private VerifyEmailMapper verifyEmailMapper;

	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private MailUtils mailUtils;

	// 登录时查找用户是否存在
	@Override
	public User findUser(String username, String password) {

		return userMapper.findUser(username, password);
	}

	// 注册时录入信息
	@Override
	public void addUser(User user) {
		// 用UUID设定用户Id,状态默认为开启（1为开启，0为禁用）
		String userId = UUID.randomUUID().toString();
		user.setId(userId);
		user.setState(1);
		String password = MD5Tool.getMD5(user.getUsername(),
				user.getPassword());
		user.setPassword(password);
		userMapper.addUser(user);
		// 同时为userinfo表中插入一个用户Id，用于在用于中心更新信息
		userMapper.addUserInfoId(userId);

	}

	@Override
	public int updatePsw(String userId, String newPassword,
			String username) {
		return userMapper.updatePsw(userId,
				MD5Tool.getMD5(username, newPassword));
	}

	@Override
	public User findUserByIdAndPsw(User user, String username) {

		user.setPassword(
				MD5Tool.getMD5(username, user.getPassword()));

		return userMapper.findUserByIdAndPsw(user);
	}

	// 根据用户名查找用户，校验是否注册时候使用重复的用户名
	@Override
	public User findUserByUsername(String username) {

		return userMapper.findUserByUsername(username);
	}

	//根据用户Id 查找自己拥有的书
	@Override
	public List<Book> findMyBookListByUserId(String userId) {

		return userMapper.findMyBookListByUserId(userId);
	}

	@Override
	public List<Book> findMyBookListByUserIdReturn(
			String userId) {
		return userMapper.findMyBookListByUserIdReturn(userId);
	}

	@Override
	public String findRoleByUserId(String userId) {

		User user = userMapper.findUserById(userId);

		return user.getRole();
	}

	@Override
	public void wantChangeEmail(String user_id,
			String new_email) {

		//数据库添加记录
		String emailValidateId = UUID.randomUUID().toString();
		verifyEmailMapper.addRecord(emailValidateId, user_id,
				new_email);

		//给新email发验证地址
		mailUtils.sendVerifyEmailMail(new_email,
				emailValidateId);
	}

	@Override
	public String verifyEmail(String verify_email_id) {

		verifyEmailMapper.verifyEmail(verify_email_id,
				new Date());
		VerifyEmail ve = verifyEmailMapper
				.findPojoByVerifyEmailId(verify_email_id);

		//userinfo表更新email
		UserInfo userInfo = new UserInfo();
		userInfo.setUserInfoId(ve.getUserId());
		userInfo.setEmail(ve.getEmail());
		userInfoService.update(userInfo);

		return ve.getEmail();
	}

	@Override
	public int findUserScore(String userId) {
		return userMapper.findUserScore(userId);
	}

}
