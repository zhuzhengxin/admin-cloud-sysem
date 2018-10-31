package pers.liuqing.cloudsys.admin.service.rpc;

import pers.liuqing.cloudsys.admin.service.dao.GateLogDao;
import pers.liuqing.cloudsys.admin.service.entity.GateLog;
import pers.liuqing.cloudsys.admin.api.vo.log.LogInfo;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-07-01 14:39
 */
@RequestMapping("api")
@Controller
public class LogService {
    @Autowired
    private GateLogDao gateLogDao;
    @RequestMapping(value="/log/save",method = RequestMethod.POST)
    public @ResponseBody void saveLog(@RequestBody LogInfo info){
        GateLog log = new GateLog();
        BeanUtils.copyProperties(info,log);
        gateLogDao.insertSelective(log);
    }
}
