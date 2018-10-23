package cn.bluegod.dao;

import cn.bluegod.pojo.Department;

import java.util.List;

/**
 * @description: 部门的数据库操作接口
 * @author: Mr.Fu
 * @create: 2018-10-08 13:38
 * @Version V1.0
 */
public interface DepartmentMapper {

    int addDepartment(Department department);
    List<Department> getDepartmentList();
    Department getDepartmentByName(String name);
    Department getDepartmentById(Integer id);
    int updateDepartment(Department department);
    int deleteDepartment(List<Integer> ids);
}
