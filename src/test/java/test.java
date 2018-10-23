
import cn.bluegod.dao.TrainsMapper;
import cn.bluegod.pojo.Department;
import cn.bluegod.pojo.Job;
import cn.bluegod.pojo.Trains;
import cn.bluegod.pojo.User;
import cn.bluegod.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.Date;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-09 17:36
 * @Version V1.0
 */
public class test {

    TrainsMapper trainsMapper;

    @Before
    public void before() {
        ApplicationContext context=new ClassPathXmlApplicationContext("classpath:spring/applicationContext*.xml");
        trainsMapper=context.getBean(TrainsMapper.class);
//        Trains trains=new Trains();
//        trains.setDepartment(new Department());
//        trains.getDepartment().setId(19);
//        trainsMapper.getTrains(trains);
//        System.out.println(trainsMapper.getTrains(trains));
    }

    @Test
    public void Train(){
        Trains trains=new Trains();
        trains.setContent("adcfdsad");
        trains.setJob(new Job());
        trains.getJob().setId(3);
        trains.setDepartment(new Department());
        trains.getDepartment().setId(21);
        trains.setStatus(1);
        trains.setStartTime(new Date());
        trains.setEndTime(new Date());
        trainsMapper.addTrains(trains);
    }

    @Test
    public  void  sss(){
        System.out.println(1538668800000L<1539403751219L);
    }
}
