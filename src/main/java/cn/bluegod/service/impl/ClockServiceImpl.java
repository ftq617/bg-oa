package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.base.TimeUtil;
import cn.bluegod.dao.ClockMapper;
import cn.bluegod.pojo.AwardPenalty;
import cn.bluegod.pojo.Clock;
import cn.bluegod.pojo.User;
import cn.bluegod.service.AwardPenaltyService;
import cn.bluegod.service.ClockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-13 15:57
 * @Version V1.0
 */
@Service

public class ClockServiceImpl implements ClockService {

    @Autowired
    private ClockMapper clockMapper;
    @Autowired
    private AwardPenaltyService awardPenaltyService;
    @Value("${work.goTime.HOUR}")
    private Integer goWorkHouse;
    @Value("${work.goTime.MINUTE}")
    private Integer goWorkMinute;
    @Value("${work.downTime.HOUR}")
    private Integer downWorkHouse;
    @Value("${work.downTime.MINUTE}")
    private Integer downWorkMinute;

    public BgResult getDayClock(Integer uId) {
        List<Clock> list=clockMapper.getClockByuId(uId,TimeUtil.getDayStartTime(),TimeUtil.getDayEndTime());
        if (list==null||list.size()==0){
            return BgResult.ok(1);
        }
        Clock clock=list.get(0);
        if (clock.getEndTime()==null){
            return BgResult.ok(2);
        }else {
            return BgResult.ok(3);
        }
    }

    public BgResult punchTheClock(Integer u_id) {
        int type=-1;
        Clock clock=new Clock();
        User user=new User();
        user.setId(u_id);
        clock.setUser(user);
        StringBuffer str=new StringBuffer();
        List<Clock> clos=clockMapper.getClockByuId(u_id, TimeUtil.getDayStartTime(),TimeUtil.getMonthEndTime());
        Date date=new Date();
        if (clos!=null&clos.size()!=0){
            Clock clo=clos.get(0);
            clock.setId(clo.getId());
            Date up=TimeUtil.getDayWorkTime(downWorkHouse,downWorkMinute);
            if (up.getTime()-date.getTime()>0){
                clock.setIsLeave(1);
                str.append("你早退了哦，等着扣工资吧，");
                if (clo.getIsAbsent()!=1&&up.getTime()-date.getTime()>=10800000L){
                    str.append("你早退超过三小时了，已经旷工了");
                    clock.setIsAbsent(1);
                    setAwardPenalty(u_id,"旷工",100,-1);
                    type=1;
                }
                if (type!=1){
                    setAwardPenalty(u_id,"早退",50,-1);
                }
            }else {
                str.append("下班打卡成功");
            }
            clock.setEndTime(date);
            clockMapper.updateClock(clock);
            return  BgResult.build(200,str.toString());
        }
        clock.setIsLeave(-1);
        clock.setIsAbsent(-1);
        clock.setIsLate(-1);
        if (TimeUtil.dateToWeek(date)==7||TimeUtil.dateToWeek(date)==6) {
            clock.setType(2);
            setAwardPenalty(u_id,"加班",100,1);
        }else {
            clock.setType(1);
        }
        clock.setStartTime(date);

        Date up=TimeUtil.getDayWorkTime(goWorkHouse,goWorkMinute);
        if (date.getTime()-up.getTime()>0){
            clock.setIsLate(1);
            str.append("你迟到了哦，等着扣工资吧，");
            if (date.getTime()-up.getTime()>=10800000L){
                str.append("你迟到超过三小时了，已经旷工了");
                clock.setIsAbsent(1);
                setAwardPenalty(u_id,"旷工",-100,-1);
                type=1;
            }
            if (type!=1){
                setAwardPenalty(u_id,"迟到",50,-1);
            }
        }else {
            str.append("上班打卡成功");
        }
        clockMapper.addClock(clock);
        return BgResult.build(200,str.toString());
    }

    private void setAwardPenalty(int id,String msg,int money,int type){
        AwardPenalty awardPenalty=new AwardPenalty();
        awardPenalty.setReason(msg);
        if (type==1) {
            awardPenalty.setMoney(money * 100);
        }else {
            awardPenalty.setMoney(-money * 100);
        }
        awardPenalty.setuId(id);
        awardPenaltyService.addAwardPenalty(awardPenalty);
    }

    public PageResult<Clock> getMonthClock(Integer uId) {
        List<Clock> list=clockMapper.getClockByuId(uId,TimeUtil.getMonthStartTime(),TimeUtil.getMonthEndTime());
        PageResult<Clock> pageResult=new PageResult<Clock>();
        pageResult.setCode(0);
        pageResult.setData(list);
        pageResult.setCount(list.size());
        return pageResult;
    }

    public PageResult<Clock> getMonthClockUid(Integer uId,Integer year,Integer month) {
        List<Clock> list=clockMapper.getClockByuId(uId,TimeUtil.getMonthStartTimeByYear(year,month),TimeUtil.getMonthEndTimeByYear(year,month));
        PageResult<Clock> pageResult=new PageResult<Clock>();
        pageResult.setCode(0);
        pageResult.setData(list);
        pageResult.setCount(list.size());
        return pageResult;
    }

    public PageResult<Clock> getMonthClockByMonth(Integer uId, Date date) {
        return null;
    }
}
