package cn.tarena.book.service;

import java.util.List;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.pojo.User;

public interface UserService {

	// 注册时添加用户
	public abstract void addUser(User user);

	// 登录时查找单个用户
	public abstract User findUser(String username, String password);

	public abstract int updatePsw(String userId, String newPassword);

	public abstract User findUserByIdAndPsw(User user);

	// 根据用户名查找用户，校验是否注册时候用了重复的用户名
	public abstract User findUserByUsername(String username);


	//根据用户Id 查找自己拥有的未还的书
	public abstract List<Book> findMyBookListByUserIdReturn(String userId);

	public abstract List<Book> findMyBookListByUserId(String userId);

	public abstract String findRoleByUserId(String userId);

	//后台:查询所有用户
	public List<User> findBackAllUser();
	//后台：修改用户状态
	public void changeState(int i, String[] ids);
	//后台:删除用户
	public void delete(String[] ids);

}
