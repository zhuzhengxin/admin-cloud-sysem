package pers.liuqing.cloudsys.admin.gate.rpc;

import pers.liuqing.cloudsys.admin.api.vo.authority.PermissionInfo;
import pers.liuqing.cloudsys.admin.api.vo.user.UserInfo;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-21 8:11
 */
@FeignClient("admin-service")
@RequestMapping("api")
public interface IUserService {
  @RequestMapping(value = "/user/username/{username}", method = RequestMethod.GET)
  public UserInfo getUserByUsername(@PathVariable("username") String username);
  @RequestMapping(value = "/user/un/{username}/permissions", method = RequestMethod.GET)
  public List<PermissionInfo> getPermissionByUsername(@PathVariable("username") String username);
}
