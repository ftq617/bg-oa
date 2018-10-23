package cn.bluegod.pojo;

import java.util.Date;

/**
 * @description: 考勤打卡的基础类
 * @author: Mr.Fu
 * @create: 2018-10-13 13:29
 * @Version V1.0
 */
public class Clock {

    private Integer id;
    private User user;
    private Date startTime;
    private Date endTime;
    private Integer type;
    private Integer isLate;
    private Integer isLeave;
    private Integer isAbsent;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getIsLate() {
        return isLate;
    }

    public void setIsLate(Integer isLate) {
        this.isLate = isLate;
    }

    public Integer getIsAbsent() {
        return isAbsent;
    }

    public void setIsAbsent(Integer isAbsent) {
        this.isAbsent = isAbsent;
    }

    public Integer getIsLeave() {
        return isLeave;
    }

    public void setIsLeave(Integer isLeave) {
        this.isLeave = isLeave;
    }

    @Override
    public String toString() {
        return "Clock{" +
                "id=" + id +
                ", user=" + user +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", type=" + type +
                ", isLate=" + isLate +
                ", isLeave=" + isLeave +
                ", isAbsent=" + isAbsent +
                '}';
    }
}
