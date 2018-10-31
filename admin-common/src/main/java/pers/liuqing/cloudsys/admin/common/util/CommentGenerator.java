package pers.liuqing.cloudsys.admin.common.util;

import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.dom.java.Field;
import org.mybatis.generator.internal.DefaultCommentGenerator;

/**
 * 生成model中，字段增加注释
 * Created by liuqinga on 2017/1/11.
 */
public class CommentGenerator extends DefaultCommentGenerator {

	@Override
	public void addFieldComment(Field field, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {
		super.addFieldComment(field, introspectedTable, introspectedColumn);
		if (introspectedColumn.getRemarks() != null && !introspectedColumn.getRemarks().equals("")) {
			field.addJavaDocLine("/**");
			field.addJavaDocLine(" * " + introspectedColumn.getRemarks());
			addJavadocTag(field, false);
			field.addJavaDocLine(" */");

		}
		/*if(introspectedTable.getPrimaryKeyColumns().size()>0){
			for(int i=0;i<introspectedTable.getPrimaryKeyColumns().size();i++){
				if(introspectedColumn.getActualColumnName().equals(introspectedTable.getPrimaryKeyColumns().get(i).getActualColumnName())){
					field.addJavaDocLine("@Id");
				}
			}
		}*/


	}
	/*@Override
	public  void addClassComment(InnerClass var1, IntrospectedTable var2){

		var1.addJavaDocLine("@xxx");
	}*/


}
