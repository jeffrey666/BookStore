package cn.tarena.book.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tarena.book.mapper.UserInfoMapper;
import cn.tarena.book.pojo.UserInfo;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public void update(UserInfo userInfo) {
		userInfoMapper.update(userInfo);
	}

}
