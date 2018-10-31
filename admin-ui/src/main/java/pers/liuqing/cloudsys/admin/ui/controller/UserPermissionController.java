package pers.liuqing.cloudsys.admin.ui.controller;

import pers.liuqing.cloudsys.admin.ui.rpc.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Base64Utils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-27 12:40
 */
@RestController
public class UserPermissionController {
    @Autowired
    private IUserService userService;
    @Autowired
    private HttpServletRequest request;
    @RequestMapping(value = "/user/system",method = RequestMethod.GET)
    @ResponseBody
    public String getUserSystem(){
       return userService.getSystemsByUsername(getCurrentUserName());
    }
    @RequestMapping(value = "/user/menu",method = RequestMethod.GET)
    @ResponseBody
    public String getUserMenu(@RequestParam(defaultValue = "-1") Integer parentId){
        System.out.println("aaaaaaaaaaaaaaaaa");
        return userService.getMenusByUsername(getCurrentUserName(),parentId);
    }
    @RequestMapping(value = "/user/getCurrentUser",method = RequestMethod.GET)
    @ResponseBody
    public String getCurrentUser(){
        return getCurrentUserName();
    }
    public String getCurrentUserName(){
        String authorization = request.getHeader("Authorization");
        System.out.println(authorization);
        System.out.println(Base64Utils.decodeFromString(authorization));
        return new String(Base64Utils.decodeFromString(authorization));
    }
}
