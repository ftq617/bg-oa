package cn.bluegod.service;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Objection;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * @program: bg-oa
 * @description: 异议薪资业务逻辑层
 * @author: Mr.Fu
 * @create: 2018-10-16 17:51
 * @Version V1.0
 */
public interface ObjectionService {

    BgResult addObjection(Objection objection);
    BgResult updateHandleObjection(Integer id,Integer uId,Integer money,Integer type);
    BgResult deleteObjection(Integer...ids);
    BgResult getObjectionById(Integer id);
    PageResult<Objection> getObjectionByuId(@Param("uId") Integer uId, @Param("start") Date start, @Param("end")  Date end);
    PageResult<Objection> getObjectionByHandle(@Param("isHandle") Integer isHandle, @Param("start") Date start,@Param("end")  Date end);
}
