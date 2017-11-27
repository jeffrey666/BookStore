package cn.tarena.book.user.aspect;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.subject.Subject;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import cn.tarena.book.user.annotation.RequireRole;


@Component
@Aspect
public class RoleCheckAspect {


	@Around(value = "execution( * *.* (..) ) && @annotation(ann)")
	private Object arround(ProceedingJoinPoint joinPoint,
			RequireRole ann) throws Throwable {

		Subject subject = SecurityUtils.getSubject();
		Object resultObject = null;

		try {
			subject.checkRole(ann.value());

			resultObject = joinPoint.proceed();
		} catch (AuthorizationException e) {
			resultObject = "unauthorized";
		}

		return resultObject;

	}
}
