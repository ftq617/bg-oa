package cn.bluegod.pojo;

import java.util.Date;

/**
 * @description: 部门实体类
 * @author: Mr.Fu
 * @create: 2018-10-08 13:35
 * @Version V1.0
 */
public class Department {

    private Integer id;
    private String dName;
    private Integer uId;
    private String uName;
    private Date createTime;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
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
        return "Department{" +
                "id=" + id +
                ", dName='" + dName + '\'' +
                ", uId=" + uId +
                ", uName='" + uName + '\'' +
                ", createTime=" + createTime +
                ", status=" + status +
                '}';
    }
}
