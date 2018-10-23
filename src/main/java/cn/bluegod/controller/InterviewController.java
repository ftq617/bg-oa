package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Interview;
import cn.bluegod.pojo.User;
import cn.bluegod.service.InterviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-12 15:12
 * @Version V1.0
 */
@Controller
public class InterviewController {

    @Autowired
    private InterviewService interviewService;


    @RequestMapping("/interview/afternew")
    @ResponseBody
    public BgResult addDelivery(HttpSession session){
        User user=(User) session.getAttribute("USER");
        return interviewService.getInterviewByuIdAfter(user.getId());
    }

    @RequestMapping("/interview/add")
    @ResponseBody
    public BgResult addDelivery(HttpSession session, Interview interview){
        User user=(User) session.getAttribute("USER");
        interview.setuId(user.getId());
        return interviewService.addInterview(interview);
    }

    @RequestMapping("/admin/interview/update")
    @ResponseBody
    public BgResult updateDelivery(Interview interview){
        return interviewService.updateInterview(interview);
    }


    @RequestMapping("/interview/setinterview")
    @ResponseBody
    public BgResult setDelivery(Integer id,Integer isInterview, Date viewTime){
        Interview interview=new Interview();
        interview.setId(id);
        interview.setIsInterview(isInterview);
        interview.setViewTime(viewTime);
        return interviewService.setInterview(interview);
    }

    @RequestMapping("/interview/sethire")
    @ResponseBody
    public BgResult setDelivery(Integer id,Integer isEmploy){
        Interview interview=new Interview();
        interview.setId(id);
        interview.setIsEmploy(isEmploy);
        return interviewService.setHire(interview);
    }

    @RequestMapping("/admin/interview/look")
    @ResponseBody
    public BgResult lookDelivery(Integer id){
        Interview interview=new Interview();
        interview.setId(id);
        interview.setIsRead(1);
        return interviewService.updateInterview(interview);
    }

    @RequestMapping("/admin/interview/delete")
    @ResponseBody
    public BgResult deleteDelivery(Integer...ids){
        return interviewService.deleteInterview(ids);
    }

    @RequestMapping("/interview/list")
    @ResponseBody
    public PageResult<Interview> getDelivery(HttpSession session , Integer isInterview, Integer isEmploy){
        User user=(User) session.getAttribute("USER");
        return interviewService.getInterviewByuId(user.getId(),isInterview,isEmploy);
    }

    @RequestMapping("/admin/interview/list")
    @ResponseBody
    public PageResult<Interview> getAdminDelivery(Integer rctId,Integer isRead,Integer isInterview,Integer isEmploy ){
        return interviewService.getInterviewByrctId(rctId,isRead,isInterview,isEmploy);
    }

    @RequestMapping("/interview/{id}")
    @ResponseBody
    public BgResult getDeliveryById(@PathVariable Integer id){
        return interviewService.getInterviewById(id);
    }
}
