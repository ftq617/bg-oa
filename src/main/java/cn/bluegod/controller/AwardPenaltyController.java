package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.AwardPenalty;
import cn.bluegod.pojo.User;
import cn.bluegod.service.AwardPenaltyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-15 19:27
 * @Version V1.0
 */
@Controller
public class AwardPenaltyController {

    @Autowired
    private AwardPenaltyService awardPenaltyService;

    @RequestMapping("/users/award/list")
    @ResponseBody
    public PageResult<AwardPenalty> getAwardPenalty(HttpSession session,Integer year,Integer month){
        User user=(User)session.getAttribute("USER");
        return awardPenaltyService.getAwardPenaltyByUid(user.getId(),year,month);
    }

    @RequestMapping("/admin/award/list")
    @ResponseBody
    public PageResult<AwardPenalty> getAwardPenaltyAdmin(Integer uId,Integer year,Integer month){
        return awardPenaltyService.getAwardPenaltyByUid(uId,year,month);
    }

    @RequestMapping("/admin/award/add")
    @ResponseBody
    public BgResult addAwardPenalty(Integer uId, String reason, Integer money){
        AwardPenalty awardPenalty=new AwardPenalty();
        awardPenalty.setReason(reason);
        awardPenalty.setMoney(money*100);
        awardPenalty.setuId(uId);
        return awardPenaltyService.addAwardPenalty(awardPenalty);
    }

    @RequestMapping("/admin/award/delete")
    @ResponseBody
    public BgResult deleteAwardPenalty(Integer...ids){
        return awardPenaltyService.deleteAwardPenalty(ids);
    }

    @RequestMapping("/admin/award/update")
    @ResponseBody
    public BgResult updateAwardPenalty(AwardPenalty awardPenalty){
        return awardPenaltyService.updateAwardPenalty(awardPenalty);
    }
}
