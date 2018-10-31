package pers.liuqing.cloudsys.admin.service.rest;

import com.github.pagehelper.PageHelper;
import pers.liuqing.cloudsys.admin.service.dao.GroupmsgDao;
import pers.liuqing.cloudsys.admin.service.entity.Groupmsg;
import pers.liuqing.cloudsys.admin.common.msg.TableResultResponse2;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.common.msg.ListRestResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

/**
 * Groupmsgcontroller
 * Created by liuqinga on 2018/10/31 10:34:11.
 */
@Controller
@RequestMapping("groupmsg")
public class GroupmsgController extends BaseController<GroupmsgDao,Groupmsg> {
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse2<Groupmsg> page(@RequestParam(defaultValue = "10") int limit,@RequestParam(defaultValue = "1")int offset,    String groupcode,    String groupname,    String classname,    String phone,    String addr,    String born,    String optime,   String id){
            Example example = new Example(Groupmsg.class);
                                                                                                {
            if(StringUtils.isNotBlank(groupcode)) {
            example.createCriteria().andEqualTo("groupcode",groupcode);
            }
            }
                                                            {
            if(StringUtils.isNotBlank(groupname)) {
            example.createCriteria().andLike("groupname", "%" + groupname + "%");
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(classname)) {
            example.createCriteria().andLike("classname", "%" + classname + "%");
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(phone)) {
            example.createCriteria().andLike("phone", "%" + phone + "%");
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(addr)) {
            example.createCriteria().andLike("addr", "%" + addr + "%");
            }
            }
                                                                                                {
                            if(StringUtils.isNotBlank(born)) {
               example.createCriteria().andBetween("born",born.split(" - ")[0],born.split(" - ")[1]);
            }
            }
                                                                        {
                            if(StringUtils.isNotBlank(optime)) {
               example.createCriteria().andBetween("optime",optime.split(" - ")[0],optime.split(" - ")[1]);
            }
            }
                                                int count = baseDao.selectCountByExample(example);
            PageHelper.startPage(offset, limit);
            return new TableResultResponse2<Groupmsg>(count,0,"",baseDao.selectByExample(example));
       }
}