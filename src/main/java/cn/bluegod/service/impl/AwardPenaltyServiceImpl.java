package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.base.TimeUtil;
import cn.bluegod.dao.AwardPenaltyMapper;
import cn.bluegod.pojo.AwardPenalty;
import cn.bluegod.service.AwardPenaltyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-15 10:04
 * @Version V1.0
 */
@Service
public class AwardPenaltyServiceImpl implements AwardPenaltyService {

    @Autowired
    private AwardPenaltyMapper awardPenaltyMapper;

    public BgResult addAwardPenalty(AwardPenalty awardPenalty) {
        awardPenalty.setStartTime(new Date());
        awardPenaltyMapper.addAwardPenalty(awardPenalty);
        return BgResult.ok();
    }

    public BgResult updateAwardPenalty(AwardPenalty awardPenalty) {
        awardPenaltyMapper.updateAwardPenalty(awardPenalty);
        return BgResult.ok();
    }

    public BgResult deleteAwardPenalty(Integer... ids) {
        int a=awardPenaltyMapper.deleteAwardPenalty(ids);
        return BgResult.ok(a);
    }

    public PageResult<AwardPenalty> getAwardPenaltyByUidtoMonth(Integer uId) {
        List<AwardPenalty> list= awardPenaltyMapper.getAwardPenaltyByuId(uId, TimeUtil.getMonthStartTime(),TimeUtil.getMonthEndTime());
        PageResult<AwardPenalty> pageResult=new PageResult<AwardPenalty>();
        pageResult.setData(list);
        pageResult.setCount(list.size());
        return pageResult;
    }

    public PageResult<AwardPenalty> getAwardPenaltyByUid(Integer uId, Integer year, Integer month) {
        List<AwardPenalty> list= awardPenaltyMapper.getAwardPenaltyByuId(uId, TimeUtil.getMonthStartTimeByYear(year,month),TimeUtil.getMonthEndTimeByYear(year,month));
        PageResult<AwardPenalty> pageResult=new PageResult<AwardPenalty>();
        pageResult.setData(list);
        pageResult.setCount(list.size());
        return pageResult;
    }
}
