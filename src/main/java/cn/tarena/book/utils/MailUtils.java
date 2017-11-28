package cn.tarena.book.utils;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
@ActiveProfiles("163")
public class MailUtils {

    @Autowired
    private JavaMailSender mailSender; //自动注入的Bean

    @Value("${spring.mail.username}")
    private String Sender; //读取配置文件中的参数

    /*
     * 发送邮件的方法
     */
    public void sendSimpleMail(String email) throws Exception {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(Sender);//发送者
        message.setTo(email); //收件人邮箱
        message.setSubject("主题：欢迎您注册借书网！");
        message.setText("感谢您的注册，祝你在以后的时光中，学习愉快！");
        mailSender.send(message);
        System.out.println("发送邮件成功");
    }
    
    
} 
      

    

