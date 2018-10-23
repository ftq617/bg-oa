package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.dao.ResumeMapper;
import cn.bluegod.pojo.Resume;
import cn.bluegod.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-12 10:59
 * @Version V1.0
 */
@Service
public class ResumeServiceImpl implements ResumeService {

    @Autowired
    private ResumeMapper resumeMapper;

    public BgResult addResume(Resume resume) {
        Resume res=resumeMapper.getResumeByU_id(resume.getuId());
        if (res!=null){
           return BgResult.build(407,"你已经有一份简历了");
        }
        resume.setSalary(resume.getSalary()*100);
        resumeMapper.addResume(resume);
        return BgResult.ok();
    }

    public BgResult updateResume(Resume resume) {
        resumeMapper.updateResume(resume);
        return BgResult.ok();
    }

    public BgResult deleteResume(Integer...ids) {
        if (ids.length<=0){
            return BgResult.build(406,"输入错误");
        }
        int number=resumeMapper.deleteResume(ids);
        return BgResult.ok(number);
    }

    public BgResult getResumeById(Integer id) {
        Resume resume=resumeMapper.getResumeById(id);
        if (resume==null){
            return BgResult.build(407,"数据错误");
        }
        return BgResult.ok(resume);
    }

    public BgResult getResumeByU_id(Integer uId) {
        Resume resume=resumeMapper.getResumeByU_id(uId);
        if (resume==null){
            return BgResult.build(407,"你还没有简历");
        }
        return BgResult.ok(resume);
    }

    public BgResult getResumeByIds(List<Integer> ids) {
        List<Resume> res=resumeMapper.getResumeByIds(ids);
        if (res==null||res.size()<=0){
           return BgResult.build(407,"数据错误");
        }
        return BgResult.ok(res);
    }
}
