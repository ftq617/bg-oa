package cn.bluegod.pojo;

import java.util.Date;

/**
 * @description: 培训信息的实体类
 * @author: Mr.Fu
 * @create: 2018-10-10 15:07
 * @Version V1.0
 */
public class Trains {
    private Integer id;
    private String content;
    private Department department;
    private Job job;
    private Date startTime;
    private Date endTime;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }


    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Trains{" +
                "id=" + id +
                ", content='" + content + '\'' +
                ", department=" + department +
                ", job=" + job +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                ", status=" + status +
                '}';
    }
}
