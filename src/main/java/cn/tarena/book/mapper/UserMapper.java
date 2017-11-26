package cn.tarena.book.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.tarena.book.pojo.User;

public interface UserMapper {

<<<<<<< HEAD
	public void saveBookUpload(@Param("userId")String userId,@Param("bookId") String bookId);
=======

	public void saveBookUpload(@Param("userId")String userId,@Param("bookId") String bookId);

	@Insert("INSERT INTO user (id,username,PASSWORD,state) VALUES(#{id},#{username},#{password},#{state}) ")
	public void addUser(User user);

>>>>>>> 09cf4a79d592ccaa33368b2846c1a1c47d161e95
	//    User findUserById(@Param("id") String id);
	@Insert("insert into user_info (user_info_id) values(#{userId})")
	public void addUserInfoId(String userId);
	
	//根据用户名密码查找单个用户
	public User findUser(@Param("username")String username, @Param("password")String password);

	public abstract User findUserById(String user_id);
	
	public abstract User findUserByIdAndPsw(User user);

	public abstract int updatePsw( @Param("userId") String userId,
			@Param("newPassword") String newPassword);
	@Select("select * from user where username=#{username}")
	public User findUserByUsername(String username);


	
}
