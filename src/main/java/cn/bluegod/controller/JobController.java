package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Job;
import cn.bluegod.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-09 13:08
 * @Version V1.0
 */
@Controller
public class JobController {

    @Autowired
    private JobService jobService;

    /**
     * @Description: id获取职位信息
     * @Param:
     * @return:
     * @Author: Mr.Fu
     * @Date: 2018/10/10
     **/
    @RequestMapping("/job/{id}")
    @ResponseBody
    public PageResult<Job> getJobUserById(@PathVariable Integer id){
        return jobService.getJobByDepId(id);
    }
    /**
     * @Description: 获取职位列表
     * @Param:
     * @return:
     * @Author: Mr.Fu
     * @Date: 2018/10/10
     **/
    @RequestMapping("/job/list")
    @ResponseBody
    public PageResult<Job> getJobUser(Integer depId,String name){
        Integer status=1;
        PageResult<Job> pageResult=new PageResult<Job>();
        if (name!=null){
            return jobService.getJobByDepName(name);
        }
        if (depId!=null){
            return jobService.getJobByDepStatus(depId,status);
        }
        pageResult.setCode(403);
        pageResult.setMsg("参数错误");
        return pageResult;
    }


    @RequestMapping("/admin/job/list")
    @ResponseBody
    public PageResult<Job> getJob(Integer depId,Integer status,String name){
        PageResult<Job> pageResult=new PageResult<Job>();
        if (name!=null){
            return jobService.getJobByDepName(name);
        }
        if (status!=null&&depId!=null){
            return jobService.getJobByDepStatus(depId,status);
        }
        if (depId!=null){
            return jobService.getJobByDepId(depId);
        }
        pageResult.setCode(403);
        pageResult.setMsg("参数错误");
        return pageResult;
    }

    @RequestMapping("/admin/job/add")
    @ResponseBody
    public BgResult addJob(Job job){
        return jobService.addJob(job);
    }

    @RequestMapping("/admin/job/delete")
    @ResponseBody
    public BgResult deleteJob(Integer...ids){
        return jobService.deleteJob(ids);
    }

    @RequestMapping("/admin/job/update")
    @ResponseBody
    public BgResult updateJob(Job job){
        return jobService.updateJob(job);
    }
}
