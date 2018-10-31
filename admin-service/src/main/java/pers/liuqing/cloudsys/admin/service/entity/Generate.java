package pers.liuqing.cloudsys.admin.service.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
/**
* 表:base_generate的实体类
* Created by liuqinga on 2017/09/04 10:04:10
*/
@Table(name = "base_generate")
public class Generate implements Serializable {
    /**
     * 主键ID
     */
    @Id
    private Integer id;

    /**
     * 表名
     */
    private String tabname;

    /**
     * 描述
     */
    private String tabdesc;

    /**
     * 程序生成标记
     */
    private String generated;

    /**
     * 操作时间
     */
    private Date optime;

    public String getGeneratedir() {
        return generatedir;
    }

    public void setGeneratedir(String generatedir) {
        this.generatedir = generatedir;
    }

    /**
     * 代码生成路径
     */
    private String generatedir;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTabname() {
        return tabname;
    }

    public void setTabname(String tabname) {
        this.tabname = tabname;
    }

    public String getTabdesc() {
        return tabdesc;
    }

    public void setTabdesc(String tabdesc) {
        this.tabdesc = tabdesc;
    }

    public String getGenerated() {
        return generated;
    }

    public void setGenerated(String generated) {
        this.generated = generated;
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
        sb.append(", tabname=").append(tabname);
        sb.append(", tabdesc=").append(tabdesc);
        sb.append(", generated=").append(generated);
        sb.append(", optime=").append(optime);
        sb.append("]");
        return sb.toString();
    }
}