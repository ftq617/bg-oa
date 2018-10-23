package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.dao.DepartmentMapper;
import cn.bluegod.dao.JobMapper;
import cn.bluegod.dao.UserMapper;
import cn.bluegod.pojo.Department;
import cn.bluegod.pojo.Job;
import cn.bluegod.pojo.User;
import cn.bluegod.service.JobService;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-09 10:40
 * @Version V1.0
 */
@Service
public class JobServiceImpl implements JobService {

    @Autowired
    private JobMapper jobMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private UserMapper userMapper;

    public PageResult<Job> getJobByDepId(Integer id) {
        PageResult<Job> pageResult=new PageResult<Job>();
        List<Job> list=jobMapper.getJobByDepId(id);
        if (list!=null&&list.size()>0){
            pageResult.setCode(0);
            pageResult.setData(list);
            return pageResult;
        }
        pageResult.setCode(505);
        pageResult.setMsg("暂时还没有数据");
        return pageResult;
    }

    public BgResult getJobById(Integer id) {
        Job job=jobMapper.getJobById(id);
        if (job!=null){
            return BgResult.ok(job);
        }
        return BgResult.build(405,"数据异常");
    }

    public PageResult<Job> getJobByDepStatus(Integer depId, Integer status) {
        PageResult<Job> pageResult=new PageResult<Job>();
        List<Job> list=jobMapper.getJobByStatus(depId,status);
        if (list!=null&&list.size()>0){
            pageResult.setCode(0);
            pageResult.setData(list);
            return pageResult;
        }
        pageResult.setCode(505);
        pageResult.setMsg("暂时还没有数据");
        return pageResult;
    }

    public PageResult<Job> getJobByDepName(String name) {
        PageResult<Job> pageResult=new PageResult<Job>();
        List<Job> list=jobMapper.getJobByName(name);
        if (list!=null&&list.size()>0){
            pageResult.setCode(0);
            pageResult.setData(list);
            return pageResult;
        }
        pageResult.setCode(505);
        pageResult.setMsg("暂时还没有数据");
        return pageResult;
    }

    public BgResult addJob(Job job) {
        List<Job> list=jobMapper.getJobByName(job.getJobName());
        if (list!=null&&list.size()>0){
            return BgResult.build(510,"此职位已存在");
        }
        job.setCreateTime(new Date());
        job.setStatus(1);
        jobMapper.addJob(job);
        return BgResult.ok(job);
    }

    public BgResult updateJob(Job job) {
        List<Job> list=jobMapper.getJobByName(job.getJobName());
        if ((list!=null&&list.size()>0)||list.get(0).getId().equals(job.getId())){
            return BgResult.build(510,"此职位已存在");
        }
        Department department=departmentMapper.getDepartmentById(job.getDepId());
        job.setDepName(department.getdName());
        jobMapper.updateJob(job);
        return BgResult.ok(job);
    }

    public BgResult deleteJob(Integer... ids) {
        ArrayList<Integer> can_ids=new ArrayList<Integer>();
        for (int i=0;i<ids.length;i++)
        {
            List<User> list=userMapper.getUserByJobId(ids[i]);
            if (list==null||list.size()<=0){
                can_ids.add(ids[i]);
            }
        }
        if (can_ids.size()<=0){
            return BgResult.build(400,"职位还有人参与不能删除");
        }
        int a=jobMapper.deleteJob(can_ids);
        StringBuffer str=new StringBuffer();
        for (int i=0;i<can_ids.size();i++) {
            str.append(can_ids.get(i)+",");
        }
        return BgResult.build(200,"成功删除id为"+str+"职位,但有"+(ids.length-can_ids.size())+"个职位有人不能删除");
    }
}
