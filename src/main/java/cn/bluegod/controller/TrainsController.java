package cn.bluegod.controller;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.pojo.Trains;
import cn.bluegod.service.TrainsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-10 16:33
 * @Version V1.0
 */
@Controller
public class TrainsController {

    @Autowired
    private TrainsService trainsService;

    @RequestMapping("/users/trains/{id}")
    @ResponseBody
    public BgResult getTrainsById(@PathVariable Integer id){
        return trainsService.getTrainsById(id);
    }

    @RequestMapping("/users/trains/list")
    @ResponseBody
    public PageResult<Trains> userGetTrains(Trains trains, @RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer limit){
        trains.setStatus(1);
        return trainsService.getTrains(page,limit,trains);
    }

    @RequestMapping("/admin/trains/list")
    @ResponseBody
    public PageResult<Trains> adminGetTrains(Trains trains, @RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "10") Integer limit){
        return trainsService.getTrains(page,limit,trains);
    }

    @RequestMapping("/admin/trains/add")
    @ResponseBody
    public BgResult addTrains(Trains trains,Integer...u_ids){
        return trainsService.addTrains(trains,u_ids);
    }

    @RequestMapping("/admin/trains/update")
    @ResponseBody
    public BgResult updateTrains(Trains trains){
        return  trainsService.updateTrains(trains);
    }

    @RequestMapping("/admin/trains/delete")
    @ResponseBody
    public BgResult deleteTrains(Integer...ids){
        return trainsService.deleteTrains(ids);
    }


}
