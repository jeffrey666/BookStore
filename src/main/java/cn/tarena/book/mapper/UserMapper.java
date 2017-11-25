package cn.tarena.book.mapper;

import org.apache.ibatis.annotations.Param;

import cn.tarena.book.pojo.User;

public interface UserMapper {

	public abstract User findUserById(String user_id);
	
	public abstract User findUser(User user);

	public abstract int updatePsw( @Param("userId") String userId,
			@Param("newPassword") String newPassword);


	
}
