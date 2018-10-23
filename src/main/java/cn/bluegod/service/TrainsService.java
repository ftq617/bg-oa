package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Trains;

/**
 * @description: 培训的业务逻辑接口
 * @author: Mr.Fu
 * @create: 2018-10-10 16:18
 * @Version V1.0
 */
public interface TrainsService {

    BgResult addTrains(Trains trains,Integer...u_ids);
    BgResult deleteTrains(Integer...ids);
    BgResult updateTrains(Trains trains);
    PageResult<Trains> getTrains(Integer page,Integer limit,Trains trains);
    BgResult getTrainsById(Integer id);
}
