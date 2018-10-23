package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.base.SearchUserCondition;
import cn.bluegod.pojo.User;

/**
 * @description: 用户的逻辑接口
 * @author: Mr.Fu
 * @create: 2018-09-28 14:55
 * @Version V1.0
 */
public interface UserService {

    BgResult login(User user);
    BgResult register(User user);
    BgResult check(String phone);
    BgResult updateUser(User user);
    BgResult updateUserByUser(User user);
    PageResult<User>  getUserListUser(Integer depId,Integer jobId);
    BgResult getUserInfo(Integer id);
    PageResult<User> getUserList(SearchUserCondition searchUserCondition);
}
