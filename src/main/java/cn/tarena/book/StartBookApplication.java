package cn.tarena.book;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

//启动类，不要启动tomcat，只需要执行这个main方法就可以运行
@SpringBootApplication
@MapperScan("cn.tarena.book.mapper")
@ServletComponentScan
public class StartBookApplication {
	public static void main(String[] args) {
		SpringApplication.run(StartBookApplication.class, args);
	}	

	
}

