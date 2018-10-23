package cn.bluegod.dao;

import cn.bluegod.pojo.AwardPenalty;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @program: bg-oa
 * @description: 奖惩的dao层操作类
 * @author: Mr.Fu
 * @create: 2018-10-15 09:48
 * @Version V1.0
 */
public interface AwardPenaltyMapper {

    int addAwardPenalty(AwardPenalty awardPenalty);
    int updateAwardPenalty(AwardPenalty awardPenalty);
    int deleteAwardPenalty(Integer... ids);
    AwardPenalty getAwardPenaltyById(Integer id);
    List<AwardPenalty> getAwardPenaltyByuId(@Param("uId") Integer uId,@Param("start")  Date start,@Param("end")  Date end);
}
