package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Trains;
import cn.bluegod.pojo.User;
import cn.bluegod.pojo.UserTrains;

/**
 * @description: 培训信息的逻辑接口层接口
 * @author: Mr.Fu
 * @create: 2018-10-10 18:00
 * @Version V1.0
 */
public interface UserTrainsService {

    BgResult addUserTrains(UserTrains userTrains);
    BgResult deleteUserTrains(Integer...ids);
    BgResult getAfteTrains(Integer id);
    PageResult<Trains> getTrainsByU_id(Integer page,Integer limit,Integer u_id);
    PageResult<User> getUserByT_id(Integer page,Integer limit,Integer t_id);
    PageResult<Trains> getTrainsByU_idAndStatus(Integer page,Integer limit,Integer u_id,Integer status);
}
