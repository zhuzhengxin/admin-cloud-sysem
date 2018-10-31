package pers.liuqing.cloudsys.admin.service.entity;

import java.io.Serializable;

/**
 * Created by liuqing on 2018/9/29 0029.
 * 表字段信息
 */
public class TableColumns implements Serializable {

    String columnName;//字段名称
    String columnKey;//主键标识
    String columnComment;//备注字段
    String tableName;//表名
    String dataType;//表字段类型
    String characterMaximumLength;//表字段大小
    String isNullable;//是否必填项
    String queryFlag;//是否作为查询条件，Y/N
    String queryKind;//查询条件类型，= between like
    String queryResultFlag;//查询结果展示 Y/N
    String editFlag;//编辑页面展示 Y/N

    public String getQueryKind() {
        return queryKind;
    }

    public void setQueryKind(String queryKind) {
        this.queryKind = queryKind;
    }

    public String getQueryResultFlag() {
        return queryResultFlag;
    }

    public void setQueryResultFlag(String queryResultFlag) {
        this.queryResultFlag = queryResultFlag;
    }

    public String getEditFlag() {
        return editFlag;
    }

    public void setEditFlag(String editFlag) {
        this.editFlag = editFlag;
    }

    public String getQueryFlag() {
        return queryFlag;
    }

    public void setQueryFlag(String queryFlag) {
        this.queryFlag = queryFlag;
    }

    public String getIsNullable() {
        return isNullable;
    }
    public void setIsNullable(String isNullable) {
        this.isNullable = isNullable;
    }
    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public String getCharacterMaximumLength() {
        return characterMaximumLength;
    }

    public void setCharacterMaximumLength(String characterMaximumLength) {
        this.characterMaximumLength = characterMaximumLength;
    }

    public String getColumnKey() {
        return columnKey;
    }

    public void setColumnKey(String columnKey) {
        this.columnKey = columnKey;
    }

    public String getColumnComment() {
        return columnComment;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }


    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

}
