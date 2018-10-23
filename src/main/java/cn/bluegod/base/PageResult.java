package cn.bluegod.base;

import java.util.List;

/**
 * @description: 分页结果返回类
 * @author: Mr.Fu
 * @create: 2018-09-29 15:50
 * @Version V1.0
 */
public class PageResult<T> {
    private int code=0;
    private long count;
    private String msg;
    private int page;
    private int pageCount;
    private List<T> data;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public long getCount() {
        return count;
    }

    public void setCount(long count) {
        this.count = count;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "PageResult{" +
                "code=" + code +
                ", count=" + count +
                ", msg='" + msg + '\'' +
                ", page=" + page +
                ", pageCount=" + pageCount +
                ", data=" + data +
                '}';
    }
}
