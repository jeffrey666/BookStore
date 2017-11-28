package cn.tarena.book.shiro;


import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.SimpleAccountRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.tarena.book.pojo.User;
import cn.tarena.book.service.UserService;
import cn.tarena.book.user.utils.StringTool;


public class AuthRealm extends SimpleAccountRealm {

	@Autowired
	private UserService userService;

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token)
			throws AuthenticationException {

		UsernamePasswordToken usernamePasswordToken = (UsernamePasswordToken) token;

		String input_username = usernamePasswordToken
				.getUsername();
		String input_psw = String
				.valueOf(usernamePasswordToken.getPassword());

		if (!(StringTool.notEmpty(input_username)
				&& StringTool.notEmpty(input_psw))) {
			throw new AuthenticationException("用户名或密码错误");
		}

		User rightUser = userService
				.findUserByUsername(input_username);

		return new SimpleAuthenticationInfo(rightUser,
				rightUser.getPassword(), this.getName());

	}

	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {

		User user = (User) principals.getPrimaryPrincipal();

		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addRole(user.getRole());

		return simpleAuthorizationInfo;
	}

}