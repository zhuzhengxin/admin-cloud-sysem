package pers.liuqing.cloudsys.admin.service.entity;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
/**
* 表:base_agent的实体类
* Created by liuqinga on 2017/09/04 19:49:28
*/
@Table(name = "base_agent")
public class Agent implements Serializable {
    @Id
    private Integer id;

    /**
     * 代理商名称
     */
    private String name;

    /**
     * 地址
     */
    private String address;

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", address=").append(address);
        sb.append("]");
        return sb.toString();
    }
}