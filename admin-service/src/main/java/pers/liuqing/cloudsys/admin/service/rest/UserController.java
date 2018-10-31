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
import pers.liuqing.cloudsys.admin.service.dao.UserDao;
import pers.liuqing.cloudsys.admin.service.entity.User;
import tk.mybatis.mapper.entity.Example;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-08 11:51
 */
@Controller
@RequestMapping("user")
public class UserController extends BaseController<UserDao,User> {

    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse<User> page(@RequestParam(defaultValue = "10") int limit, @RequestParam(defaultValue = "1")int offset, String name){
        Example example = new Example(User.class);
        if(StringUtils.isNotBlank(name)) {
            example.createCriteria().andLike("name", "%" + name + "%");
            example.createCriteria().andLike("username", "%" + name + "%");
        }
        int count = baseDao.selectCountByExample(example);
        PageHelper.startPage(offset, limit);
        return new TableResultResponse<User>(count,baseDao.selectByExample(example));
    }


}
