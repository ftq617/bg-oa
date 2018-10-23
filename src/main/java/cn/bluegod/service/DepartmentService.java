package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Department;

/**
 * @description: 部门的业务逻辑操作接口
 * @author: Mr.Fu
 * @create: 2018-10-08 13:52
 * @Version V1.0
 */
public interface DepartmentService {
    BgResult addDepartment(Department department);
    PageResult<Department> getDepartmentList(Integer page,Integer rows);
    BgResult getDepartmentById(Integer id);
    BgResult getDepartmentByName(String name);
    BgResult updateDepartment(Department department);
    BgResult deleteDepartment(Integer...ids);
}
