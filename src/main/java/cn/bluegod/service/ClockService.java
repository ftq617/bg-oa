package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Clock;

import java.util.Date;

/**
 * @program: bg-oa
 * @description: 考勤打卡的逻辑处理层接口
 * @author: Mr.Fu
 * @create: 2018-10-13 15:53
 * @Version V1.0
 */
public interface ClockService {

    BgResult getDayClock(Integer uId);
    BgResult punchTheClock(Integer uId);
    PageResult<Clock> getMonthClock(Integer uId);
    PageResult<Clock> getMonthClockUid(Integer uId,Integer year,Integer month);
    PageResult<Clock> getMonthClockByMonth(Integer uId, Date date);
}
