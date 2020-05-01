package com.han.service.impl;

import com.han.entity.User;
import com.han.mapper.UserMapper;
import com.han.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName UserServiceImpl
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 18:39
 */
@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;


    @Override
    public User login(User user) {
        return userMapper.selectOne(user);
    }

    @Override
    public User getOne(String username) {
        return userMapper.selectByUsername(username);
    }
}
