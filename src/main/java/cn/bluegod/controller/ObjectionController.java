package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.pojo.Objection;
import cn.bluegod.pojo.User;
import cn.bluegod.service.ObjectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-16 18:40
 * @Version V1.0
 */
@Controller
public class ObjectionController {

    @Autowired
    private ObjectionService objectionService;

    @RequestMapping("/users/objection/add")
    @ResponseBody
    public BgResult addObjection(Integer id,String reason, HttpSession session){
        User user=(User) session.getAttribute("USER");
        Objection objection=new Objection();
        objection.setuId(user.getId());
        objection.setId(id);
        objection.setReason(reason);
        return objectionService.addObjection(objection);
    }

    @RequestMapping("/admin/objection/update")
    @ResponseBody
    public BgResult updateObjection(Integer id,Integer uId,Integer money,Integer type){
        return objectionService.updateHandleObjection(id,uId,money,type);
    }

    @RequestMapping("/users/objection/{id}")
    @ResponseBody
    public BgResult getObjection(@PathVariable Integer id){
        return objectionService.getObjectionById(id);
    }
}
