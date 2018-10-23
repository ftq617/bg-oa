package cn.bluegod.dao;

import cn.bluegod.pojo.Salary;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @description: 薪资的dao层操作接口
 * @author: Mr.Fu
 * @create: 2018-10-15 10:29
 * @Version V1.0
 */
public interface SalaryMapper {

    int addSalary(Salary salary);
    int updateSalary(Salary salary);
    Salary getSalaryByid(Integer id);
    List<Salary> getSalaryByUid(@Param("uId") Integer uId, @Param("start") Date start, @Param("end") Date end);
}
