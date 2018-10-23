package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Recruit;

/**
 * @description: 招聘信息的业务逻辑接口
 * @author: Mr.Fu
 * @create: 2018-09-29 11:31
 * @Version V1.0
 */
public interface RecruitService {
        BgResult addRecruit(Recruit recruit);
        BgResult updateRecruit(Recruit recruit);
        BgResult deleteRecruit(Integer...ids);
        BgResult getRecruitById(Integer id);
        PageResult<Recruit> getRecruitListBySalary(Integer page,Integer limit,Integer min ,Integer max);
        PageResult<Recruit> getRecruitList(Integer page,Integer limit,Recruit recruit);
}
