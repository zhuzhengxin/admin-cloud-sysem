package pers.liuqing.cloudsys.admin.ui.rpc;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pers.liuqing.cloudsys.admin.api.vo.authority.PermissionInfo;
import pers.liuqing.cloudsys.admin.api.vo.user.UserInfo;

import java.util.ArrayList;
import java.util.List;


/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-21 8:11
 */
//因为@RequestMapping("api") 这个配置导致熔断器无法配置
@FeignClient(name = "admin-service",fallback = HystrixClientFallback.class)
//@RequestMapping("api")
public interface IUserService {

  @RequestMapping(value = "/api/user/username/{username}", method = RequestMethod.GET)
  public UserInfo getUserByUsername(@PathVariable("username") String username);
  @RequestMapping(value = "/api/user/un/{username}/permissions", method = RequestMethod.GET)
  public List<PermissionInfo> getPermissionByUserId(@PathVariable("username") String username);
  @RequestMapping(value = "/api/user/un/{username}/system", method = RequestMethod.GET)
  public String getSystemsByUsername(@PathVariable("username") String username);
  @RequestMapping(value = "/api/user/un/{username}/menu/parent/{parentId}", method = RequestMethod.GET)
  public String getMenusByUsername(@PathVariable("username") String username,@PathVariable("parentId") Integer parentId);
}
  @Component
  class HystrixClientFallback implements IUserService {

  @Override
  public UserInfo getUserByUsername(String username) {
    UserInfo userInfo = new UserInfo();
    userInfo.setDescription("getUserByUsername error");
    return userInfo;
  }

  @Override
  public List<PermissionInfo> getPermissionByUserId(String username) {
    List<PermissionInfo> list = new ArrayList<PermissionInfo>();
    return list;
  }

  @Override
  public String getSystemsByUsername( String username) {
    System.out.print("11111111111111111111");
    return "error";
  }

  @Override
  public String getMenusByUsername(String username,Integer parentId) {
    return "getMenusByUsername error";
  }
}



