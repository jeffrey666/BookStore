package cn.tarena.book.service;

import cn.tarena.book.pojo.UserInfo;

public interface UserInfoService {

	public abstract void updateExceptforEmail(UserInfo userInfo);

	public abstract UserInfo findByUserInfoId(String userInfoId);

	public abstract void update(UserInfo userInfo);

}
