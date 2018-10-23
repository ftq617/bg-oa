package cn.bluegod.dao;

import cn.bluegod.pojo.Clock;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @description: 考勤打卡的dao层类
 * @author: Mr.Fu
 * @create: 2018-10-13 13:38
 * @Version V1.0
 */
public interface ClockMapper {

    int addClock(Clock clock);
    int updateClock(Clock clock);
    int deleteClock(Integer...ids);
    Clock getClockById(Integer id);
    List<Clock> getClockByuId(@Param("uId") Integer id,@Param("start") Date start,@Param("end") Date end);
    List<Clock> getClockList(Clock clock);
}
