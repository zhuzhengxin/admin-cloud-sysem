package pers.liuqing.cloudsys.admin.service.rest;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pers.liuqing.cloudsys.admin.common.msg.ObjectRestResponse;
import pers.liuqing.cloudsys.admin.common.msg.TableResultResponse;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.service.dao.GenerateDao;
import pers.liuqing.cloudsys.admin.service.entity.Generate;
import pers.liuqing.cloudsys.admin.service.entity.TableColumns;
import tk.mybatis.mapper.entity.Example;

import java.io.IOException;
import java.util.List;

/**
 * Generatecontroller
 * Created by liuqinga on 2017/09/04 10:04:09.
 */
@Controller
@RequestMapping("generate")
public class GenerateController extends BaseController<GenerateDao,Generate> {
    @Autowired
    private GenerateDao generateDao
            ;
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse<Generate> page(@RequestParam(defaultValue = "10") int limit, @RequestParam(defaultValue = "1")int offset, String id, String tabname, String tabdesc, String generated, String begintime, String endtime  ){
            Example example = new Example(Generate.class);
            if(StringUtils.isNotBlank(id)) {
               example.createCriteria().andLike("id", "%" + id + "%");
            }
            if(StringUtils.isNotBlank(tabname)) {
               example.createCriteria().andLike("tabname", "%" + tabname + "%");
            }
            if(StringUtils.isNotBlank(tabdesc)) {
               example.createCriteria().andLike("tabdesc", "%" + tabdesc + "%");
            }
            if(StringUtils.isNotBlank(generated)) {
               example.createCriteria().andLike("generated", "%" + generated + "%");
            }
            if(StringUtils.isNotBlank(begintime)&&StringUtils.isNotBlank(endtime)) {
               example.createCriteria().andBetween("optime",begintime,endtime);
            }
            int count = baseDao.selectCountByExample(example);
        PageHelper.startPage(offset, limit);
        return new TableResultResponse<Generate>(count,baseDao.selectByExample(example));
       }
    //根本表名来查看表字段，添加如果没有备注标识，强制要求添加
    @RequestMapping(value = "/getTableFilds/{id}",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse<TableColumns> getTableFilds(@PathVariable String id){
        List<TableColumns> list=generateDao.selectColumnsByTable(id);
        return new TableResultResponse<TableColumns>(list.size(),list);

    };
    //修改表字段备注
    @RequestMapping(value = "/updateTableColumnComment",method = RequestMethod.PUT)
    @ResponseBody
    /*public ObjectRestResponse  updateTableColumnComment(String tableName,String columnName, String columnComment, String dataType, String characterMaximumLength){
        return new ObjectRestResponse().rel(generateDao.updateTableFildsColumnComment(tableName,columnName,columnComment,dataType,characterMaximumLength));
    };*/
    public ObjectRestResponse  updateTableColumnComment(@RequestBody TableColumns tableColumns){
        return new ObjectRestResponse().rel(generateDao.updateTableFildsColumnComment(tableColumns));
    }
    //代码生成模块
    @RequestMapping(value="/generatecode",method = RequestMethod.POST)
    @ResponseBody
    public ObjectRestResponse generatecode(@RequestBody String tableColumns) throws IOException {
        ObjectMapper objectMapper=new ObjectMapper();
        JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, TableColumns.class);
        List<TableColumns> list = objectMapper.readValue(tableColumns, javaType);
        return generateDao.genarateCode(list);
    }
}