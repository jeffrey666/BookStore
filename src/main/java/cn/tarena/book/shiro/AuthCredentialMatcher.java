package cn.tarena.book.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.SimpleCredentialsMatcher;

import cn.tarena.book.user.utils.MD5Tool;

public class AuthCredentialMatcher
		extends SimpleCredentialsMatcher {

	@Override
	public boolean doCredentialsMatch(AuthenticationToken token,
			AuthenticationInfo info) {

		UsernamePasswordToken loginToken = (UsernamePasswordToken) token;

		String input_username = loginToken.getUsername();
		String input_psw = String
				.valueOf(loginToken.getPassword());

		input_psw = MD5Tool.getMD5(input_username, input_psw);

		loginToken.setPassword(input_psw.toCharArray());

		return super.doCredentialsMatch(token, info);
	}

}
