package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Recruit;
import cn.bluegod.pojo.User;
import cn.bluegod.service.RecruitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-09-29 16:20
 * @Version V1.0
 */
@Controller
public class RecruitController {

    @Autowired
    private RecruitService recruitService;
    @RequestMapping("/admin/recruit/add")
    @ResponseBody
    public BgResult addRecruit(HttpSession session,Recruit recruit){
        User user=(User)session.getAttribute("USER");
        recruit.setUser(user);
        recruit.setSalary(recruit.getSalary()*100);
        System.out.println(recruit);
        return recruitService.addRecruit(recruit);
    }
    @RequestMapping("/admin/recruit/update")
    @ResponseBody
    public BgResult updateRecruit(Recruit recruit){
        recruit.setSalary(recruit.getSalary()*100);
        System.out.println(recruit);
        return recruitService.updateRecruit(recruit);
    }
    @RequestMapping("/admin/recruit/delete")
    @ResponseBody
    public BgResult deleteRecruit(Integer...ids){
        return recruitService.deleteRecruit(ids);
    }

    @RequestMapping("/recruit/list")
    @ResponseBody
    public PageResult<Recruit> getRecruitList(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer limit, Recruit recruit){
        recruit.setStatus(1);
        return recruitService.getRecruitList(page,limit,recruit);
    }
    @RequestMapping("/recruit/{id}")
    @ResponseBody
    public BgResult getRecruitList(@PathVariable Integer id){
        return recruitService.getRecruitById(id);
    }

    @RequestMapping("/admin/recruit/list")
    @ResponseBody
    public PageResult<Recruit> getAdminRecruitList(@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer limit, Recruit recruit){
        return recruitService.getRecruitList(page,limit,recruit);
    }

    @RequestMapping("/recruit/salary")
    @ResponseBody
    public PageResult<Recruit> getRecruitListBySalary(Integer page,Integer rows,Integer min,Integer max){
        return recruitService.getRecruitListBySalary(page,rows,min,max);
    }
}
