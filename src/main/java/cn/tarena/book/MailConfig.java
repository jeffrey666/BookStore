package cn.tarena.book;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import cn.tarena.book.utils.MailUtils;

@Configuration
public class MailConfig {
	
	@Bean
	public MailUtils getMailUtils(){
		return new MailUtils();
	}


}
