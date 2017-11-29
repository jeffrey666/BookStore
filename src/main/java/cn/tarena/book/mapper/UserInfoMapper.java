package cn.tarena.book.mapper;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.UserInfo;

public interface UserInfoMapper {

	public abstract void updateExceptforEmail(UserInfo userInfo);

	/**图书上传之后，用户的积分增加50分
	 * @param userId
	 * @param i
	 */
	public void saveUserScore(@Param("userId")String userId, @Param("i")int i);

	public abstract UserInfo findByUserInfoId(String userInfoId);

	public abstract void update(UserInfo userInfo);

}
