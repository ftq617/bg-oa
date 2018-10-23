package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.base.TimeUtil;
import cn.bluegod.dao.AwardPenaltyMapper;
import cn.bluegod.dao.ClockMapper;
import cn.bluegod.dao.SalaryMapper;
import cn.bluegod.dao.UserMapper;
import cn.bluegod.pojo.AwardPenalty;
import cn.bluegod.pojo.Clock;
import cn.bluegod.pojo.Salary;
import cn.bluegod.pojo.User;
import cn.bluegod.service.SalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-15 14:53
 * @Version V1.0
 */
@Service
public class SalaryServiceImpl implements SalaryService {

    @Autowired
    private SalaryMapper salaryMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AwardPenaltyMapper awardPenaltyMapper;
    @Autowired
    private ClockMapper clockMapper;

    private int SOCIAL=50000;


    public BgResult addSalary(Integer uId) {
        List<Salary> list=salaryMapper.getSalaryByUid(uId,TimeUtil.getMonthTimeBefore(),TimeUtil.getMonthTimeBefore());
        if (list != null&&list.size()>0) {
            return BgResult.build(550,"该用户上月工资已结算");
        }
        Calendar calendar=Calendar.getInstance();
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        System.out.println(day);
        if ( day !=16){
            return BgResult.build(560,"每月1号才能结算。");
        }
        Salary salary=new Salary();
        salary.setuId(uId);
        Date date=TimeUtil.getMonthTimeBefore();
        salary.setOvertime(date);
        setSalary(salary);
        salaryMapper.addSalary(salary);
        return BgResult.ok();
    }

    private void setSalary(Salary salary){
        User user=userMapper.getUserById(salary.getuId());
        salary.setBasic(user.getSalary());
        List<Clock> clocks=clockMapper.getClockByuId(salary.getuId(),TimeUtil.getMonthTimeBefore(),TimeUtil.getMonthEndTimeBefore());
        int z=0;
        for (Clock clock:clocks){
            if (clock.getEndTime()==null){
                AwardPenalty awardPenalty=new AwardPenalty();
                awardPenalty.setuId(salary.getuId());
                awardPenalty.setMoney(-100*100);
                awardPenalty.setReason("矿工");
                awardPenalty.setStartTime(clock.getStartTime());
                awardPenaltyMapper.addAwardPenalty(awardPenalty);
            }
            if (clock.getType()==1){
                z++;
            }
        }
        int fa=0;
        for (int i=1;i<=TimeUtil.getMonthDay();i++){
            if(!TimeUtil.getMonthDayisWeek(i)) {
                fa = 0;
                for (Clock clock : clocks) {
                    Calendar c = Calendar.getInstance();
                    c.setTime(clock.getStartTime());
                    int day = c.get(Calendar.DAY_OF_MONTH);
                    if (i == day) {
                        break;
                    }
                    fa++;
                }
                if (fa == clocks.size()) {
                    AwardPenalty awardPenalty = new AwardPenalty();
                    awardPenalty.setuId(salary.getuId());
                    awardPenalty.setMoney(-100 * 100);
                    awardPenalty.setReason("没来上班");
                    awardPenalty.setStartTime(TimeUtil.getMonthDayTime(i));
                    awardPenaltyMapper.addAwardPenalty(awardPenalty);
                }
            }
        }
        int j=0;
        List<AwardPenalty> list=awardPenaltyMapper.getAwardPenaltyByuId(salary.getuId(),TimeUtil.getMonthTimeBefore(),TimeUtil.getMonthEndTimeBefore());
        for (AwardPenalty penalty:list){
            j+=penalty.getMoney();
        }
        salary.setReApun(j);
        salary.setIsHandle(-1);
        salary.setIsObjection(-1);
        salary.setSocial(SOCIAL);
    }

    public BgResult getSalaryByUidtoMonth(Integer uid) {
        return null;
    }

    public BgResult getSalaryByUid(Integer uid, Integer year, Integer month) {
        List<Salary> list=salaryMapper.getSalaryByUid(uid,TimeUtil.getMonthStartTimeByYear(year,month),TimeUtil.getMonthEndTimeByYear(year,month));
        if (list.size()==0){
            return BgResult.build(505,"没有数据",list);
        }
        return BgResult.build(200,"OK",list.get(0));
    }
}
