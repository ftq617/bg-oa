package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.dao.DepartmentMapper;
import cn.bluegod.dao.JobMapper;
import cn.bluegod.dao.TrainsMapper;
import cn.bluegod.dao.UserTrainsMapper;
import cn.bluegod.pojo.*;
import cn.bluegod.service.TrainsService;
import cn.bluegod.service.UserTrainsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-10 16:21
 * @Version V1.0
 */
@Service
public class TrainsServiceImpl implements TrainsService {

    @Autowired
    private TrainsMapper trainsMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private JobMapper jobMapper;
    @Autowired
    private UserTrainsMapper userTrainsMapper;
    @Autowired
    private UserTrainsService userTrainsService;

    public BgResult addTrains(Trains trains,Integer...u_ids) {
        Job job=jobMapper.getJobById(trains.getJob().getId());
        Department department=departmentMapper.getDepartmentById(trains.getDepartment().getId());
        if (job==null||department==null){
            return  BgResult.build(450,"数据异常");
        }
        trains.setStatus(1);
        trainsMapper.addTrains(trains);
        for (int i=0;i<u_ids.length;i++){
            UserTrains userTrains=new UserTrains();
            userTrains.setU_id(u_ids[i]);
            userTrains.setT_id(trains.getId());
            userTrainsService.addUserTrains(userTrains);
        }
        return BgResult.ok();
    }

    public BgResult deleteTrains(Integer... ids) {
        ArrayList<Integer> can_ids=new ArrayList<Integer>();
        for (int i=0;i<ids.length;i++)
        {
            List<UserTrains> list=userTrainsMapper.getUserTrainsByT_id(ids[i],1);
            if (list==null||list.size()<=0){
                can_ids.add(ids[i]);
            }
        }
        if (can_ids.size()<=0){
            return BgResult.build(400,"培训有人参与不能删除");
        }
        trainsMapper.deleteTrains(can_ids);
        StringBuffer str=new StringBuffer();
        for (int i=0;i<can_ids.size();i++) {
            str.append(can_ids.get(i)+",");
        }
        return BgResult.build(200,"成功删除id为"+str+"培训,但有"+(ids.length-can_ids.size())+"个培训有人参与不能删除");
    }

    public BgResult updateTrains(Trains trains) {
        Job job=jobMapper.getJobById(trains.getJob().getId());
        Department department=departmentMapper.getDepartmentById(trains.getDepartment().getId());
        if (job==null||department==null){
            return  BgResult.build(450,"数据异常");
        }
        trainsMapper.updateTrains(trains);
        return BgResult.ok();
    }

    public PageResult<Trains> getTrains(Integer page, Integer limit, Trains trains) {
        PageHelper.startPage(page,limit,true);
        List<Trains> list=trainsMapper.getTrains(trains);
        PageInfo<Trains> pageInfo=new PageInfo<Trains>(list);
        PageResult<Trains> pageResult=new PageResult<Trains>();
        pageResult.setData(pageInfo.getList());
        pageResult.setCount(pageInfo.getTotal());
        pageResult.setPage(pageInfo.getPageNum());
        pageResult.setPageCount(pageInfo.getPageSize());
        pageResult.setCode(0);
        return pageResult;
    }

    public BgResult getTrainsById(Integer id) {
        Trains trains=trainsMapper.getTrainsById(id);
        if (trains!=null) {
            return BgResult.ok(trains);
        }else {
            return BgResult.build(450,"数据异常");
        }
    }
}
