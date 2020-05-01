package com.han.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName ViewController
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 17:24
 */
@Controller
@RequestMapping("/view")
public class ViewController {

    @GetMapping("/index")
    public String toIndexView(){
        return "index";
    }

    @GetMapping("/manager")
    public String toManagerView(){
        return "manager";
    }

    @GetMapping("/add")
    public String toAddView(){
        return "add";
    }

}
