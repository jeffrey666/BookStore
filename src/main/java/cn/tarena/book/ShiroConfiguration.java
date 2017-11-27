//package cn.tarena.book;
//
//import org.apache.shiro.authc.credential.CredentialsMatcher;
//import org.apache.shiro.mgt.SecurityManager;
//import org.apache.shiro.realm.Realm;
//import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
//import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
//import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//
//import cn.tarena.book.shiro.AuthCredentialMatcher;
//import cn.tarena.book.shiro.AuthRealm;
//import cn.tarena.book.user.utils.SpringUtil;
//
//@Configuration
//public class ShiroConfiguration {
//	@Bean
//	public SpringUtil getSpringUtil() {
//		return new SpringUtil();
//	}
//
//	@Bean
//	public AuthCredentialMatcher authCredentialMatcher() {
//		AuthCredentialMatcher authCredentialMatcher = new AuthCredentialMatcher();
//
//		return authCredentialMatcher;
//
//	}
//
//	@Bean
//	public AuthRealm authRealm() {
//
//		AuthRealm authRealm = new AuthRealm();
//		authRealm.setCredentialsMatcher(
//				(CredentialsMatcher) SpringUtil
//						.getBean("authCredentialMatcher"));
//
//		return authRealm;
//
//	}
//
//	@Bean
//	public DefaultWebSecurityManager securityManager() {
//		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
//		securityManager.setRealm(
//				(Realm) SpringUtil.getBean("authRealm"));
//
//		return securityManager;
//
//	}
//
//	@Bean
//	public AuthorizationAttributeSourceAdvisor advisor() {
//		AuthorizationAttributeSourceAdvisor advisor = new AuthorizationAttributeSourceAdvisor();
//		advisor.setSecurityManager((SecurityManager) SpringUtil
//				.getBean("securityManager"));
//
//		return advisor;
//	}
//
//	@Bean
//	public ShiroFilterFactoryBean shiroFilter() {
//		ShiroFilterFactoryBean shiroFilter = new ShiroFilterFactoryBean();
//		shiroFilter
//				.setSecurityManager((SecurityManager) SpringUtil
//						.getBean("securityManager"));
//
//		return shiroFilter;
//	}
//
//}
