package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.dao.AwardPenaltyMapper;
import cn.bluegod.dao.ObjectionMapper;
import cn.bluegod.dao.SalaryMapper;
import cn.bluegod.pojo.AwardPenalty;
import cn.bluegod.pojo.Objection;
import cn.bluegod.pojo.Salary;
import cn.bluegod.service.ObjectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-16 17:53
 * @Version V1.0
 */
@Service
public class ObjectionServiceImpl implements ObjectionService {

    @Autowired
    private ObjectionMapper objectionMapper;
    @Autowired
    private AwardPenaltyMapper awardPenaltyMapper;
    @Autowired
    private SalaryMapper salaryMapper;

    public BgResult addObjection(Objection objection) {
        Objection o=objectionMapper.getObjectionById(objection.getId());
        if (o!=null){
            return BgResult.build(509,"你已经提过一个异议了");
        }
        objection.setIsHandle(-1);
        objection.setTime(new Date());
        objectionMapper.addObjection(objection);
        Salary salary=new Salary();
        salary.setIsObjection(1);
        salary.setId(objection.getId());
        salary.setIsHandle(1);
        salaryMapper.updateSalary(salary);
        return BgResult.ok();
    }

    public BgResult updateHandleObjection(Integer id, Integer uId,Integer money,Integer type) {
        if (type==1){
            Objection objection=new Objection();
            objection.setId(id);
            objection.setMoney(money*100);
            objection.setIsHandle(1);
            Date date=new Date();
            objection.setReissTime(date);
            objectionMapper.updateObjection(objection);
            Salary salary=new Salary();
            salary.setId(id);
            salary.setIsHandle(-1);
            salaryMapper.updateSalary(salary);
            AwardPenalty awardPenalty=new AwardPenalty();
            awardPenalty.setuId(uId);
            awardPenalty.setMoney(money*100);
            awardPenalty.setReason("上个月的异常补贴");
            awardPenalty.setStartTime(date);
            awardPenaltyMapper.addAwardPenalty(awardPenalty);
            return BgResult.ok("同意异常薪资成功！！！");
        }else if(type==2) {
            Objection objection=new Objection();
            objection.setId(id);
            objection.setIsHandle(2);
            objectionMapper.updateObjection(objection);
            Salary salary=new Salary();
            salary.setIsHandle(-1);
            salary.setId(id);
            salaryMapper.updateSalary(salary);
            return BgResult.ok("否决异常薪资成功！！！");
        }
        return BgResult.build(510,"参数错误");
    }

    public BgResult deleteObjection(Integer... ids) {
        objectionMapper.deleteObjection(ids);
        return BgResult.ok();
    }

    public BgResult getObjectionById(Integer id) {
        Objection objection=objectionMapper.getObjectionById(id);
        return BgResult.ok(objection);
    }

    public PageResult<Objection> getObjectionByuId(Integer uId, Date start, Date end) {
        return null;
    }

    public PageResult<Objection> getObjectionByHandle(Integer isHandle, Date start, Date end) {
        return null;
    }
}
