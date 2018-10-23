package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.dao.TrainsMapper;
import cn.bluegod.dao.UserMapper;
import cn.bluegod.dao.UserTrainsMapper;
import cn.bluegod.pojo.Department;
import cn.bluegod.pojo.Trains;
import cn.bluegod.pojo.User;
import cn.bluegod.pojo.UserTrains;
import cn.bluegod.service.UserTrainsService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-10 18:08
 * @Version V1.0
 */
@Service
public class UserTrainsServiceImpl implements UserTrainsService {

    @Autowired
    private UserTrainsMapper userTrainsMapper;
    @Autowired
    private TrainsMapper trainsMapper;
    @Autowired
    private UserMapper userMapper;

    public BgResult addUserTrains(UserTrains userTrains) {
        Trains trains=trainsMapper.getTrainsById(userTrains.getT_id());
        if (trains==null){
            return BgResult.build(402,"数据异常！！ ！");
        }else {
            Date date=new Date();
            if (trains.getStartTime().getTime()<date.getTime()){
                return BgResult.build(501,"培训已经开始不能参加！！ ！");
            }
        }
        List<UserTrains> list=userTrainsMapper.getUserTrainsByU_idAndT_id(userTrains.getU_id(),userTrains.getT_id(),null);
        if (list!=null&&list.size()>0){
            return BgResult.build(405,"你已经参加了这个培训！！ ！");
        }
        userTrains.setStatus(1);
        userTrainsMapper.addUserTrains(userTrains);
        return BgResult.ok();
    }

    public BgResult deleteUserTrains(Integer...ids) {
        if (ids.length<=0){
            return BgResult.build(300,"数据异常");
        }
        userTrainsMapper.deleteUserTrains(ids);
        return BgResult.ok();
    }

    public BgResult getAfteTrains(Integer id) {
        List<Trains> result=new ArrayList<Trains>();
        List<UserTrains> list=userTrainsMapper.getUserTrainsByU_id(id,null);
        List<Integer> ids=new ArrayList<Integer>();
        for (UserTrains userTrains:list){
            ids.add(userTrains.getT_id());
        }
        if (ids.size()==0){
            return BgResult.build(509,"还没有数据");
        }
        List<Trains> tra= trainsMapper.getTrainsByIds(ids);
        Date date=new Date();
        for (Trains trains:tra){
            if (date.getTime()<trains.getStartTime().getTime()&&trains.getStartTime().getTime()-date.getTime()<5184000000L){
                result.add(trains);
            }
        }
        return BgResult.ok(result);
    }

    public PageResult<Trains> getTrainsByU_id(Integer page,Integer limit,Integer u_id) {
       return getTrainsByU_idAndStatus(page,limit,u_id,null);
    }

    public PageResult<User> getUserByT_id(Integer page, Integer limit, Integer t_id) {
        PageHelper.startPage(page,limit,true);
        List<UserTrains> list=userTrainsMapper.getUserTrainsByU_id(t_id,null);
        PageInfo<UserTrains> pageInfo=new PageInfo<UserTrains>(list);
        PageResult<User> pageResult=new PageResult<User>();
        if (list==null||list.size()<=0){
            pageResult.setCode(500);
            pageResult.setMsg("培训班还没有人报");
            return pageResult;
        }
        List<Integer> ids=new ArrayList<Integer>();
        for (UserTrains userTrains:list){
            ids.add(userTrains.getT_id());
        }
        pageResult.setData(userMapper.getUserByIds(ids));
        pageResult.setCount(pageInfo.getTotal());
        pageResult.setPage(pageInfo.getPageNum());
        pageResult.setPageCount(pageInfo.getPageSize());
        pageResult.setCode(0);
        return pageResult;
    }

    public PageResult<Trains> getTrainsByU_idAndStatus(Integer page,Integer limit,Integer u_id, Integer status) {
        PageHelper.startPage(page,limit,true);
        List<UserTrains> list=userTrainsMapper.getUserTrainsByU_id(u_id,status);
        PageInfo<UserTrains> pageInfo=new PageInfo<UserTrains>(list);
        PageResult<Trains> pageResult=new PageResult<Trains>();
        if (list==null||list.size()<=0){
            pageResult.setCode(500);
            pageResult.setMsg("没有查找到报培训班");
            return pageResult;
        }
        List<Integer> ids=new ArrayList<Integer>();
        for (UserTrains userTrains:list){
            ids.add(userTrains.getT_id());
        }
        pageResult.setData(trainsMapper.getTrainsByIds(ids));
        pageResult.setCount(pageInfo.getTotal());
        pageResult.setPage(pageInfo.getPageNum());
        pageResult.setPageCount(pageInfo.getPageSize());
        pageResult.setCode(0);
        return pageResult;
    }

}
