package pers.liuqing.cloudsys.admin.service.entity;

import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import javax.persistence.*;
/**
* 表:base_groupmsg的实体类
* Created by liuqinga on 2018/10/31 10:34:12
*/
@Table(name = "base_groupmsg")
public class Groupmsg implements Serializable {
    /**
     * 主键
     */
    @Id
    private Integer id;

    /**
     * 渠道编码
     */
    private String groupcode;

    /**
     * 渠道名称
     */
    private String groupname;

    /**
     * 渠道类型
     */
    private String classname;

    /**
     * 联系号码
     */
    private String phone;

    /**
     * 联系地址
     */
    private String addr;

    /**
     * 生日
     */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date born;

    /**
     * 操作时间
     */
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
    private Date optime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGroupcode() {
        return groupcode;
    }

    public void setGroupcode(String groupcode) {
        this.groupcode = groupcode;
    }

    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Date getBorn() {
        return born;
    }

    public void setBorn(Date born) {
        this.born = born;
    }

    public Date getOptime() {
        return optime;
    }

    public void setOptime(Date optime) {
        this.optime = optime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", groupcode=").append(groupcode);
        sb.append(", groupname=").append(groupname);
        sb.append(", classname=").append(classname);
        sb.append(", phone=").append(phone);
        sb.append(", addr=").append(addr);
        sb.append(", born=").append(born);
        sb.append(", optime=").append(optime);
        sb.append("]");
        return sb.toString();
    }
}