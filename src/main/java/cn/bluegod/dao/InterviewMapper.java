package cn.bluegod.dao;

import cn.bluegod.pojo.Interview;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-12 14:18
 * @Version V1.0
 */
public interface InterviewMapper {
    int addInterview(Interview interview);
    int updateInterview(Interview interview);
    int deleteInterview(Integer...ids);
    Interview getInterviewById(Integer id);
    Interview getInterviewByuIdAndrctId(@Param("uId") Integer uId,@Param("rctId") Integer rctId);
    List<Interview> getInterviewByuId(@Param("uId")Integer uId,@Param("isInterview")Integer isInterview,@Param("isEmploy")Integer isEmploy);
    List<Interview> getInterviewByuIdAfter(@Param("uId")Integer uId);
    List<Interview> getInterviewByRetId(@Param("rctId")Integer rctId,@Param("isRead")Integer isRead,@Param("isInterview")Integer isInterview,@Param("isEmploy")Integer isEmploy );

}
