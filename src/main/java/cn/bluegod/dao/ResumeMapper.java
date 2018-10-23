package cn.bluegod.dao;

import cn.bluegod.pojo.Resume;

import java.util.List;

/**
 * @program: bg-oa
 * @description: 个人简历的底层数据库操作接口
 * @author: Mr.Fu
 * @create: 2018-10-12 10:33
 * @Version V1.0
 */
public interface ResumeMapper {

    int addResume(Resume resume);
    int updateResume(Resume resume);
    int deleteResume(Integer... ids);
    Resume getResumeById(Integer id);
    Resume getResumeByU_id(Integer uId);
    List<Resume> getResumeByIds(List<Integer> ids);
}
