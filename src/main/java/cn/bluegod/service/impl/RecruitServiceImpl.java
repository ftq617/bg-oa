package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.dao.RecruitMapper;
import cn.bluegod.pojo.Recruit;
import cn.bluegod.pojo.Trains;
import cn.bluegod.service.RecruitService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-09-29 16:23
 * @Version V1.0
 */
@Service
public class RecruitServiceImpl implements RecruitService {

    @Autowired
    private RecruitMapper recruitMapper;

    public PageResult<Recruit> getRecruitList(Integer page, Integer limit,Recruit recruit) {
        PageHelper.startPage(page,limit,true);
        List<Recruit> list=recruitMapper.getRecruitList(recruit);
        PageInfo<Recruit> pageInfo=new PageInfo<Recruit>(list);
        PageResult<Recruit> result =new PageResult<Recruit>();
        result.setData(pageInfo.getList());
        result.setCount(pageInfo.getTotal());
        result.setCode(0);
        return result;
    }

    public BgResult addRecruit(Recruit recruit) {
        recruit.sethNumber(0);
        recruit.setStatus(1);
        recruitMapper.addRecruit(recruit);
        return BgResult.ok();
    }

    public BgResult updateRecruit(Recruit recruit) {
        recruitMapper.updateRecruit(recruit);
        return BgResult.ok();
    }

    public BgResult deleteRecruit(Integer... ids) {
        ArrayList<Integer> can_ids=new ArrayList<Integer>();
        for (int i=0;i<ids.length;i++)
        {
            Recruit recruit=recruitMapper.getRecruitById(ids[i]);
            if (recruit.gethNumber()<=0){
                can_ids.add(ids[i]);
            }
        }
        if (can_ids.size()<=0){
            return BgResult.build(400,"招聘有人参与不能删除");
        }
        recruitMapper.deleteRecruit(can_ids);
        StringBuffer str=new StringBuffer();
        for (int i=0;i<can_ids.size();i++) {
            str.append(can_ids.get(i)+",");
        }
        return BgResult.build(200,"成功删除id为"+str+"招聘,但有"+(ids.length-can_ids.size())+"个招聘有人参与不能删除");
    }

    public BgResult getRecruitById(Integer id) {
        return BgResult.ok(recruitMapper.getRecruitById(id));
    }

    public PageResult<Recruit> getRecruitListBySalary(Integer page, Integer limit, Integer min, Integer max) {
        PageHelper.startPage(page,limit,true);
        List<Recruit> list=recruitMapper.getRecruitListBySalary(min,max);
        PageInfo<Recruit> pageInfo=new PageInfo<Recruit>(list);
        PageResult<Recruit> result =new PageResult<Recruit>();
        result.setData(pageInfo.getList());
        result.setCount(pageInfo.getTotal());
        result.setCode(0);
        return result;
    }

}
