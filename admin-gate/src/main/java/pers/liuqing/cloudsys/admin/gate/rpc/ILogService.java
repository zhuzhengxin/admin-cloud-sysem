package pers.liuqing.cloudsys.admin.gate.rpc;

import pers.liuqing.cloudsys.admin.api.vo.log.LogInfo;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-07-01 15:16
 */
@FeignClient("admin-service")
public interface ILogService {
  @RequestMapping(value="/api/log/save",method = RequestMethod.POST)
  public void saveLog(LogInfo info);
}
