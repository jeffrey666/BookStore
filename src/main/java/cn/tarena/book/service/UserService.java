package cn.tarena.book.service;

import cn.tarena.book.pojo.User;

public interface UserService {

	public abstract User findUserByBookId(String bookId);

	public abstract void deduct(String userId);

	public abstract void gain(User user);

	public abstract User findUser(String user_id);

	public abstract int updatePsw(String userId,
			String newPassword);

	public abstract User findUser(User user);


}
