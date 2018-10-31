package pers.liuqing.cloudsys.admin.service.entity;

import java.io.Serializable;

import javax.persistence.*;
/**
* 表:base_custaddr的实体类
* Created by liuqinga on 2017/09/07 19:56:18
*/
@Table(name = "base_custaddr")
public class Custaddr implements Serializable {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 地址
     */
    private String addr;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", addr=").append(addr);
        sb.append("]");
        return sb.toString();
    }
}