package pers.liuqing.cloudsys.admin.service.entity;

import java.io.Serializable;

import javax.persistence.*;
/**
* 表:admin_test的实体类
* Created by liuqinga on 2017/9/2
*/
@Table(name = "admin_test")
public class Test implements Serializable {
    @Id
    private Integer idNo;

    /**
     * 注释
     */
    private String userNo;

    private static final long serialVersionUID = 1L;

    public Integer getIdNo() {
        return idNo;
    }

    public void setIdNo(Integer idNo) {
        this.idNo = idNo;
    }

    public String getUserNo() {
        return userNo;
    }

    public void setUserNo(String userNo) {
        this.userNo = userNo;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", idNo=").append(idNo);
        sb.append(", userNo=").append(userNo);
        sb.append("]");
        return sb.toString();
    }
}