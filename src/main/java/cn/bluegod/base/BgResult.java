package cn.bluegod.base;


import java.io.Serializable;

/**
 * 淘淘商城自定义响应结构
 */
public class BgResult implements Serializable{

    // 响应业务状态
    private Integer status;

    // 响应消息
    private String msg;

    // 响应中的数据
    private Object data;

    public static BgResult build(Integer status, String msg, Object data) {
        return new BgResult(status, msg, data);
    }

    public static BgResult ok(Object data) {
        return new BgResult(data);
    }

    public static BgResult ok() {
        return new BgResult(null);
    }

    public BgResult() {

    }

    public static BgResult build(Integer status, String msg) {
        return new BgResult(status, msg, null);
    }

    public BgResult(Integer status, String msg, Object data) {
        this.status = status;
        this.msg = msg;
        this.data = data;
    }

    public BgResult(Object data) {
        this.status = 200;
        this.msg = "OK";
        this.data = data;
    }

//    public Boolean isOK() {
//        return this.status == 200;
//    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}
