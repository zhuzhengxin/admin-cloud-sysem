package pers.liuqing.cloudsys.admin.service.rest;

import com.github.pagehelper.PageHelper;
import pers.liuqing.cloudsys.admin.service.dao.ZhuDao;
import pers.liuqing.cloudsys.admin.service.entity.Zhu;
import pers.liuqing.cloudsys.admin.common.msg.TableResultResponse2;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.common.msg.ListRestResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

/**
 * Zhucontroller
 * Created by liuqinga on 2018/11/09 16:37:24.
 */
@Controller
@RequestMapping("zhu")
public class ZhuController extends BaseController<ZhuDao,Zhu> {
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse2<Zhu> page(@RequestParam(defaultValue = "10") int limit,@RequestParam(defaultValue = "1")int offset,    String name,    String age,    String six,   String id){
            Example example = new Example(Zhu.class);
                                                                                                {
            if(StringUtils.isNotBlank(name)) {
            example.createCriteria().andEqualTo("name",name);
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(age)) {
            example.createCriteria().andEqualTo("age",age);
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(six)) {
            example.createCriteria().andEqualTo("six",six);
            }
            }
                                                            int count = baseDao.selectCountByExample(example);
            PageHelper.startPage(offset, limit);
            return new TableResultResponse2<Zhu>(count,0,"",baseDao.selectByExample(example));
       }
}