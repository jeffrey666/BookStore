package cn.tarena.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.User;

public interface BackUserMapper {

	/**
	 * 后台:查询所有用户
	 * @return
	 */
	public List<User> findBackAllUser();

	/**
	 * 后台：修改用户状态
	 * @param i
	 * @param ids
	 */
	public void changeState(@Param("state")int i, @Param("ids")String[] ids);

	/**
	 * 删除用户
	 * @param ids
	 */
	public void deleteUser(String[] ids);

	/**
	 * 删除用户详情
	 * @param ids
	 */
	public void deleteUserInfo(String[] ids);

}
