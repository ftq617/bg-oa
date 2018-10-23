package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Interview;

/**
 * @program: bg-oa
 * @description: 面试的逻辑层接口
 * @author: Mr.Fu
 * @create: 2018-10-12 14:43
 * @Version V1.0
 */
public interface InterviewService {

    BgResult addInterview(Interview interview);
    BgResult updateInterview(Interview interview);
    BgResult deleteInterview(Integer...ids);
    BgResult getInterviewById(Integer id);
    BgResult setInterview(Interview interview);
    BgResult setHire(Interview interview);
    BgResult getInterviewByuIdAfter(Integer u_id);
    PageResult<Interview> getInterviewByuId(Integer uId,Integer isInterview,Integer isEmploy);
    PageResult<Interview> getInterviewByrctId(Integer rctId,Integer isRead,Integer isInterview,Integer isEmploy );
}
