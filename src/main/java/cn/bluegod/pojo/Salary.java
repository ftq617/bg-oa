package cn.bluegod.pojo;

import java.util.Date;
import java.util.List;

/**
 * @description: 薪资管理的实体类
 * @author: Mr.Fu
 * @create: 2018-10-15 10:26
 * @Version V1.0
 */
public class Salary {
    private Integer id;
    private Integer uId;
    private Integer basic;
    private Date overtime;
    private Integer reApun;
    private Integer social;
    private Integer isObjection;
    private Integer isHandle;
    private List<AwardPenalty> awardPenaltieList;

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

    public Integer getBasic() {
        return basic;
    }

    public void setBasic(Integer basic) {
        this.basic = basic;
    }

    public Date getOvertime() {
        return overtime;
    }

    public void setOvertime(Date overtime) {
        this.overtime = overtime;
    }

    public Integer getReApun() {
        return reApun;
    }

    public void setReApun(Integer reApun) {
        this.reApun = reApun;
    }

    public Integer getSocial() {
        return social;
    }

    public void setSocial(Integer social) {
        this.social = social;
    }

    public Integer getIsObjection() {
        return isObjection;
    }

    public void setIsObjection(Integer isObjection) {
        this.isObjection = isObjection;
    }

    public Integer getIsHandle() {
        return isHandle;
    }

    public void setIsHandle(Integer isHandle) {
        this.isHandle = isHandle;
    }

    public List<AwardPenalty> getAwardPenaltieList() {
        return awardPenaltieList;
    }

    public void setAwardPenaltieList(List<AwardPenalty> awardPenaltieList) {
        this.awardPenaltieList = awardPenaltieList;
    }

    @Override
    public String toString() {
        return "Salary{" +
                "id=" + id +
                ", uId=" + uId +
                ", basic=" + basic +
                ", overtime=" + overtime +
                ", reApun=" + reApun +
                ", social=" + social +
                ", isObjection=" + isObjection +
                ", isHandle=" + isHandle +
                ", awardPenaltieList=" + awardPenaltieList +
                '}';
    }
}
