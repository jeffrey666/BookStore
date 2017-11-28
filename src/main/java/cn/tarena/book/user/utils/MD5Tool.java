package cn.tarena.book.user.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

public class MD5Tool {

	public static final int M_HASHITERATIONS = 2;

	public static String getMD5(String username,
			String password) {

		Md5Hash md5Hash = new Md5Hash(password, username,
				M_HASHITERATIONS);

		return md5Hash.toString();
	}
	


}
