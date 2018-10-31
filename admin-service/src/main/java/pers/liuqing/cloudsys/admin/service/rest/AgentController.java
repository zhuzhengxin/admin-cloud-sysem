package pers.liuqing.cloudsys.admin.service.rest;

import com.github.pagehelper.PageHelper;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.liuqing.cloudsys.admin.common.msg.TableResultResponse;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.service.dao.AgentDao;
import pers.liuqing.cloudsys.admin.service.entity.Agent;
import tk.mybatis.mapper.entity.Example;

/**
 * Agentcontroller
 * Created by liuqinga on 2017/09/04 19:49:27.
 */
@Controller
@RequestMapping("agent")
public class AgentController extends BaseController<AgentDao,Agent> {
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse<Agent> page(@RequestParam(defaultValue = "10") int limit, @RequestParam(defaultValue = "1")int offset, String id, String name, String address  ){
        Example example = new Example(Agent.class);
                if(StringUtils.isNotBlank(id)) {
        example.createCriteria().andLike("id", "%" + id + "%");
        }
                if(StringUtils.isNotBlank(name)) {
        example.createCriteria().andLike("name", "%" + name + "%");
        }
                if(StringUtils.isNotBlank(address)) {
        example.createCriteria().andLike("address", "%" + address + "%");
        }

                int count = baseDao.selectCountByExample(example);
        PageHelper.startPage(offset, limit);
        return new TableResultResponse<Agent>(count,baseDao.selectByExample(example));
       }
}