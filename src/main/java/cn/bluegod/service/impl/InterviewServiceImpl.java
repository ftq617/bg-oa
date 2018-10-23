package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.dao.*;
import cn.bluegod.pojo.*;
import cn.bluegod.service.InterviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-12 14:49
 * @Version V1.0
 */
@Service
public class InterviewServiceImpl implements InterviewService {

    @Autowired
    private InterviewMapper interviewMapper;
    @Autowired
    private ResumeMapper resumeMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private RecruitMapper recruitMapper;

    public BgResult addInterview(Interview interview) {
        if (interview.getRctId()==null){
            return BgResult.build(509,"发生意外错误");
        }
        Interview is1=interviewMapper.getInterviewByuIdAndrctId(interview.getuId(),interview.getRctId());
        if (is1!=null){
            return BgResult.build(507,"你已经投递过了，静静的等等待面试信息吧");
        }
        Resume resume=resumeMapper.getResumeByU_id(interview.getuId());
        if (resume==null){
            return BgResult.build(508,"你还没有简历呢，请添加简历后再来");
        }
        interview.setResume(resume);
        interview.setIsRead(-1);
        interview.setStartTime(new Date());
        interview.setIsInterview(-1);
        interview.setViewTime(null);
        interview.setIsEmploy(-1);
        interviewMapper.addInterview(interview);
        return BgResult.ok();
    }

    public BgResult updateInterview(Interview interview) {
        interviewMapper.updateInterview(interview);
        return BgResult.ok();
    }

    public BgResult deleteInterview(Integer... ids) {
        if (ids.length<=0){
            return BgResult.build(406,"输入错误");
        }
        interviewMapper.deleteInterview(ids);
        return BgResult.ok();
    }

    public BgResult getInterviewById(Integer id) {
        return BgResult.ok(interviewMapper.getInterviewById(id));
    }

    public BgResult setInterview(Interview interview) {
        if (interview.getIsInterview()==1&&interview.getViewTime()!=null){
            Date date=new Date();
            if (interview.getViewTime().getTime()<date.getTime()){
                return BgResult.build(409,"换明天之后的时间吧，换个时间吧");
            }
            return updateInterview(interview);
        }
        if (interview.getIsInterview()==2){
            BgResult result=updateInterview(interview);
            result.setMsg("退回成功");
            return result;
        }
        Interview view=interviewMapper.getInterviewById(interview.getId());
        if (interview.getIsInterview()==3&&view.getIsInterview()==1){
            BgResult result=updateInterview(interview);
            result.setMsg("同意成功");
            return result;
        }
        if (interview.getIsInterview()==4&&view.getIsInterview()==1){
            BgResult result=updateInterview(interview);
            result.setMsg("拒绝成功");
            return result;
        }
        return BgResult.build(408,"你是不是输错东西了，"+interview);
    }

    public BgResult setHire(Interview interview) {
        Interview view=interviewMapper.getInterviewById(interview.getId());
        if (interview.getIsEmploy()==1&&view.getIsInterview()!=3){
            return BgResult.build(508,"他还没面试呢，不要着急拒绝他");
        }if (interview.getIsEmploy()==2&&view.getIsInterview()!=3){
            return BgResult.build(508,"他还没面试呢，不要着急雇佣人家");
        }if (interview.getIsEmploy()==3&&view.getIsInterview()!=3){
            return BgResult.build(508,"公司还没决定要你呢，不要急着拒绝");
        }if (interview.getIsEmploy()==4&&view.getIsInterview()!=3){
            return BgResult.build(508,"公司还没决定要你呢，不要急着就职");
        }if (interview.getIsEmploy()==4){
            User user=new User();
            user.setId(view.getuId());
            user.setType(3);
            user.setSalary(view.getResume().getSalary());
            Recruit recruit=recruitMapper.getRecruitById(view.getRctId());
            user.setDepartmentId(recruit.getDepartment().getId());
            user.setDepartmentName(recruit.getDepartment().getdName());
            user.setRecruitId(recruit.getId());
            user.setJoinTime(new Date());
            userMapper.updateUser(user);
        }
        return updateInterview(interview);
    }

    public BgResult getInterviewByuIdAfter(Integer u_id) {
        return BgResult.ok(interviewMapper.getInterviewByuIdAfter(u_id));
    }


    public PageResult<Interview> getInterviewByuId(Integer uId, Integer isInterview, Integer isEmploy) {
        List<Interview> list=interviewMapper.getInterviewByuId(uId,isInterview,isEmploy);
        PageResult<Interview> result=new PageResult<Interview>();
        result.setCode(0);
        result.setData(list);
        result.setCount(list.size());
        return result;
    }

    public PageResult<Interview> getInterviewByrctId(Integer rctId, Integer isRead, Integer isInterview, Integer isEmploy) {
        List<Interview> list=interviewMapper.getInterviewByRetId(rctId,isRead,isInterview,isEmploy);
        PageResult<Interview> result=new PageResult<Interview>();
        result.setCode(0);
        result.setData(list);
        result.setCount(list.size());
        return result;
    }

}
