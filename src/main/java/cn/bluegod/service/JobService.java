package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Job;

import java.util.List;

/**
 * @program: bg-oa
 * @description: 职位联动的逻辑操作接口
 * @author: Mr.Fu
 * @create: 2018-10-09 10:35
 * @Version V1.0
 */
public interface JobService {
    PageResult<Job> getJobByDepId(Integer id);
    BgResult getJobById(Integer id);
    PageResult<Job> getJobByDepStatus(Integer depId,Integer status);
    PageResult<Job> getJobByDepName(String name);
    BgResult addJob(Job job);
    BgResult updateJob(Job job);
    BgResult deleteJob(Integer...ids);
}
