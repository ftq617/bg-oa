package cn.bluegod.dao;

import cn.bluegod.pojo.UserTrains;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-10 17:18
 * @Version V1.0
 */
public interface UserTrainsMapper {

    int addUserTrains(UserTrains trains);

    int deleteUserTrains(Integer...ids);

    List<UserTrains> getUserTrainsByU_id(@Param("u_id")Integer u_id,@Param("status")Integer status);
    List<UserTrains> getUserTrainsByT_id(@Param("t_id")Integer t_id,@Param("status")Integer status);
    List<UserTrains> getUserTrainsByU_idAndT_id(@Param("u_id")Integer u_id,@Param("t_id")Integer t_id,@Param("status")Integer status);
    UserTrains getUserTrainsById(Integer id);
}
