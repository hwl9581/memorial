package com.han.controller;

import com.alibaba.fastjson.JSON;
import com.han.entity.ResultType;
import com.han.entity.User;
import com.han.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @ClassName UserController
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 18:21
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping
    @ResponseBody
    public String login(User user, HttpSession session){
        User one = userService.login(user);
        if (one != null){
            session.setAttribute("loginUser",one.getUsername());
            return ResultType.toJsonString(200,"成功", one);
        } else {
            return ResultType.toJsonString(-1,"失败");
        }
    }

}
