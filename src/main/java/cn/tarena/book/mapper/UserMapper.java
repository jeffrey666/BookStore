package cn.tarena.book.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import cn.tarena.book.pojo.User;

import java.util.List;

public interface UserMapper {

	public void saveBookUpload(@Param("userId")String userId,@Param("bookId") String bookId);
	//    User findUserById(@Param("id") String id);

//	List<User> findAllUser();

	//    int saveUser(User user);

	//    @Delete("delete from t_account where c_id = #{id}")
	//    void deleteUserById(@Param("id") String id);
	//
	//    void updateUser(User user);
}
