package cn.bluegod.base;

import org.junit.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-10-13 16:01
 * @Version V1.0
 */
public class TimeUtil {

    @Test
    public void start(){
        Calendar c = Calendar.getInstance();
        int day = c.get(Calendar.DAY_OF_MONTH);
        System.out.println(day);
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(format.format(getMonthEndTimeBefore()));
        System.out.println(format.format(getMonthEndTimeByYear(2012,2)));
        System.out.println(format.format(getMonthStartTimeByYear(2012,2)));
        System.out.println(getWeekDay());
    }

    public static boolean getMonthDayisWeek(int day){
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.MONTH, -1);
        ca.set(Calendar.DAY_OF_MONTH, day);//设置为1号,当前日期既为本月第一天
        //将小时至0
        ca.set(Calendar.HOUR_OF_DAY, 0);
        //将分钟至0
        ca.set(Calendar.MINUTE, 0);
        //将秒至0
        ca.set(Calendar.SECOND,0);
        //将毫秒至0
        ca.set(Calendar.MILLISECOND, 0);
        int a=dateToWeek(ca.getTime());
        if (a==7||a==6){
            return true;
        }
        return false;
    }

    public static Date getMonthDayTime(int day){
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.MONTH, -1);
        ca.set(Calendar.DAY_OF_MONTH, day);//设置为1号,当前日期既为本月第一天
        //将小时至0
        ca.set(Calendar.HOUR_OF_DAY, 23);
        //将分钟至0
        ca.set(Calendar.MINUTE, 59);
        //将秒至0
        ca.set(Calendar.SECOND,59);
        //将毫秒至0
        ca.set(Calendar.MILLISECOND, 0);
        return ca.getTime();
    }

     public static int getWeekDay(){
        int day=0;
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.MONTH, -1);
        int a=ca.getActualMaximum(Calendar.DAY_OF_MONTH);
        for (int i=1;i<=a;i++){
            ca.set(Calendar.DAY_OF_MONTH, i);
            if (TimeUtil.dateToWeek(ca.getTime())==7||TimeUtil.dateToWeek(ca.getTime())==6) {
                day++;
            }
        }
        return day;
    }

    public static int getMonthDay(){
        int day=0;
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.MONTH, -1);
        int a=ca.getActualMaximum(Calendar.DAY_OF_MONTH);
        return a;
    }

    public static int dateToWeek(Date datet) {
        int[] weekDays = { 7, 1, 2, 3, 4, 5,6 };
        Calendar cal = Calendar.getInstance(); // 获得一个日历
        cal.setTime(datet);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1; // 指示一个星期中的某天。
        if (w < 0) {
            w = 0;
        }
        return weekDays[w];
    }

    public static Date getMonthTimeBefore(){
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, -1);
        c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
        //将小时至0
        c.set(Calendar.HOUR_OF_DAY, 0);
        //将分钟至0
        c.set(Calendar.MINUTE, 0);
        //将秒至0
        c.set(Calendar.SECOND,0);
        //将毫秒至0
        c.set(Calendar.MILLISECOND, 0);

        return c.getTime();

    }

    public static  Date getMonthEndTimeBefore(){
        //获取当前月最后一天
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.MONTH, -1);
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        //将小时至0
        ca.set(Calendar.HOUR_OF_DAY, 23);
        //将分钟至0
        ca.set(Calendar.MINUTE, 59);
        //将秒至0
        ca.set(Calendar.SECOND,59);
        //将毫秒至0
        ca.set(Calendar.MILLISECOND, 0);
        // 获取本月最后一天的时间戳
        return ca.getTime();
    }

    public static  Date getDayWorkTime(Integer hour ,Integer minute){
        return getNeedTime(hour,minute,0,0);
    }

    public static  Date getDayStartTime(){
        return getNeedTime(0,0,0,0);
    }

    public static  Date getDayEndTime(){
        return getNeedTime(23,59,59,0);
    }

    public static  Date getMonthEndTime(){
        //获取当前月最后一天
        Calendar ca = Calendar.getInstance();
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));
        //将小时至0
        ca.set(Calendar.HOUR_OF_DAY, 23);
        //将分钟至0
        ca.set(Calendar.MINUTE, 59);
        //将秒至0
        ca.set(Calendar.SECOND,59);
        //将毫秒至0
        ca.set(Calendar.MILLISECOND, 0);
        // 获取本月最后一天的时间戳
       return ca.getTime();
    }

    public static Date getMonthStartTime(){
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MONTH, 0);
        c.set(Calendar.DAY_OF_MONTH, 1);//设置为1号,当前日期既为本月第一天
        //将小时至0
        c.set(Calendar.HOUR_OF_DAY, 0);
        //将分钟至0
        c.set(Calendar.MINUTE, 0);
        //将秒至0
        c.set(Calendar.SECOND,0);
        //将毫秒至0
        c.set(Calendar.MILLISECOND, 0);

        return c.getTime();

    }


    public static  Date getMonthEndTimeByYear(int year,int month){
        return getNeedMonthTime(year,month,23,59,59,2);
    }

    public static Date getMonthStartTimeByYear(int year,int month){
        return getNeedMonthTime(year,month,0,0,0,1);
    }


    private static Date getNeedTime(int hour, int minute, int second, int addDay, int ...args){
        Calendar calendar = Calendar.getInstance();
        if(addDay != 0){
            calendar.add(Calendar.DATE,addDay);
        }
        calendar.set(Calendar.HOUR_OF_DAY,hour);
        calendar.set(Calendar.MINUTE,minute);
        calendar.set(Calendar.SECOND,second);
        calendar.set(Calendar.MILLISECOND, 0);
        if(args.length==1){
            calendar.set(Calendar.MILLISECOND,args[0]);
        }
        return calendar.getTime();
    }

    private static Date getNeedMonthTime(int year,int month,int hour, int minute, int second,int type){
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR,year);
        calendar.set(Calendar.MONTH,month-1);
        if (type==1) {
            calendar.set(Calendar.DAY_OF_MONTH, 1);
        }else if (type==2){
            calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
        }
        calendar.set(Calendar.HOUR_OF_DAY,hour);
        calendar.set(Calendar.MINUTE,minute);
        calendar.set(Calendar.SECOND,second);
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }
}
