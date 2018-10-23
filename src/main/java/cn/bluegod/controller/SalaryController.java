package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Salary;
import cn.bluegod.pojo.User;
import cn.bluegod.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-16 10:51
 * @Version V1.0
 */
@Controller
public class SalaryController {

    @Autowired
    private SalaryService salaryService;

    @RequestMapping("/admin/salary/add")
    @ResponseBody
    public BgResult addSalary(Integer uId){
        return salaryService.addSalary(uId);
    }

    @RequestMapping("/users/salary/list")
    @ResponseBody
    public BgResult getSalary(HttpSession session, Integer year, Integer month){
        User user=(User)session.getAttribute("USER");
        return salaryService.getSalaryByUid(user.getId(),year,month);
    }

    @RequestMapping("/admin/salary/list")
    @ResponseBody
    public BgResult getSalaryAdmin(Integer uId, Integer year, Integer month){
        return salaryService.getSalaryByUid(uId,year,month);
    }
}
