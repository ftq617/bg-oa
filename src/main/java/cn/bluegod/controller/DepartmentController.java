package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Department;
import cn.bluegod.pojo.User;
import cn.bluegod.service.DepartmentService;
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
 * @create: 2018-10-08 14:17
 * @Version V1.0
 */
@Controller
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * @Description: id获取部门信息
     * @Param:
     * @return:
     * @Author: Mr.Fu
     * @Date: 2018/10/10
     **/
    @RequestMapping("/department/{id}")
    @ResponseBody
    public BgResult getDepartment(@PathVariable Integer id){
        return departmentService.getDepartmentById(id);
    }

    /**
     * @Description: 获取部门列表信息
     * @Param:
     * @return:
     * @Author: Mr.Fu
     * @Date: 2018/10/10
     **/
    @RequestMapping("/department/list")
    @ResponseBody
    public PageResult<Department> getDepartmentUser(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10")Integer limit){
        PageResult pageResult=departmentService.getDepartmentList(page,limit);
        return pageResult;
    }

    @RequestMapping("/admin/department/list")
    @ResponseBody
    public PageResult<Department> getDepartment(@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "10")Integer limit){
        PageResult pageResult=departmentService.getDepartmentList(page,limit);
        return pageResult;
    }

    @RequestMapping("/admin/department/delete")
    @ResponseBody
    public BgResult deleteDepartment(Integer...ids){
        if (ids.length<=0){
            return BgResult.build(450,"删除数据不能为空");
        }
        return departmentService.deleteDepartment(ids);
    }

    @RequestMapping("/admin/department/update")
    @ResponseBody
    public BgResult updateDepartment(Department department){
        return departmentService.updateDepartment(department);
    }

    @RequestMapping("/admin/department/add")
    @ResponseBody
    public BgResult addDepartment(Department department, HttpSession session){
        User user=(User)session.getAttribute("USER");
        department.setId(user.getId());
        department.setuName(user.getUserName());
        return departmentService.addDepartment( department);
    }

}
