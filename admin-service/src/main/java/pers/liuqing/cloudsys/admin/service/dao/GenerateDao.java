package pers.liuqing.cloudsys.admin.service.dao;

import com.alibaba.druid.util.StringUtils;
import org.apache.commons.beanutils.PropertyUtilsBean;
import org.apache.velocity.VelocityContext;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import pers.liuqing.cloudsys.admin.common.dao.BaseDao;
import pers.liuqing.cloudsys.admin.common.msg.ObjectRestResponse;
import pers.liuqing.cloudsys.admin.common.util.*;
import pers.liuqing.cloudsys.admin.service.entity.Generate;
import pers.liuqing.cloudsys.admin.service.entity.TableColumns;
import pers.liuqing.cloudsys.admin.service.mapper.GenerateMapper;

import java.beans.PropertyDescriptor;
import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * GenerateBiz
 * Created by liuqinga on 2017/09/04 10:04:09.
 */
@Service
public class GenerateDao extends BaseDao<GenerateMapper,Generate> {
    private static Logger logger = LoggerFactory.getLogger(GenerateDao.class);
    // 根据命名规范，只修改此常量值即可
    private static String MODULE_SERVIE = "service";
    private static String MODULE_UI="ui";
    private static String DATABASE = "admin_cloud_db";
    private static String TABLE_PREFIX = "";
    private static String PACKAGE_NAME = "pers.liuqing.cloudsys.admin";
    private static String JDBC_DRIVER = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.driver");
    private static String JDBC_URL = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.url");
    private static String JDBC_USERNAME = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.username");
    private static String JDBC_PASSWORD = PropertiesFileUtil.getInstance("generator").get("generator.jdbc.password");
    // 需要insert后返回主键的表配置，key:表名,value:主键名
    private static Map<String, String> LAST_INSERT_ID_TABLES = new HashMap<String, String>();
    private static boolean IS_TABLE = true;
    // generatorConfig模板路径
    private  String generatorConfig_vm = "/template/generatorConfig.vm";
    // dao模板路径
    private  String dao_vm = "/template/dao.vm";
    // Controller模板路径
    private  String controller2_vm = "/template/Controller2.vm";
    // list2.0
    private  String list2_vm = "/template/list2.vm";
    // edit2.0
    private  String edit2_vm = "/template/edit2.vm";
    // listjs2.0
    private  String listjs2_vm = "/template/listjs2.vm";
    // addjs2.0
    private  String addjs2_vm = "/template/addjs2.vm";

    public void insertSelective(Generate generate) {
        generate.setOptime(new Date());
        super.insertSelective(generate);
    }

    public void updateById(Generate generate) {
        generate.setOptime(new Date());
        super.updateById(generate);
    }

