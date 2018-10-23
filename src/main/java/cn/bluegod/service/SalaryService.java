package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Salary;

/**
 * @program: bg-oa
 * @description: 薪资的业务逻辑层操作接口
 * @author: Mr.Fu
 * @create: 2018-10-15 11:27
 * @Version V1.0
 */
public interface SalaryService {
    BgResult addSalary(Integer uId);
    BgResult getSalaryByUidtoMonth(Integer uid);
    BgResult getSalaryByUid(Integer uid,Integer year,Integer month);
}
