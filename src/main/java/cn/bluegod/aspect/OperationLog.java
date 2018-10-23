package cn.bluegod.aspect;

import cn.bluegod.pojo.User;
import org.aspectj.lang.JoinPoint;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URL;

/**
 * @description: 操作日志
 * @author: Mr.Fu
 * @create: 2018-10-15 12:10
 * @Version V1.0
 */
public class OperationLog {
    private static File fi;
    private String name;

    public OperationLog(){
        ClassLoader classLoader = getClass().getClassLoader();
        URL url = classLoader.getResource("conf/log.txt");
        System.out.println(url.getFile());
        fi=new File(url.getFile());
    }


    public void myBefore(JoinPoint joinPoint){
        //获取到当前线程绑定的请求对象
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        //已经拿到session,就可以拿到session中保存的用户信息了。
        User user=(User)request.getSession().getAttribute("USER");
        if (user!=null) {
            name = "id为：" + user.getId() + "，名字为：" + user.getUserName() + " ，的用户";
        }
        log(joinPoint,"操作开始",null);
    }

    public void showExceptionLog(JoinPoint joinPoint,Throwable e)   {
        log(joinPoint,"操作异常",e);
    }
    public void showAfterLog(JoinPoint joinPoint)   {
        log(joinPoint,"操作成功",null);
    }

    public void log(JoinPoint joinPoint,String msg,Throwable el){
        StringBuffer str=new StringBuffer();
        Class clazz = joinPoint.getTarget().getClass();
        String type=getOperationType(clazz.getName());
        String method=joinPoint.getSignature().getName();
        Object[] args=joinPoint.getArgs();
        String s=getOperationName(method,type,args);
        if (s!=null){
            if (el==null) {
                str.append(name+s + " " + msg + "\r\n");
            }else {
                str.append(name+s + "  " + msg + "异常信息："+el.getMessage()+"\r\n");
            }
            BufferedWriter writer=null;
            try {
                writer=new BufferedWriter(new FileWriter(fi,true));
                writer.write(str.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }finally {
                try {
                    writer.flush();
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private String getOperationName(String name,String type,Object[] args){
        if (name.indexOf("add")==0){
            return ",增加了"+type+"数据，增加数据为：\r\n"+args[0]+"\r\n";
        }
        else if (name.indexOf("update")==0){
            return ",修改了"+type+"数据,修改内容为：\r\n"+args[0]+"\r\n";
        }else if (name.indexOf("delete")==0){
            return ",删除了"+type+"数据，删除了的数据id为：\r\n"+args+"\r\n";
        }
        return null;
    }

    private String getOperationType(String cls){
        if (cls.indexOf("UserService")!=-1){
            return " 用户的 ";
        }else if (cls.indexOf("UserTrainsService")!=-1){
            return " 用户培训的 ";
        }
        else if (cls.indexOf("TrainsService")!=-1){
            return " 培训的 ";
        }
        else if (cls.indexOf("ResumeServiceImpl")!=-1){
            return " 用户培简历的 ";
        }
        else if (cls.indexOf("RecruitService")!=-1){
            return " 招聘的 ";
        }
        else if (cls.indexOf("JobService")!=-1){
            return " 职位的 ";
        }
        else if (cls.indexOf("InterviewService")!=-1){
            return " 投递简历面试的 ";
        }
        else if (cls.indexOf("DepartmentService")!=-1){
            return " 部门的 ";
        }
        else if (cls.indexOf("ClockService")!=-1){
            return " 打卡的 ";
        }
        else if (cls.indexOf("AwardPenaltyService")!=-1){
            return " 薪资的 ";
        }
        return null;
    }

}
