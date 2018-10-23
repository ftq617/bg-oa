package cn.bluegod.dao;

import cn.bluegod.pojo.Recruit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-09-29 10:59
 * @Version V1.0
 */
public interface RecruitMapper {

    int addRecruit(Recruit recruit);
    int updateRecruit(Recruit recruit);
    int deleteRecruit(List<Integer> ids);
    Recruit getRecruitById(Integer id);
    List<Recruit> getRecruitList(Recruit recruit);
    List<Recruit> getRecruitListBySalary(@Param("min") Integer min,@Param("max") Integer max);
}
