package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.AwardPenalty;

import java.util.Date;

/**
 * @program: bg-oa
 * @description: 奖惩业务逻辑层的接口
 * @author: Mr.Fu
 * @create: 2018-10-15 10:01
 * @Version V1.0
 */
public interface AwardPenaltyService {

    BgResult addAwardPenalty(AwardPenalty awardPenalty);
    BgResult updateAwardPenalty(AwardPenalty awardPenalty);
    BgResult deleteAwardPenalty(Integer... ids);
    PageResult<AwardPenalty> getAwardPenaltyByUidtoMonth(Integer uId);
    PageResult<AwardPenalty> getAwardPenaltyByUid(Integer uId, Integer year, Integer month);
}
