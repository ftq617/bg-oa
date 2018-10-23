package cn.bluegod.dao;

import cn.bluegod.pojo.Job;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @description: 职位的dao层接口
 * @author: Mr.Fu
 * @create: 2018-10-09 10:19
 * @Version V1.0
 */
public interface JobMapper {
    Job getJobById(Integer id);
    List<Job> getJobByDepId(Integer id);
    List<Job> getJobByJobName(String name);
    List<Job> getJobByStatus(@Param("depId") Integer depId,@Param("status") Integer status);
    List<Job> getJobByName(String name);
    int addJob(Job job);
    int updateJob(Job job);
    int deleteJob(List<Integer> ids);
}
