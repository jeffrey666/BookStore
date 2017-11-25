package cn.tarena.book.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.tarena.book.pojo.User;

import java.util.List;

public interface UserMapper {

	@Insert("INSERT INTO user (id,username,PASSWORD,state) VALUES(#{id},#{username},#{password},#{state}) ")
	public void addUser(User user);
	//    User findUserById(@Param("id") String id);
	@Insert("insert into user_info (user_info_id) values(#{userId})")
	public void addUserInfoId(String userId);
	
	//根据用户名密码查找单个用户
	public User findUser(@Param("username")String username, @Param("password")String password);

//	List<User> findAllUser();

	//    int saveUser(User user);

	//    @Delete("delete from t_account where c_id = #{id}")
	//    void deleteUserById(@Param("id") String id);
	//
	//    void updateUser(User user);
}
