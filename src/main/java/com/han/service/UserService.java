package com.han.service;

import com.han.entity.User;
import com.han.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName UserService
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 18:37
 */
public interface UserService {

    User login(User user);

    User getOne(String username);
}
