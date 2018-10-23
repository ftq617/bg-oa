package cn.bluegod.dao;

import cn.bluegod.base.SearchUserCondition;
import cn.bluegod.pojo.User;

import java.util.List;

/**
 * @description: 用户的Dao层
 * @author: Mr.Fu
 * @create: 2018-09-28 14:36
 * @Version V1.0
 */
public interface UserMapper {
    int addUser(User user);
    int updateUser(User user);
    int u_updateUser(User user);
    User getUserByPhone(String phone);
    User getUserById(Integer id);
    List<User> getUserByIds(List<Integer> ids);
    List<User> getUserByJobId(Integer id);
    List<User> getUserByDepId(Integer id);
    List<User> getUserByDepStatus(Integer id);
    List<User> getUserBySearch(SearchUserCondition searchUserCondition);
}
