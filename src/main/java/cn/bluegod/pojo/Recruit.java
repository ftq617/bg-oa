package cn.bluegod.pojo;

import java.util.Date;

/**
 * @description: 招聘信息的实体类
 * @author: Mr.Fu
 * @create: 2018-09-29 10:42
 * @Version V1.0
 */
public class Recruit {
    private Integer id;
    private String title;
    private Department department;
    private User user;
    private String describes;
    private Integer salary;
    private Integer pNumber;
    private Integer hNumber;
    private Date endTime;
    private Integer status;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getDescribe() {
        return describes;
    }

    public void setDescribe(String describes) {
        this.describes = describes;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public Integer getpNumber() {
        return pNumber;
    }

    public void setpNumber(Integer pNumber) {
        this.pNumber = pNumber;
    }

    public Integer gethNumber() {
        return hNumber;
    }

    public void sethNumber(Integer hNumber) {
        this.hNumber = hNumber;
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
        return "Recruit{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", department=" + department +
                ", user=" + user +
                ", describes='" + describes + '\'' +
                ", salary=" + salary +
                ", pNumber=" + pNumber +
                ", hNumber=" + hNumber +
                ", endTime=" + endTime +
                ", status=" + status +
                '}';
    }
}
