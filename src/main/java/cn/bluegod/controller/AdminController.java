package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.base.SearchUserCondition;
import cn.bluegod.pojo.User;
import cn.bluegod.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-09 16:30
 * @Version V1.0
 */
@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @RequestMapping("/admin/user/list")
    @ResponseBody
    public PageResult<User> getUser(SearchUserCondition searchUserCondition){
        return  userService.getUserList(searchUserCondition);
    }

    @RequestMapping("/admin/user/update")
    @ResponseBody
    public BgResult updateUser(User user){
        return  userService.updateUser(user);
    }
}