    //取出表字段
    public List<TableColumns> selectColumnsByTable(String table) {
        TableColumns tableColumns = new TableColumns();
        List<TableColumns> list = new ArrayList<TableColumns>();
        List<Map<String, Object>> columns = MybatisGeneratorUtil2.queryColumnsByTableName(table, DATABASE, JDBC_DRIVER, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        if (columns.size() > 0) {
            for (Map map : columns) {
                tableColumns = new TableColumns();
                tableColumns.setColumnName(map.get("column_name").toString());
                tableColumns.setColumnKey(map.get("column_key").toString());
                tableColumns.setColumnComment(map.get("column_comment").toString());
                tableColumns.setDataType(map.get("data_type").toString());
                tableColumns.setCharacterMaximumLength(map.get("character_maximum_length").toString());
                tableColumns.setIsNullable(map.get("is_nullable").toString());
                if ("PRI".equals(tableColumns.getColumnKey())) {
                    tableColumns.setQueryFlag("N");
                    tableColumns.setEditFlag("N");
                    tableColumns.setQueryKind("");
                    tableColumns.setQueryResultFlag("N");
                } else {
                    tableColumns.setQueryFlag("Y");
                    tableColumns.setEditFlag("Y");
                    tableColumns.setQueryKind("=");
                    tableColumns.setQueryResultFlag("Y");
                }
                tableColumns.setTableName(table);
                list.add(tableColumns);
            }
        }
        return list;
    }

    //更改表字段备注
    /*public  boolean updateTableFildsColumnComment(String tableName,String columnName,String columnComment,String  dataType, String characterMaximumLength){
        boolean result=true;
        JdbcUtil jdbcUtil=new JdbcUtil(JDBC_DRIVER,JDBC_URL,JDBC_USERNAME,JDBC_PASSWORD);
        StringBuffer sql=new StringBuffer();
        sql.append("ALTER TABLE "+tableName+" modify column "+columnName+" " +dataType );
        if(characterMaximumLength!=null&&!"".equals(characterMaximumLength))
            sql.append("("+characterMaximumLength+") ");
        sql.append(" comment '" +columnComment+"'");
        System.out.println(sql.toString());
        try {
            jdbcUtil.updateByParams(sql.toString(),new ArrayList());
        } catch (SQLException e) {
            e.printStackTrace();
            jdbcUtil.release();
            result=false;
        }

        jdbcUtil.release();
        return  result;
    }*/
    public boolean updateTableFildsColumnComment(TableColumns tableColumns) {
        boolean result = true;
        JdbcUtil jdbcUtil = new JdbcUtil(JDBC_DRIVER, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
        StringBuffer sql = new StringBuffer();
        sql.append("ALTER TABLE " + tableColumns.getTableName() + " modify column " + tableColumns.getColumnName() + " " + tableColumns.getDataType());
        if (tableColumns.getCharacterMaximumLength() != null && !"".equals(tableColumns.getCharacterMaximumLength()))
            sql.append("(" + tableColumns.getCharacterMaximumLength() + ") ");
        sql.append(" comment '" + tableColumns.getColumnComment() + "'");
        logger.info(sql.toString());
        try {
            jdbcUtil.updateByParams(sql.toString(), new ArrayList());
        } catch (SQLException e) {
            e.printStackTrace();
            jdbcUtil.release();
            result = false;
        }

        jdbcUtil.release();
        return result;
    }

    //根据表来自动代码生成
    public boolean generateCode(int id) {
        boolean result = true;
        Generate generate = super.selectById(id);
        try {
            TABLE_PREFIX = generate.getTabname();
            MybatisGeneratorUtil2.generator(JDBC_DRIVER, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD, MODULE_SERVIE, DATABASE, TABLE_PREFIX, PACKAGE_NAME, LAST_INSERT_ID_TABLES, IS_TABLE, generate.getGeneratedir());
            MybatisGeneratorUtil2.generator(JDBC_DRIVER, JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD, MODULE_UI, DATABASE, TABLE_PREFIX, PACKAGE_NAME, LAST_INSERT_ID_TABLES, IS_TABLE, generate.getGeneratedir());
            generate.setGenerated("Y");
        } catch (Exception e) {
            generate.setGenerated("N");
            result = false;
            e.printStackTrace();
        }
        generate.setOptime(new Date());
        super.updateById(generate);
        return result;
    }

    //根据表自动生成代码，同时加上前台选的条件
    public ObjectRestResponse genarateCode(List<TableColumns> columnsList) {
        ObjectRestResponse objectRestResponse=new  ObjectRestResponse();
        List<String> resultList = new ArrayList<String>();
        Generate generate = new Generate();
        generate.setTabname(columnsList.get(0).getTableName());
        generate = super.selectOne(generate);
        /*generatorConfig_vm = GenerateDao.class.getClassLoader().getResource(generatorConfig_vm).getPath().replaceFirst("/", "");
        logger.info("generatorConfig_vm:============"+generatorConfig_vm);
        dao_vm = GenerateDao.class.getResource(dao_vm).getPath().replaceFirst("/", "");
        controller2_vm = GenerateDao.class.getClassLoader().getResource(controller2_vm).getPath().replaceFirst("/", "");
        list2_vm = GenerateDao.class.getClassLoader().getResource(list2_vm).getPath().replaceFirst("/", "");
        edit2_vm = GenerateDao.class.getClassLoader().getResource(edit2_vm).getPath().replaceFirst("/", "");
        addjs2_vm = GenerateDao.class.getClassLoader().getResource(addjs2_vm).getPath().replaceFirst("/", "");
        listjs2_vm = GenerateDao.class.getClassLoader().getResource(listjs2_vm).getPath().replaceFirst("/", "");
        */
        generatorConfig_vm = generate.getGeneratedir()+"/admin-service/target/classes"+generatorConfig_vm;
        dao_vm = generate.getGeneratedir()+"/admin-service/target/classes"+dao_vm;
        controller2_vm = generate.getGeneratedir()+"/admin-service/target/classes"+controller2_vm;
        list2_vm = generate.getGeneratedir()+"/admin-service/target/classes"+list2_vm;
        edit2_vm = generate.getGeneratedir()+"/admin-service/target/classes"+edit2_vm;
        addjs2_vm = generate.getGeneratedir()+"/admin-service/target/classes"+addjs2_vm;
        listjs2_vm = generate.getGeneratedir()+"/admin-service/target/classes"+listjs2_vm;
        //根据自己具体代码路径修改
        String targetProject = generate.getGeneratedir() + "/admin-" + MODULE_SERVIE;
        String module_path = targetProject + "/src/main/resources/generatorConfig.xml";
        String sql = "";
        String ctime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date());
        logger.info("========== 开始启动代码生成 ==========");
        logger.info("========== 开始生成generatorConfig.xml文件相关源码与配置文件 ==========");
        resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始启动代码生成 \n");
        resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始生成generatorConfig.xml文件相关源码与配置文件 \n");
        VelocityContext context = new VelocityContext();
        List<Map<String, Object>> tables = new ArrayList<Map<String, Object>>();
        //将表字段信息转化
        List<Map<String, Object>> columns = new ArrayList<Map<String, Object>>();
        Map<String, Object> column = new HashMap<String, Object>();
        for (TableColumns tableColumn : columnsList) {
            column = new HashMap<String, Object>();
            PropertyUtilsBean propertyUtilsBean = new PropertyUtilsBean();
            PropertyDescriptor[] descriptors = propertyUtilsBean.getPropertyDescriptors(tableColumn);
            for (PropertyDescriptor descriptor : descriptors) {
                String name = descriptor.getName();
                if (!StringUtils.equals(name, "class")) {
                    try {
                        column.put(name, propertyUtilsBean.getNestedProperty(tableColumn, name));
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    } catch (InvocationTargetException e) {
                        e.printStackTrace();
                    } catch (NoSuchMethodException e) {
                        e.printStackTrace();
                    }
                }
            }
            columns.add(column);
        }
        for (Map map:columns) {
            logger.info(map.get("columnName").toString());
        }
        try {
            Map<String, Object> table = new HashMap<String, Object>();
            table.put("table_name", columnsList.get(0).getTableName());
            table.put("model_name", StringUtil.toUpperCaseFirstOne(columnsList.get(0).getTableName().toString().split("_")[1]));
            tables.add(table);
                String targetProject_sqlMap = targetProject;
                context.put("tables", tables);
                context.put("generator_javaModelGenerator_targetPackage", PACKAGE_NAME + "." + MODULE_SERVIE + ".entity");
                context.put("generator_sqlMapGenerator_targetPackage", "mapper");
                context.put("generator_javaClientGenerator_targetPackage", PACKAGE_NAME + "." + MODULE_SERVIE + ".mapper");
                context.put("targetProject", targetProject);
                context.put("targetProject_sqlMap", targetProject_sqlMap);
                context.put("generator_jdbc_password", JDBC_PASSWORD);
                context.put("last_insert_id_tables", table);
                VelocityUtil.generate(generatorConfig_vm, module_path, context);
                // 删除旧代码
                for (int i = 0; i < tables.size(); i++) {
                    String model_name = tables.get(i).get("model_name").toString();
                    MybatisGeneratorUtil2.deleteFile(new File(targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_SERVIE + "/entity/" + model_name + ".java"));
                    MybatisGeneratorUtil2.deleteFile(new File(targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_SERVIE + "/entity/" + model_name + "Example.java"));
                    MybatisGeneratorUtil2.deleteFile(new File(targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_SERVIE + "/mapper/" + model_name + "Mapper.java"));
                    MybatisGeneratorUtil2.deleteFile(new File(targetProject + "/src/main/resources/mapper/" + model_name + "Mapper.xml"));
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_SERVIE + "/entity/" + model_name + ".java \n");
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_SERVIE + "/entity/" + model_name + "Example.java \n");
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_SERVIE + "/mapper/" + model_name + "Mapper.java \n");
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 配置路径："+targetProject + "/src/main/resources/mapper/" + model_name + "Mapper.xml \n");

                }
                List<String> warnings = new ArrayList<String>();
                File configFile = new File(module_path);
                ConfigurationParser cp = new ConfigurationParser(warnings);
                Configuration config = cp.parseConfiguration(configFile);
                DefaultShellCallback callback = new DefaultShellCallback(true);
                MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
                myBatisGenerator.generate(null);
                for (String warning : warnings) {
                    logger.info(warning);
                }
                resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 结束生成generatorConfig.xml文件相关源码与配置文件 \n");
                logger.info("========== 结束生成generatorConfig.xml文件相关源码与配置文件 ==========");

