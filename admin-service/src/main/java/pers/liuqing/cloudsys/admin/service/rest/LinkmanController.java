package pers.liuqing.cloudsys.admin.service.rest;

import com.github.pagehelper.PageHelper;
import pers.liuqing.cloudsys.admin.service.dao.LinkmanDao;
import pers.liuqing.cloudsys.admin.service.entity.Linkman;
import pers.liuqing.cloudsys.admin.common.msg.TableResultResponse2;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.common.msg.ListRestResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

/**
 * Linkmancontroller
 * Created by liuqinga on 2018/10/26 22:01:15.
 */
@Controller
@RequestMapping("linkman")
public class LinkmanController extends BaseController<LinkmanDao,Linkman> {
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse2<Linkman> page(@RequestParam(defaultValue = "10") int limit,@RequestParam(defaultValue = "1")int offset,    String name,    String optime,    String born,    String phone,   String id){
            Example example = new Example(Linkman.class);
                                                                                                {
            if(StringUtils.isNotBlank(name)) {
            example.createCriteria().andEqualTo("name",name);
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(optime)) {
            example.createCriteria().andEqualTo("optime",optime);
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(born)) {
            example.createCriteria().andEqualTo("born",born);
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(phone)) {
            example.createCriteria().andEqualTo("phone",phone);
            }
            }
                                                            int count = baseDao.selectCountByExample(example);
            PageHelper.startPage(offset, limit);
            return new TableResultResponse2<Linkman>(count,0,"",baseDao.selectByExample(example));
       }
}