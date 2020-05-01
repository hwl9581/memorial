package com.han.controller;

import com.github.pagehelper.PageInfo;
import com.han.entity.ResultType;
import com.han.entity.Thing;
import com.han.entity.User;
import com.han.service.ThingService;
import com.han.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * @ClassName ThingController
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 18:22
 */
@Controller
@RequestMapping("/thing")
public class ThingController {

    @Autowired
    ThingService thingService;
    @Autowired
    UserService userService;

    @RequestMapping("/add")
    @ResponseBody
    public String addThing(Thing thing, HttpSession session){
        thing.setState(1);
        User user = userService.getOne((String) session.getAttribute("loginUser"));
        thing.setUserId(user.getId());
        int result = thingService.addThing(thing);
        if (result > 0){
            return ResultType.toJsonString(200, "成功", result);
        }
        return ResultType.toJsonString(-1, "失败");
    }

    @GetMapping
    @ResponseBody
    public String getThing(int page,int limit){
        PageInfo<Thing> pageInfo = thingService.selectAll(page, limit);
        return ResultType.toJsonString(0, "成功", pageInfo);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public String deleteThing( Integer id){
        int result = thingService.deleteThing(id);
        if (result > 0 ){
            return ResultType.toJsonString(200,"成功", result);
        }
        return ResultType.toJsonString(-1, "失败");
    }

    @RequestMapping("/update")
    @ResponseBody
    public String updateThing(Thing thing,HttpSession session){
        User user = userService.getOne((String) session.getAttribute("loginUser"));
        thing.setUserId(user.getId());
        int result = thingService.updateThing(thing);
        if (result > 0 ){
            return ResultType.toJsonString(200,"成功", result);
        }
        return ResultType.toJsonString(-1, "失败");
    }

}
