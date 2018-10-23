package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Clock;
import cn.bluegod.pojo.User;
import cn.bluegod.service.ClockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-13 17:14
 * @Version V1.0
 */
@Controller
public class ClockController {

    @Autowired
    private ClockService clockService;

    @RequestMapping("/users/clock/day")
    @ResponseBody
    public BgResult getDayClock(HttpSession session){
        User user =(User) session.getAttribute("USER");
        return clockService.getDayClock(user.getId());
    }


    @RequestMapping("/users/clock/punch")
    @ResponseBody
    public BgResult punchClock(HttpSession session){
        User user =(User) session.getAttribute("USER");
        return clockService.punchTheClock(user.getId());
    }

    @RequestMapping("/users/clock/list")
    @ResponseBody
    public PageResult<Clock> getClock(HttpSession session,Integer year, Integer month){
        User user =(User) session.getAttribute("USER");
        return clockService.getMonthClockUid(user.getId(),year,month);
    }

    @RequestMapping("/admin/clock/list")
    @ResponseBody
    public PageResult<Clock> getClockAdmin(Integer uId,Integer year,Integer month){
        return clockService.getMonthClockUid(uId,year,month);
    }

}
