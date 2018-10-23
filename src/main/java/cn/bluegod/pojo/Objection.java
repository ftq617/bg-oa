package cn.bluegod.pojo;

import java.util.Date;

/**
 * @description: 异议薪资的实体类
 * @author: Mr.Fu
 * @create: 2018-10-16 17:35
 * @Version V1.0
 */
public class Objection {

    private Integer id;
    private Integer uId;
    private Date time;
    private String reason;
    private Integer money;
    private Date reissTime;
    private Integer isHandle;

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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Date getReissTime() {
        return reissTime;
    }

    public void setReissTime(Date reissTime) {
        this.reissTime = reissTime;
    }

    public Integer getIsHandle() {
        return isHandle;
    }

    public void setIsHandle(Integer isHandle) {
        this.isHandle = isHandle;
    }

    @Override
    public String toString() {
        return "Objection{" +
                "id=" + id +
                ", uId=" + uId +
                ", time=" + time +
                ", reason='" + reason + '\'' +
                ", money=" + money +
                ", reissTime=" + reissTime +
                ", isHandle=" + isHandle +
                '}';
    }
}
