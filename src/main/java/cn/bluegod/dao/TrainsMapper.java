package cn.bluegod.dao;

import cn.bluegod.pojo.Trains;

import java.util.List;

/**
 * @description: 培训信息的底层操作接口
 * @author: Mr.Fu
 * @create: 2018-10-10 15:13
 * @Version V1.0
 */
public interface TrainsMapper {
    List<Trains> getTrains(Trains trains);
    List<Trains> getTrainsByIds(List<Integer> ids);
    Trains getTrainsById(Integer id);
    int addTrains(Trains trains);
    int updateTrains(Trains Trains);
    int deleteTrains(List<Integer> ids);
}
