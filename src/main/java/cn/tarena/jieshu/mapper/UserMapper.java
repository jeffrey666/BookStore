package cn.tarena.jieshu.mapper;

import cn.tarena.jieshu.pojo.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface UserMapper {
	//    User findUserById(@Param("id") String id);

	List<User> findAllUser();

	//    int saveUser(User user);

	//    @Delete("delete from t_account where c_id = #{id}")
	//    void deleteUserById(@Param("id") String id);
	//
	//    void updateUser(User user);
}
