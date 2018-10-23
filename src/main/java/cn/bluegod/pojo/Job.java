package cn.bluegod.pojo;

import java.util.Date;

/**
 * @description: 职位实体类表
 * @author: Mr.Fu
 * @create: 2018-10-09 10:17
 * @Version V1.0
 */
public class Job {
    private Integer id;
    private String jobName;
    private Integer depId;
    private String depName;
    private Date createTime;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public Integer getDepId() {
        return depId;
    }

    public void setDepId(Integer depId) {
        this.depId = depId;
    }

    public String getDepName() {
        return depName;
    }

    public void setDepName(String depName) {
        this.depName = depName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", jobName='" + jobName + '\'' +
                ", depId=" + depId +
                ", depName='" + depName + '\'' +
                ", createTime=" + createTime +
                ", status=" + status +
                '}';
    }
}
