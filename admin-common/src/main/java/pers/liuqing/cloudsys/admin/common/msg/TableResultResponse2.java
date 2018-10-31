package pers.liuqing.cloudsys.admin.common.msg;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-14 22:40
 */
public class TableResultResponse2<T> {
    int count;
    int code;
    String msg;

    List<T> data;

    public TableResultResponse2(int count,int code,String msg, List<T> data) {
        this.count = count;
        this.code=code;
        this.msg=msg;
        this.data = data;
    }

    public TableResultResponse2() {
    }

    TableResultResponse2<T> count(int count){
        this.count = count;
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    TableResultResponse2<T> count(List<T> data){
        this.data = data;
        return this;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> rows) {
        this.data = data;
    }
}
