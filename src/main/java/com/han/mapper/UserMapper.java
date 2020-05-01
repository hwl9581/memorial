package com.han.mapper;

import com.han.entity.User;
import org.springframework.stereotype.Repository;

/**
 * @ClassName UserMapper
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 18:10
 */
@Repository
public interface UserMapper {

    User selectOne(User user);

    User selectByUsername(String username);

}
