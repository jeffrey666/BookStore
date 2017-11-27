package cn.tarena.book.user.annotation;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Retention;
import java.lang.annotation.Target;

@Retention(RUNTIME)
@Target(METHOD)
public @interface RequireRole {
	
	public static final String NORMAL_ROLE = "NormalRole";
	public static final String ADMIN_ROLE = "Admin";
	public static final String SUPER_ADMIN_ROLE = "SuperAdmin";
	
	public String value();
}
