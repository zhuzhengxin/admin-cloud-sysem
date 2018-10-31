package pers.liuqing.cloudsys.admin.service.rest;

import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.liuqing.cloudsys.admin.common.msg.TableResultResponse2;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.service.dao.CustaddrDao;
import pers.liuqing.cloudsys.admin.service.entity.Custaddr;
import tk.mybatis.mapper.entity.Example;

/**
 * Custaddrcontroller
 * Created by liuqinga on 2017/09/07 19:56:07.
 */
@Controller
@RequestMapping("custaddr")
public class CustaddrController extends BaseController<CustaddrDao,Custaddr> {
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse2<Custaddr> page(@RequestParam(defaultValue = "10") int limit, @RequestParam(defaultValue = "1")int offset, String id, String name, String addr  ){
        Example example = new Example(Custaddr.class);
                if(StringUtils.isNotBlank(id)) {
        example.createCriteria().andLike("id", "%" + id + "%");
        }
                if(StringUtils.isNotBlank(name)) {
        example.createCriteria().andLike("name", "%" + name + "%");
        }
                if(StringUtils.isNotBlank(addr)) {
        example.createCriteria().andLike("addr", "%" + addr + "%");
        }
                int count = baseDao.selectCountByExample(example);
        PageHelper.startPage(offset, limit);
        return new TableResultResponse2<Custaddr>(count,0,"",baseDao.selectByExample(example));
       }
}