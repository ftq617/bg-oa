package cn.bluegod.dao;

import cn.bluegod.pojo.Objection;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @program: bg-oa
 * @description: 异议薪资dao层操作接口
 * @author: Mr.Fu
 * @create: 2018-10-16 17:38
 * @Version V1.0
 */
public interface ObjectionMapper {

    int addObjection(Objection objection);
    int updateObjection(Objection objection);
    int deleteObjection(Integer...ids);
    Objection getObjectionById(Integer id);
    List<Objection> getObjectionByuId(@Param("uId") Integer uId, @Param("start") Date start,@Param("end")  Date end);
    List<Objection> getObjectionByHandle(@Param("isHandle") Integer isHandle, @Param("start") Date start,@Param("end")  Date end);
    List<Objection> getObjection(Objection objection);
}