                logger.info("========== 开始生成Dao ==========");
                resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始生成Dao \n");

                String daoPath = targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_SERVIE + "/dao";
                for (int i = 0; i < tables.size(); i++) {
                    String model = StringUtil.toUpperCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
                    String dao = daoPath + "/" + model + "Dao.java";
                    MybatisGeneratorUtil2.deleteFile(new File(dao));
                    // 生成dao
                    File daoFile = new File(dao);

                    if (!daoFile.exists()) {
                        context = new VelocityContext();
                        context.put("package_name", PACKAGE_NAME + "." + MODULE_SERVIE);
                        context.put("model", model);
                        context.put("ctime", ctime);
                        VelocityUtil.generate(dao_vm, dao, context);
                        //logger.info(dao);
                    }
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+dao+" \n");
                }
                resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 结束生成Dao \n");
                logger.info("========== 结束生成Dao ==========");

                logger.info("========== 开始生成后台管理Controller ==========");
                resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始生成后台管理Controller \n");
                String controllerPath = targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_SERVIE + "/rest";
                for (int i = 0; i < tables.size(); i++) {
                    String model = StringUtil.toUpperCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
                    String url = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
                    String controller = controllerPath + "/" + model + "Controller.java";
                    MybatisGeneratorUtil2.deleteFile(new File(controller));
                    // 生成Controller
                    File controllerFile = new File(controller);
                    if (!controllerFile.exists()) {
                        context = new VelocityContext();
                        context.put("package_name", PACKAGE_NAME + "." + MODULE_SERVIE);
                        context.put("model", model);
                        context.put("ctime", ctime);
                        context.put("url", url);
                        context.put("columns", columns);
                        context.put("columnscount", columns.size());
                        VelocityUtil.generate(controller2_vm, controller, context);
                        //logger.info(controller);
                    }
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+controllerFile +" \n");

                }
                resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 结束生成后台管理Controller \n");
                logger.info("========== 结束生成后台管理Controller ==========");

                 targetProject = generate.getGeneratedir() + "/admin-" + MODULE_UI;
                logger.info("========== 开始生成前台Controller ==========");
                resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始生成前台Controller \n");
                String str="";
                     controllerPath = targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_UI + "/controller/HomeController.java";
                    String newcontrollerPath = targetProject + "/src/main/java/" + PACKAGE_NAME.replaceAll("\\.", "/") + "/" + MODULE_UI + "/controller/NewHomeController.java";
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
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+controllerPath+" \n");
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 结束生成前台Controller \n");
                    logger.info("========== 结束生成前台Controller ==========");
                    logger.info("========== 开始生成前台list.html ==========");
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始生成前台list.html \n");
                    String listPath = targetProject + "/src//main/resources/templates/"  ;
                    for (int i = 0; i < tables.size(); i++) {
                        String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
                        if(!(new File(listPath+"/"+model+"").isDirectory())){
                            new File(listPath+"/"+model+"").mkdir();
                        }
                        String list = listPath + "/" + model + "/list.html";
                        MybatisGeneratorUtil2.deleteFile(new File(list));
                        // 生成list.html
                        File listFile = new File(list);
                        if (!listFile.exists()) {
                            context = new VelocityContext();
                            context.put("model", model);
                            context.put("ctime", ctime);
                            context.put("columns", columns);
                            VelocityUtil.generate(list2_vm, list, context);
                            //logger.info(list);
                        }

                        resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+list+" \n");

                    }
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 结束生成前台list.html \n");
                    logger.info("========== 结束生成前台list.html ==========");
                    logger.info("========== 开始生成前台edit.html ==========");
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始生成前台edit.html \n");
                    for (int i = 0; i < tables.size(); i++) {
                        String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
                        if(!(new File(listPath+"/"+model+"").isDirectory())){
                            new File(listPath+"/"+model+"").mkdir();
                        }
                        String edit = listPath + "/" + model + "/edit.html";
                        MybatisGeneratorUtil2.deleteFile(new File(edit));
                        // 生成edit.html
                        File editFile = new File(edit);
                        if (!editFile.exists()) {
                            context = new VelocityContext();
                            context.put("model", model);
                            context.put("ctime", ctime);
                            context.put("columns", columns);
                            VelocityUtil.generate(edit2_vm, edit, context);
                            //logger.info(edit);
                        }
                        resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+edit+" \n");


                    }
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 结束生成前台edit.html \n");
                    logger.info("========== 结束生成前台edit.html ==========");
                    logger.info("========== 开始生成前台addjs ==========");
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始生成前台addjs \n");

                    String jsPath = targetProject + "/src//main/resources/static/ag/"  ;
                    for (int i = 0; i < tables.size(); i++) {
                        String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
                        if(!(new File(jsPath+"/"+model+"").isDirectory())){
                            new File(jsPath+"/"+model+"").mkdir();
                        }
                        String js = jsPath + "/" + model+ "/" + model + "add.js";
                        MybatisGeneratorUtil2.deleteFile(new File(js));
                        // 生成js
                        File jsFile = new File(js);
                        if (!jsFile.exists()) {
                            context = new VelocityContext();
                            context.put("model", model);
                            context.put("ctime", ctime);
                            context.put("columns", columns);
                            context.put("columnscount", columns.size());
                            VelocityUtil.generate(addjs2_vm, js, context);
                            //logger.info(js);
                        }
                        resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+js+" \n");


                    }
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 结束生成前台addjs \n");
                    logger.info("========== 结束生成前台addjs ==========");
                    logger.info("========== 开始生成前台listjs ==========");
                    resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 开始生成前台listjs \n");

                    jsPath = targetProject + "/src//main/resources/static/ag/"  ;
                    for (int i = 0; i < tables.size(); i++) {
                        String model = StringUtil.toLowerCaseFirstOne(tables.get(i).get("table_name").toString().split("_")[1]);
                        if(!(new File(jsPath+"/"+model+"").isDirectory())){
                            new File(jsPath+"/"+model+"").mkdir();
                        }
                        String js = jsPath + "/" + model+ "/" + model + "list.js";
                        MybatisGeneratorUtil2.deleteFile(new File(js));
                        // 生成js
                        File jsFile = new File(js);
                        if (!jsFile.exists()) {
                            context = new VelocityContext();
                            context.put("model", model);
                            context.put("ctime", ctime);
                            context.put("columns", columns);
                            context.put("columnscount", columns.size());
                            VelocityUtil.generate(listjs2_vm, js, context);
                            //logger.info(js);
                        }
                        resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 源码路径："+js+" \n");
                    }
                resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 结束生成前台listjs \n");
                logger.info("========== 结束生成前台listjs ==========");

            resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date())+" 代码生成完毕 \n");
            logger.info("========== 代码生成完毕 ==========");
            generate.setGenerated("Y");
            objectRestResponse.rel(true);
        } catch (IOException e) {
            e.printStackTrace();
            resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()).toString()+e.getMessage()+"\n");
            objectRestResponse.rel(false);
        } catch (SQLException e) {
            e.printStackTrace();
            resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()).toString()+e.getMessage()+"\n");
            objectRestResponse.rel(false);
        } catch (InterruptedException e) {
            e.printStackTrace();
            resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()).toString()+e.getMessage()+"\n");
            objectRestResponse.rel(false);
        } catch (InvalidConfigurationException e) {
            e.printStackTrace();
            resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()).toString()+e.getMessage()+"\n");
            objectRestResponse.rel(false);
        } catch (XMLParserException e) {
            e.printStackTrace();
            resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()).toString()+e.getMessage()+"\n");
            objectRestResponse.rel(false);
        } catch (Exception e) {
            e.printStackTrace();
            resultList.add(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()).toString()+e.getMessage()+"\n");
            objectRestResponse.rel(false);
        }
        objectRestResponse.result(resultList);

        generate.setOptime(new Date());
        super.updateById(generate);
        return objectRestResponse;
    }

    public static void main(String [] args){
       /* generatorConfig_vm = GenerateDao.class.getResource(generatorConfig_vm).getPath().replaceFirst("/", "");
        System.out.print(generatorConfig_vm);*/
    }
}