package cn.tarena.book;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;



/**
 * 启动类，不需要启动tomcat，只需要执行
 * 这个main方法就可以运行
 */
@SpringBootApplication
@MapperScan("cn.tarena.book.mapper")
@ServletComponentScan
public class StartBookApplication {
	public static void main(String[] args) {
		SpringApplication.run(StartBookApplication.class, args);
	}	

	
}

