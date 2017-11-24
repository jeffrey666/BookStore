package cn.tarena.jieshu.service;

import cn.tarena.jieshu.mapper.UserMapper;
import cn.tarena.jieshu.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }
}
