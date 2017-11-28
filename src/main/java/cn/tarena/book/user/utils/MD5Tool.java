package cn.tarena.book.user.utils;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;

public class MD5Tool {

	public static final int M_HASHITERATIONS = 2;
	public static final String TEST_USERNAME = "TEST_USERNAME";

	public static String getMD5(String username,
			String password) {

		Md5Hash md5Hash = new Md5Hash(password, TEST_USERNAME,
				M_HASHITERATIONS);

		return md5Hash.toString();
	}

	@Test
	public void testGetMD5() {
		System.out.println(getMD5("arti", "123456"));
	}

}
