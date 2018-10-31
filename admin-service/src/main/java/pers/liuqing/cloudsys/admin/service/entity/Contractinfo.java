package pers.liuqing.cloudsys.admin.service.entity;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.*;
/**
* 表:base_contractinfo的实体类
* Created by liuqinga on 2018/10/26 22:01:48
*/
@Table(name = "base_contractinfo")
public class Contractinfo implements Serializable {
    /**
     * 主键id
     */
    @Id
    private Integer id;

    /**
     * 合同号
     */
    private String contractNo;

    /**
     * 合同名称
     */
    private String contractName;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContractNo() {
        return contractNo;
    }

    public void setContractNo(String contractNo) {
        this.contractNo = contractNo;
    }

    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractName) {
        this.contractName = contractName;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", contractNo=").append(contractNo);
        sb.append(", contractName=").append(contractName);
        sb.append("]");
        return sb.toString();
    }
}