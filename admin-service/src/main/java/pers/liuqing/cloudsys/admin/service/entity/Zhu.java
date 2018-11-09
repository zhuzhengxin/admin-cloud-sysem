package pers.liuqing.cloudsys.admin.service.entity;

import java.io.Serializable;

public class Zhu implements Serializable {
    /**
     * id
     */
    @Id
    private String id;

    /**
     * 名称
     */
    private String name;

    /**
     * 年龄
     */
    private String age;

    /**
     * 性别
     */
    private String six;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getSix() {
        return six;
    }

    public void setSix(String six) {
        this.six = six;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", age=").append(age);
        sb.append(", six=").append(six);
        sb.append("]");
        return sb.toString();
    }
}