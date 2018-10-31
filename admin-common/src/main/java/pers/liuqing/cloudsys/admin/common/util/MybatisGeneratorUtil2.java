package pers.liuqing.cloudsys.admin.common.util;

import org.apache.velocity.VelocityContext;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 代码生成类
 * Created by liuqinga on 2017/8/24.
 * 前端web执行使用
 */
public class MybatisGeneratorUtil2 {


	/**
	 * 根据模板生成generatorConfig.xml文件
	 * @param jdbc_driver   驱动路径
	 * @param jdbc_url      链接
	 * @param jdbc_username 帐号
	 * @param jdbc_password 密码
	 * @param module        项目模块
	 * @param database      数据库
	 * @param table_prefix  表前缀
	 * @param package_name  包名
	 * @param is_table     是否为单个表
	 */
	public static void generator(
			String jdbc_driver,
			String jdbc_url,
			String jdbc_username,
			String jdbc_password,
			String module,
			String database,
			String table_prefix,
			String package_name,
			Map<String, String> last_insert_id_tables, boolean is_table,String generatedir) throws Exception{
		// generatorConfig模板路径
		String generatorConfig_vm = "/template/generatorConfig.vm";
		// biz模板路径
		String biz_vm = "/template/biz.vm";
		// Controller模板路径
		String controller2_vm = "/template/Controller2.vm";
		// list.html模板路径
		String list_vm = "/template/list.vm";
		// edit.html模板路径
		String edit_vm = "/template/edit.vm";
		// js模板路径
		String js_vm = "/template/js.vm";
		// list2.0
		String list2_vm = "/template/list2.vm";
		// edit2.0
		String edit2_vm = "/template/edit2.vm";
		// listjs2.0
		String listjs2_vm = "/template/listjs2.vm";
		// addjs2.0
		String addjs2_vm = "/template/addjs2.vm";
		generatorConfig_vm = MybatisGeneratorUtil2.class.getResource(generatorConfig_vm).getPath().replaceFirst("/", "");
		System.out.println("generatorConfig_vm:"+generatorConfig_vm);
		biz_vm = MybatisGeneratorUtil.class.getResource(biz_vm).getPath().replaceFirst("/", "");
		controller2_vm = MybatisGeneratorUtil.class.getResource(controller2_vm).getPath().replaceFirst("/", "");
		list_vm = MybatisGeneratorUtil.class.getResource(list_vm).getPath().replaceFirst("/", "");
		edit_vm = MybatisGeneratorUtil.class.getResource(edit_vm).getPath().replaceFirst("/", "");
		js_vm = MybatisGeneratorUtil.class.getResource(js_vm).getPath().replaceFirst("/", "");
		list2_vm = MybatisGeneratorUtil.class.getResource(list2_vm).getPath().replaceFirst("/", "");
		edit2_vm = MybatisGeneratorUtil.class.getResource(edit2_vm).getPath().replaceFirst("/", "");
		addjs2_vm = MybatisGeneratorUtil.class.getResource(addjs2_vm).getPath().replaceFirst("/", "");
		listjs2_vm = MybatisGeneratorUtil.class.getResource(listjs2_vm).getPath().replaceFirst("/", "");
		//根据自己具体代码路径修改
		String targetProject =   generatedir+"/admin-" + module ;
		String module_path = targetProject+"/src/main/resources/generatorConfig.xml";
		String sql="";
		String ctime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
		if(!is_table)
			sql = "SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = '" + database + "' AND table_name LIKE '" + table_prefix + "_%';";
		else
			sql = "SELECT table_name FROM INFORMATION_SCHEMA.TABLES WHERE table_schema = '" + database + "' AND table_name = '" + table_prefix + "';";
			System.out.println("========== 开始生成generatorConfig.xml文件 ==========");
			List<Map<String, Object>> tables = new ArrayList<Map<String, Object>>();
		    VelocityContext context = new VelocityContext();
			try {
				Map<String, Object> table;

				// 查询定制前缀项目的所有表
				JdbcUtil jdbcUtil = new JdbcUtil(jdbc_driver, jdbc_url, jdbc_username, jdbc_password);
				List<Map> result = jdbcUtil.selectByParams(sql, null);
				for (Map map : result) {
					System.out.println(map.get("TABLE_NAME"));
					table = new HashMap<String, Object>();
					table.put("table_name", map.get("TABLE_NAME"));
					table.put("model_name", StringUtil.toUpperCaseFirstOne(map.get("TABLE_NAME").toString().split("_")[1]));
					tables.add(table);
				}
				jdbcUtil.release();
			} catch (Exception e) {
				e.printStackTrace();
			}
			if("service".equals(module)) {
				String targetProject_sqlMap = targetProject;
				context.put("tables", tables);
				context.put("generator_javaModelGenerator_targetPackage", package_name + "." + module + ".entity");
				context.put("generator_sqlMapGenerator_targetPackage", "mapper");
				context.put("generator_javaClientGenerator_targetPackage", package_name + "." + module + ".mapper");
				context.put("targetProject", targetProject);
				context.put("targetProject_sqlMap", targetProject_sqlMap);
				context.put("generator_jdbc_password", jdbc_password);
				context.put("last_insert_id_tables", last_insert_id_tables);
				VelocityUtil.generate(generatorConfig_vm, module_path, context);
				// 删除旧代码
				for (int i = 0; i < tables.size(); i++) {
					String model_name = tables.get(i).get("model_name").toString();
					deleteFile(new File(targetProject + "/src/main/java/" + package_name.replaceAll("\\.", "/") + "/" + module + "/entity/" + model_name + ".java"));
					deleteFile(new File(targetProject + "/src/main/java/" + package_name.replaceAll("\\.", "/") + "/" + module + "/entity/" + model_name + "Example.java"));
					deleteFile(new File(targetProject + "/src/main/java/" + package_name.replaceAll("\\.", "/") + "/" + module + "/mapper/" + model_name + "Mapper.java"));
					deleteFile(new File(targetProject + "/src/main/resources/mapper/" + model_name + "Mapper.xml"));
				}

			System.out.println("========== 结束生成generatorConfig.xml文件 ==========");

			System.out.println("========== 开始运行MybatisGenerator ==========");
			List<String> warnings = new ArrayList<String>();
			File configFile = new File(module_path);
			ConfigurationParser cp = new ConfigurationParser(warnings);
			Configuration config = cp.parseConfiguration(configFile);
			DefaultShellCallback callback = new DefaultShellCallback(true);
			MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
			myBatisGenerator.generate(null);
			for (String warning : warnings) {
				System.out.println(warning);
			}
			System.out.println("========== 结束运行MybatisGenerator ==========");

			System.out.println("========== 开始生成Dao ==========");

			String bizPath = targetProject + "/src/main/java/" + package_name.replaceAll("\\.", "/") + "/" + module + "/dao";
			for (int i = 0; i < tables.size(); i++) {
				String model = StringUtil.toUpperCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
				String biz = bizPath + "/" + model + "Dao.java";
				deleteFile(new File(biz));
				// 生成biz
				File bizFile = new File(biz);

				if (!bizFile.exists()) {
					context = new VelocityContext();
					context.put("package_name", package_name + "." + module);
					context.put("model", model);
					context.put("ctime", ctime);
					VelocityUtil.generate(biz_vm, biz, context);
					System.out.println(biz);
				}


			}
			System.out.println("========== 结束生成Dao ==========");

			System.out.println("========== 开始生成后台管理Controller ==========");

			String controllerPath = targetProject + "/src/main/java/" + package_name.replaceAll("\\.", "/") + "/" + module + "/rest";
			for (int i = 0; i < tables.size(); i++) {
				String model = StringUtil.toUpperCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
				String url = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
				String controller = controllerPath + "/" + model + "Controller.java";
				deleteFile(new File(controller));
				// 生成Controller
				File controllerFile = new File(controller);
				// 查询表中所有的字段
				List<Map<String, Object>> columns =queryColumnByTableName(tables.get(i).get("table_name").toString(), database, jdbc_driver,  jdbc_url,  jdbc_username,  jdbc_password);
				if (!controllerFile.exists()) {
					context = new VelocityContext();
					context.put("package_name", package_name + "." + module);
					context.put("model", model);
					context.put("ctime", ctime);
					context.put("url", url);
					context.put("columns", columns);
					context.put("columnscount", columns.size());
					VelocityUtil.generate(controller2_vm, controller, context);
					System.out.println(controller);
				}


			}
			System.out.println("========== 结束生成后台管理Controller ==========");
		}else {
			System.out.println("========== 开始生成前台Controller ==========");
			String str="";
			String controllerPath = targetProject + "/src/main/java/" + package_name.replaceAll("\\.", "/") + "/" + module + "/controller/HomeController.java";
			String newcontrollerPath = targetProject + "/src/main/java/" + package_name.replaceAll("\\.", "/") + "/" + module + "/controller/NewHomeController.java";
			OutputStreamWriter pw= new OutputStreamWriter(new FileOutputStream(newcontrollerPath),"UTF-8");
			BufferedReader bre = new BufferedReader(new FileReader(controllerPath));
			while ((str=bre.readLine())!=null){
				if("}".equals(str)&&tables.size()>0){
					for (int i = 0; i < tables.size(); i++) {
						String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
						pw.write("    @RequestMapping(value = \"" + model + "\",method = RequestMethod.GET)\n");
						pw.write("    public String " + model + "(){return \"" + model + "/list\";}\n");
						pw.write("    @RequestMapping(value = \"" + model + "/edit\",method = RequestMethod.GET)\n");
						pw.write("    public String " + model + "Edit(){return \"" + model + "/edit\";}\n");
				    }
				}
				boolean flag=true;//判断是否已经存在方法了
				for (int i = 0; i < tables.size(); i++) {
					String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
					if(str.indexOf("@RequestMapping(value = \"" + model + "\",method = RequestMethod.GET)")!=-1)
						flag=false;
					else if(str.indexOf("public String " + model + "(){return \"" + model + "/list\";}")!=-1)
						flag=false;
					else if(str.indexOf("@RequestMapping(value = \"" + model + "/edit\",method = RequestMethod.GET)")!=-1)
						flag=false;
					else if(str.indexOf("public String " + model + "Edit(){return \"" + model + "/edit\";}")!=-1)
						flag=false;
				}
				if (flag)
				pw.write(str+"\n");
			}
			bre.close();
			pw.close();
			new File(controllerPath).delete();
			new File(newcontrollerPath).renameTo(new File(controllerPath));
			System.out.println("========== 结束生成前台Controller ==========");


				System.out.println("========== 开始生成前台list.html ==========");

				String listPath = targetProject + "/src//main/resources/templates/"  ;
				for (int i = 0; i < tables.size(); i++) {
					String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
					if(!(new File(listPath+"/"+model+"").isDirectory())){
						new File(listPath+"/"+model+"").mkdir();
					}
					String list = listPath + "/" + model + "/list.html";
					deleteFile(new File(list));
					// 生成list.html
					File listFile = new File(list);
					// 查询表中所有的字段
					List<Map<String, Object>> columns =queryColumnByTableName(tables.get(i).get("table_name").toString(), database, jdbc_driver,  jdbc_url,  jdbc_username,  jdbc_password);
					if (!listFile.exists()) {
						context = new VelocityContext();
						context.put("model", model);
						context.put("ctime", ctime);
						context.put("columns", columns);
						VelocityUtil.generate(list2_vm, list, context);
						System.out.println(list);
					}


				}
				System.out.println("========== 结束生成前台list.html ==========");

				System.out.println("========== 开始生成前台edit.html ==========");

				for (int i = 0; i < tables.size(); i++) {
					String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
					if(!(new File(listPath+"/"+model+"").isDirectory())){
						new File(listPath+"/"+model+"").mkdir();
					}
					String edit = listPath + "/" + model + "/edit.html";
					deleteFile(new File(edit));
					// 生成edit.html
					File editFile = new File(edit);
					// 查询表中所有的字段
					List<Map<String, Object>> columns =queryColumnByTableName(tables.get(i).get("table_name").toString(), database, jdbc_driver,  jdbc_url,  jdbc_username,  jdbc_password);
					if (!editFile.exists()) {
						context = new VelocityContext();
						context.put("model", model);
						context.put("ctime", ctime);
						context.put("columns", columns);
						VelocityUtil.generate(edit2_vm, edit, context);
						System.out.println(edit);
					}


				}
				System.out.println("========== 结束生成前台edit.html ==========");


				System.out.println("========== 开始生成前台addjs ==========");
				String jsPath = targetProject + "/src//main/resources/static/ag/"  ;
				for (int i = 0; i < tables.size(); i++) {
					String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
					if(!(new File(jsPath+"/"+model+"").isDirectory())){
						new File(jsPath+"/"+model+"").mkdir();
					}
					String js = jsPath + "/" + model+ "/" + model + "add.js";
					deleteFile(new File(js));
					// 生成js
					File jsFile = new File(js);
					// 查询表中所有的字段
					List<Map<String, Object>> columns =queryColumnByTableName(tables.get(i).get("table_name").toString(), database, jdbc_driver,  jdbc_url,  jdbc_username,  jdbc_password);
					if (!jsFile.exists()) {
						context = new VelocityContext();
						context.put("model", model);
						context.put("ctime", ctime);
						context.put("columns", columns);
						context.put("columnscount", columns.size());
						VelocityUtil.generate(addjs2_vm, js, context);
						System.out.println(js);
					}


				}
				System.out.println("========== 结束生成前台addjs ==========");

				System.out.println("========== 开始生成前台listjs ==========");
				jsPath = targetProject + "/src//main/resources/static/ag/"  ;
				for (int i = 0; i < tables.size(); i++) {
					String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
					if(!(new File(jsPath+"/"+model+"").isDirectory())){
						new File(jsPath+"/"+model+"").mkdir();
					}
					String js = jsPath + "/" + model+ "/" + model + "list.js";
					deleteFile(new File(js));
					// 生成js
					File jsFile = new File(js);
					// 查询表中所有的字段
					List<Map<String, Object>> columns =queryColumnByTableName(tables.get(i).get("table_name").toString(), database, jdbc_driver,  jdbc_url,  jdbc_username,  jdbc_password);
					if (!jsFile.exists()) {
						context = new VelocityContext();
						context.put("model", model);
						context.put("ctime", ctime);
						context.put("columns", columns);
						context.put("columnscount", columns.size());
						VelocityUtil.generate(listjs2_vm, js, context);
						System.out.println(js);
					}


				}
				System.out.println("========== 结束生成前台listjs ==========");
	}
	}
	// 递归删除非空文件夹
	public static void deleteDir(File dir) {
		if (dir.isDirectory()) {
			File[] files = dir.listFiles();
			for (int i = 0; i < files.length; i++) {
				deleteDir(files[i]);
			}
		}
		dir.delete();
	}
	//删除文件
	public static void deleteFile(File file){
        if(file.exists()){
			file.delete();
		}
	}
	//查询表中所有字段
	public static List<Map<String, Object>>  queryColumnByTableName(String table_name,String database_name,String jdbc_driver, String jdbc_url, String jdbc_username, String jdbc_password){
		JdbcUtil jdbcUtil = new JdbcUtil(jdbc_driver, jdbc_url, jdbc_username, jdbc_password);
		String sql = "SELECT COLUMN_NAME,COLUMN_KEY,COLUMN_COMMENT FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = '" + database_name + "'    and table_name = '" +table_name + "';";

		List<Map> result = null;
		try {
			result = jdbcUtil.selectByParams(sql, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		List<Map<String, Object>> columns = new ArrayList<Map<String, Object>>();
		Map<String, Object> column;
		for (Map map : result) {
			//System.out.println(map.get("COLUMN_COMMENT"));
			column = new HashMap<String, Object>();
			column.put("column_name", StringUtil.lineToHumpFirst(map.get("COLUMN_NAME").toString().replace("-","")));
			column.put("column_key", map.get("COLUMN_KEY")==null?"":map.get("COLUMN_KEY").toString());
			column.put("column_comment", map.get("COLUMN_COMMENT")==null?"":map.get("COLUMN_COMMENT").toString());
			columns.add(column);
		}
		jdbcUtil.release();
		return columns;
	}
	//查询表中所有字段，包括表字段名称，表备注，主键标识，字段类型，字段大小等信息
	public static List<Map<String, Object>>  queryColumnsByTableName(String table_name,String database_name,String jdbc_driver, String jdbc_url, String jdbc_username, String jdbc_password){
		JdbcUtil jdbcUtil = new JdbcUtil(jdbc_driver, jdbc_url, jdbc_username, jdbc_password);
		String sql = "SELECT COLUMN_NAME,COLUMN_KEY,COLUMN_COMMENT,DATA_TYPE,CHARACTER_MAXIMUM_LENGTH,IS_NULLABLE FROM INFORMATION_SCHEMA.COLUMNS WHERE table_schema = '" + database_name + "'    and table_name = '" +table_name + "';";

		List<Map> result = null;
		try {
			result = jdbcUtil.selectByParams(sql, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		List<Map<String, Object>> columns = new ArrayList<Map<String, Object>>();
		Map<String, Object> column;
		for (Map map : result) {
			//System.out.println(map.get("COLUMN_COMMENT"));
			column = new HashMap<String, Object>();
			column.put("column_name", StringUtil.lineToHumpFirst(map.get("COLUMN_NAME").toString().replace("-","")));
			column.put("column_key", map.get("COLUMN_KEY")==null?"":map.get("COLUMN_KEY").toString());
			column.put("column_comment", map.get("COLUMN_COMMENT")==null?"":map.get("COLUMN_COMMENT").toString());
			column.put("data_type", map.get("DATA_TYPE")==null?"":map.get("DATA_TYPE").toString());
			column.put("character_maximum_length", map.get("CHARACTER_MAXIMUM_LENGTH")==null?"":map.get("CHARACTER_MAXIMUM_LENGTH").toString());
			column.put("is_nullable", map.get("IS_NULLABLE")==null?"":map.get("IS_NULLABLE").toString());

			columns.add(column);
		}
		jdbcUtil.release();
		return columns;
	}



}
