package pers.liuqing.cloudsys.admin.common.util;

import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.dom.java.Field;
import org.mybatis.generator.internal.DefaultCommentGenerator;
import org.mybatis.generator.api.dom.java.InnerClass;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 生成model中，字段增加注释
 * Created by liuqinga on 2017/1/11.
 */
public class MyCommentGenerator extends DefaultCommentGenerator {

	@Override
	public void addFieldComment(Field field, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {
		super.addFieldComment(field, introspectedTable, introspectedColumn);
		if (introspectedColumn.getRemarks() != null && !introspectedColumn.getRemarks().equals("")) {
			field.addJavaDocLine("/**");
			field.addJavaDocLine(" * " + introspectedColumn.getRemarks());
			field.addJavaDocLine(" */");
		}
		if(introspectedTable.getPrimaryKeyColumns().size()>0){
			for(int i=0;i<introspectedTable.getPrimaryKeyColumns().size();i++){
				if(introspectedColumn.getActualColumnName().equals(introspectedTable.getPrimaryKeyColumns().get(i).getActualColumnName())){
					field.addJavaDocLine("@Id");
				}
			}
		}
		if(introspectedColumn.getFullyQualifiedJavaType().toString().equals("java.util.Date")){
			field.addJavaDocLine("@DateTimeFormat(pattern=\"yyyy-MM-dd\")");
			field.addJavaDocLine("@JsonFormat(pattern=\"yyyy-MM-dd\",timezone = \"GMT+8\")");
		}



	}
	@Override
	public  void addClassComment(InnerClass innerClass, IntrospectedTable introspectedTable, boolean markAsDoNotDelete){
		super.addClassComment(innerClass,introspectedTable,markAsDoNotDelete);
		innerClass.addJavaDocLine("import com.fasterxml.jackson.annotation.JsonFormat;");
		innerClass.addJavaDocLine("import org.springframework.format.annotation.DateTimeFormat;");
		innerClass.addJavaDocLine("import javax.persistence.*;");
		innerClass.addJavaDocLine("/**");
		innerClass.addJavaDocLine("* 表:"+introspectedTable.getFullyQualifiedTableNameAtRuntime()+"的实体类");
		innerClass.addJavaDocLine("* Created by liuqinga on "+new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		innerClass.addJavaDocLine("*/");
		innerClass.addJavaDocLine("@Table(name = \""+introspectedTable.getFullyQualifiedTableNameAtRuntime()+"\")");

	}


}
