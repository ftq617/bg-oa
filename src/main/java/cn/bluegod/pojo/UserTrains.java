package cn.bluegod.pojo;

/**
 * @description: 报名参加培训的实体类
 * @author: Mr.Fu
 * @create: 2018-10-10 17:15
 * @Version V1.0
 */
public class UserTrains {

    private Integer id;
    private Integer u_id;
    private Integer t_id;
    private Integer status;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getU_id() {
        return u_id;
    }

    public void setU_id(Integer u_id) {
        this.u_id = u_id;
    }

    public Integer getT_id() {
        return t_id;
    }

    public void setT_id(Integer t_id) {
        this.t_id = t_id;
    }
}
