package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Trains;
import cn.bluegod.pojo.User;
import cn.bluegod.pojo.UserTrains;
import cn.bluegod.service.UserTrainsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-10 18:48
 * @Version V1.0
 */
@Controller
public class UserTrainsController {

    @Autowired
    private UserTrainsService userTrainsService;

    @RequestMapping("/users/userTrains/add")
    @ResponseBody
    public BgResult registrationTraining(HttpSession session,Integer t_id){
        UserTrains userTrains=new UserTrains();
        User user=(User)session.getAttribute("USER");
        userTrains.setU_id(user.getId());
        userTrains.setT_id(t_id);
        return userTrainsService.addUserTrains(userTrains);
    }

    @RequestMapping("/users/userTrains/list")
    @ResponseBody
    public PageResult<Trains> getUserTrains(HttpSession session, @RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer limit){
        User user=(User)session.getAttribute("USER");
        return userTrainsService.getTrainsByU_id(page,limit,user.getId());
    }


    @RequestMapping("/users/userTrains/list_status")
    @ResponseBody
    public PageResult<Trains> getUserTrainsByStatus(HttpSession session, @RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer limit,Integer status){
        User user=(User)session.getAttribute("USER");
        return userTrainsService.getTrainsByU_idAndStatus(page,limit,user.getId(),status);
    }

    @RequestMapping("/admin/userTrains/get_user")
    @ResponseBody
    public PageResult<User> getUser(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer limit,Integer t_id){
        return userTrainsService.getUserByT_id(page,limit,t_id);
    }

    @RequestMapping("/users/userTrains/get_after")
    @ResponseBody
    public BgResult getAfteTrains(HttpSession session){
        User user=(User)session.getAttribute("USER");
        return userTrainsService.getAfteTrains(user.getId());
    }
}
