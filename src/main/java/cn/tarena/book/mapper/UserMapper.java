package cn.tarena.book.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface UserMapper {

	//注册时用户表插入一条信息
	@Insert("INSERT INTO user (id,username,PASSWORD,state) VALUES(#{id},#{username},#{password},#{state}) ")
	public void addUser(User user);

	//    User findUserById(@Param("id") String id);
	//注册时用户信息表插入一条只有ID的信息
	@Insert("insert into user_info (user_info_id) values(#{userId})")
	public void addUserInfoId(String userId);
	
	//登录时使用，根据用户名密码查找单个用户
	public User findUser(@Param("username")String username, @Param("password")String password);

	public abstract User findUserById(String user_id);
	
	public abstract User findUserByIdAndPsw(User user);

	public abstract int updatePsw( @Param("userId") String userId,
			@Param("newPassword") String newPassword);
	
	//根据用户名查找用户，校验是否注册时候用了重复的用户名
	@Select("select * from user where username=#{username}")
	public User findUserByUsername(String username);
	

	//根据用户Id 查找自己拥有的书
	public List<Book> findMyBookListByUserIdReturn(String userId);

	public List<Book> findMyBookListByUserId(String userId);

	

	



	
}
