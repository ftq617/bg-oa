package cn.bluegod.pojo;

import java.util.Date;

/**
 * @description: 面试基础类
 * @author: Mr.Fu
 * @create: 2018-10-12 14:13
 * @Version V1.0
 */
public class Interview {

    private Integer id;
    private Integer uId;
    private Integer rctId;
    private Resume resume;
    private Integer isRead;
    private Date startTime;
    private Integer isInterview;
    private Date viewTime;
    private Integer isEmploy;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getRctId() {
        return rctId;
    }

    public void setRctId(Integer rctId) {
        this.rctId = rctId;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }

    public Integer getIsRead() {
        return isRead;
    }

    public void setIsRead(Integer isRead) {
        this.isRead = isRead;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Integer getIsInterview() {
        return isInterview;
    }

    public void setIsInterview(Integer isInterview) {
        this.isInterview = isInterview;
    }

    public Date getViewTime() {
        return viewTime;
    }

    public void setViewTime(Date viewTime) {
        this.viewTime = viewTime;
    }

    public Integer getIsEmploy() {
        return isEmploy;
    }

    public void setIsEmploy(Integer isEmploy) {
        this.isEmploy = isEmploy;
    }

    @Override
    public String toString() {
        return "Interview{" +
                "id=" + id +
                ", uId=" + uId +
                ", rctId=" + rctId +
                ", resume=" + resume +
                ", isRead=" + isRead +
                ", startTime=" + startTime +
                ", isInterview=" + isInterview +
                ", viewTime=" + viewTime +
                ", isEmploy=" + isEmploy +
                '}';
    }
}
