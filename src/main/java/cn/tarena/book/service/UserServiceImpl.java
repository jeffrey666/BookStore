package cn.tarena.book.service;

import cn.tarena.book.mapper.UserMapper;
import cn.tarena.book.pojo.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
   
}
