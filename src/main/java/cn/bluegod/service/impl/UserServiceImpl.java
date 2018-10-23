package cn.bluegod.service.impl;

import cn.bluegod.base.BgResult;
import cn.bluegod.base.PageResult;
import cn.bluegod.base.SearchUserCondition;
import cn.bluegod.dao.DepartmentMapper;
import cn.bluegod.dao.JobMapper;
import cn.bluegod.dao.UserMapper;
import cn.bluegod.pojo.Department;
import cn.bluegod.pojo.Job;
import cn.bluegod.pojo.User;
import cn.bluegod.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @description: 用户的逻辑的处理的实现类
 * @author: Mr.Fu
 * @create: 2018-09-28 14:59
 * @Version V1.0
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Autowired
    private JobMapper jobMapper;

    public BgResult login(User user) {
        User us=userMapper.getUserByPhone(user.getPhone());
        if (us==null){
            return BgResult.build(400,"用户名错误！！");
        }
        if (us.getPassword().equals(user.getPassword())){
            us.setPassword("");
            return BgResult.ok(us);
        }
        return BgResult.build(401,"密码错误！！");
    }

    @Transactional
    public BgResult register(User user) {
        User us=userMapper.getUserByPhone(user.getPhone());
        if (us!=null){
            return BgResult.build(300,"用户已被注册");
        }
        Date date=new Date();
        user.setCreateTime(date);
        user.setDepartmentId(-1);
        user.setJobId(-1);
        user.setRecruitId(-1);
        user.setType(1);
        user.setSalary(-1);
        userMapper.addUser(user);
        return BgResult.ok();
    }

    public BgResult check(String phone) {
        User us=userMapper.getUserByPhone(phone);
        if (us==null){
            return BgResult.build(200,"此号码可用");
        }else {
            return BgResult.build(400,"此号码不可用");
        }
    }

    public BgResult updateUser(User user) {
        if (user.getDepartmentId()==null||user.getJobId()==null){
            user.setDepartmentId(null);
            user.setDepartmentName(null);
            user.setJobId(null);
            user.setJobName(null);
        }else{
            Department department=departmentMapper.getDepartmentById(user.getDepartmentId());
            if (department==null){
                return BgResult.build(405,"数据错误");
            }
            user.setDepartmentName(department.getdName());
            Job job=jobMapper.getJobById(user.getJobId());
            if (job==null){
                return BgResult.build(405,"数据错误");
            }
            user.setJobName(job.getJobName());
        }
        userMapper.updateUser(user);
        return BgResult.ok();
    }

    public BgResult updateUserByUser(User user) {
        User us=new User();
        us.setPassword(user.getPassword());
        us.setUserName(user.getUserName());
        us.setImage(user.getImage());
        us.setId(user.getId());
        userMapper.u_updateUser(us);
        return BgResult.ok();
    }

    public PageResult<User>  getUserListUser(Integer depId, Integer jobId) {
        PageResult<User> result=new PageResult<User>();
        List<User> list=null;
        if (jobId!=null){
           list=userMapper.getUserByJobId(jobId);

        }else if (depId!=null){
            list=userMapper.getUserByDepId(depId);
        }
        if (list==null||list.size()==0){
            result.setCode(405);
            result.setMsg("没有数据");
        }else{
            result.setCode(0);
            result.setData(list);
        }
        return result;
    }

    public BgResult getUserInfo(Integer id) {
        User user=userMapper.getUserById(id);
        user.setPassword("");
        return BgResult.ok(user);
    }

    public PageResult<User> getUserList(SearchUserCondition searchUserCondition) {
        PageHelper.startPage(searchUserCondition.getPage(),searchUserCondition.getLimit(),true);
        List<User> list=userMapper.getUserBySearch(searchUserCondition);
        PageInfo<User> pageInfo=new PageInfo<User>(list);
        PageResult<User> pageResult=new PageResult<User>();
        pageResult.setData(pageInfo.getList());
        pageResult.setCount(pageInfo.getTotal());
        pageResult.setPage(pageInfo.getPageNum());
        pageResult.setPageCount(pageInfo.getPageSize());
        pageResult.setCode(0);
        return pageResult;
    }
}
