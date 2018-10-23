package cn.bluegod.pojo;

import java.util.Date;

/**
 * @description: 奖惩的实体类
 * @author: Mr.Fu
 * @create: 2018-10-15 09:45
 * @Version V1.0
 */
public class AwardPenalty {

    private Integer id;
    private Integer uId;
    private Date startTime;
    private Integer money;
    private String reason;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "AwardPenalty{" +
                "id=" + id +
                ", uId=" + uId +
                ", startTime=" + startTime +
                ", money=" + money +
                ", reason='" + reason + '\'' +
                '}';
    }
}
