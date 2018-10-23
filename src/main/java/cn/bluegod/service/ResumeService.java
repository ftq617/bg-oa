package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.pojo.Resume;

import java.util.List;

/**
 * @program: bg-oa
 * @description: 个人简历的业务逻辑层接口
 * @author: Mr.Fu
 * @create: 2018-10-12 10:52
 * @Version V1.0
 */
public interface ResumeService {

    BgResult addResume(Resume resume);
    BgResult updateResume(Resume resume);
    BgResult deleteResume(Integer...ids);
    BgResult getResumeById(Integer id);
    BgResult getResumeByU_id(Integer uId);
    BgResult getResumeByIds(List<Integer> ids);

}
