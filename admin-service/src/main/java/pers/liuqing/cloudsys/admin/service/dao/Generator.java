package pers.liuqing.cloudsys.admin.service.dao;


import pers.liuqing.cloudsys.admin.common.util.MybatisGeneratorUtil;
import pers.liuqing.cloudsys.admin.common.util.PropertiesFileUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * 代码生成类
 * Created by liuqinga on 2017/8/24.
 */
public class Generator {

	// 根据命名规范，只修改此常量值即可
	private static String MODULE = "ui";//admin后台 ui前台
	private static String DATABASE = "admin_cloud_db";
	private static String TABLE_PREFIX = "base_custaddr";
	private static String PACKAGE_NAME = "pers.liuqing.cloudsys.admin";
	private static String JDBC_DRIVER = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.driver");
	private static String JDBC_URL = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.url");
	private static String JDBC_USERNAME = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.username");
	private static String JDBC_PASSWORD = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.password");
	// 需要insert后返回主键的表配置，key:表名,value:主键名
	private static Map<String, String> LAST_INSERT_ID_TABLES = new HashMap<String, String>();
	static {
		LAST_INSERT_ID_TABLES.put("admin_test", "id_no");
	}
    private static boolean IS_TABLE=true;
	/**
	 * 自动代码生成
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		MybatisGeneratorUtil.generator(JDBC_DRIVER, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD, MODULE, DATABASE, TABLE_PREFIX, PACKAGE_NAME, LAST_INSERT_ID_TABLES,IS_TABLE);
	}

}
