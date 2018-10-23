package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.dao.DepartmentMapper;
import cn.bluegod.dao.UserMapper;
import cn.bluegod.pojo.Department;
import cn.bluegod.pojo.User;
import cn.bluegod.service.DepartmentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-08 13:56
 * @Version V1.0
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private UserMapper userMapper;

    public BgResult addDepartment(Department department) {
        BgResult result=getDepartmentByName(department.getdName());
        if (result.getStatus()!=200){
            return result;
        }
        department.setCreateTime(new Date());
        department.setStatus(1);
        departmentMapper.addDepartment(department);
        return BgResult.ok();
    }

    public PageResult<Department> getDepartmentList(Integer page,Integer rows) {
        PageHelper.startPage(page,rows,true);
        List<Department> list=departmentMapper.getDepartmentList();
        PageInfo<Department> pageInfo=new PageInfo<Department>(list);
        PageResult<Department> pageResult=new PageResult<Department>();
        pageResult.setData(pageInfo.getList());
        pageResult.setCount(pageInfo.getTotal());
        pageResult.setPage(pageInfo.getPageNum());
        pageResult.setPageCount(pageInfo.getPageSize());
        pageResult.setCode(0);
        return pageResult;
    }

    public BgResult getDepartmentById(Integer id) {
        Department department=departmentMapper.getDepartmentById(id);
        if (department==null){
            return BgResult.build(450,"数据异常");
        }
        return BgResult.ok(department);
    }

    public BgResult getDepartmentByName(String name) {
        Department dpt=departmentMapper.getDepartmentByName(name);
            if (dpt!=null){
            return BgResult.build(505,"部门名不可用，重复了！！！",dpt.getId());
        }
        return BgResult.ok();
    }

    public BgResult updateDepartment(Department department) {
        BgResult result=getDepartmentByName(department.getdName());
        if (result.getStatus()!=200&&result.getData()!=department.getId()){
            return result;
        }
        departmentMapper.updateDepartment(department);
        return BgResult.ok();
    }

    public BgResult deleteDepartment(Integer...ids) {
        ArrayList<Integer> can_ids=new ArrayList<Integer>();
        for (int i=0;i<ids.length;i++)
        {
            List<User> list=userMapper.getUserByDepId(ids[i]);
            if (list==null||list.size()<=0){
                can_ids.add(ids[i]);
            }
        }
        if (can_ids.size()<=0){
            return BgResult.build(400,"部门还有人参与不能删除");
        }
        departmentMapper.deleteDepartment(can_ids);
        StringBuffer str=new StringBuffer();
        for (int i=0;i<can_ids.size();i++) {
            str.append(can_ids.get(i)+",");
        }
        return BgResult.build(200,"成功删除id为"+str+"部门,但有"+(ids.length-can_ids.size())+"个部门有人不能删除");
    }
}
