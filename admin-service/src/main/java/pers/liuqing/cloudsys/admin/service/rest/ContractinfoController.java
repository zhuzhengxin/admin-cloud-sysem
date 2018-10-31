package pers.liuqing.cloudsys.admin.service.rest;

import com.github.pagehelper.PageHelper;
import pers.liuqing.cloudsys.admin.service.dao.ContractinfoDao;
import pers.liuqing.cloudsys.admin.service.entity.Contractinfo;
import pers.liuqing.cloudsys.admin.common.msg.TableResultResponse2;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.common.msg.ListRestResponse;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import tk.mybatis.mapper.entity.Example;

/**
 * Contractinfocontroller
 * Created by liuqinga on 2018/10/26 22:01:48.
 */
@Controller
@RequestMapping("contractinfo")
public class ContractinfoController extends BaseController<ContractinfoDao,Contractinfo> {
    @RequestMapping(value = "/page",method = RequestMethod.GET)
    @ResponseBody
    public TableResultResponse2<Contractinfo> page(@RequestParam(defaultValue = "10") int limit,@RequestParam(defaultValue = "1")int offset,    String contractNo,    String contractName,   String id){
            Example example = new Example(Contractinfo.class);
                                                                                                {
            if(StringUtils.isNotBlank(contractNo)) {
            example.createCriteria().andEqualTo("contractNo",contractNo);
            }
            }
                                                                        {
            if(StringUtils.isNotBlank(contractName)) {
            example.createCriteria().andEqualTo("contractName",contractName);
            }
            }
                                                            int count = baseDao.selectCountByExample(example);
            PageHelper.startPage(offset, limit);
            return new TableResultResponse2<Contractinfo>(count,0,"",baseDao.selectByExample(example));
       }
}