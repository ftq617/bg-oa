package cn.bluegod.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-09-28 13:42
 * @Version V1.0
 */
@Controller
public class pageController {

    @RequestMapping("/")
    public String start(){
        return "login";
    }

    @RequestMapping("/admin/index")
    public String index(){
        return "admin/index";
    }


    @RequestMapping("/{page}")
    public String page(@PathVariable String page){
        return page;
    }

    @RequestMapping("/admin/{page}")
    public String adminPage(@PathVariable String page){
        return "admin/"+page;
    }

    @RequestMapping("/users/{page}")
    public String userPage(@PathVariable String page){
        return "users/"+page;
    }

    @RequestMapping("/visitor/{page}")
    public String visitorPage(@PathVariable String page){
        return "visitor/"+page;
    }
}
