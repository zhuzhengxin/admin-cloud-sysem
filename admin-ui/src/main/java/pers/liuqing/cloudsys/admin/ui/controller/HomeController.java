package pers.liuqing.cloudsys.admin.ui.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-08-06 13:34
 */
@Controller
@RequestMapping("")
public class HomeController {
    @RequestMapping(value = "index",method = RequestMethod.GET)
    public String index(){
        return "index";
    }
    @RequestMapping(value = "about",method = RequestMethod.GET)
    public String about(){
        return "about";
    }
    @RequestMapping(value = "user",method = RequestMethod.GET)
    public String user(){
        return "user/list";
    }
    @RequestMapping(value = "user/edit",method = RequestMethod.GET)
    public String userEdit(){
        return "user/edit";
    }
    @RequestMapping(value = "menu",method = RequestMethod.GET)
    public String menu(){
        return "menu/list";
    }
    @RequestMapping(value = "menu/edit",method = RequestMethod.GET)
    public String menuEdit(){
        return "menu/edit";
    }
    @RequestMapping(value = "group",method = RequestMethod.GET)
    public String group(){
        return "group/list";
    }
    @RequestMapping(value = "group/user",method = RequestMethod.GET)
    public String groupUser(){
        return "group/user";
    }
    @RequestMapping(value = "group/authority",method = RequestMethod.GET)
    public String groupAuthority(){
        return "group/authority";
    }
    @RequestMapping(value = "group/edit",method = RequestMethod.GET)
    public String groupEdit(){
        return "group/edit";
    }
    @RequestMapping(value = "groupType",method = RequestMethod.GET)
    public String groupType(){
        return "groupType/list";
    }
    @RequestMapping(value = "groupType/edit",method = RequestMethod.GET)
    public String groupTypeEdit(){
        return "groupType/edit";
    }
    @RequestMapping(value="element/edit",method = RequestMethod.GET)
    public String elementEdit(){
        return "element/edit";
    }
    @RequestMapping(value = "gateClient",method = RequestMethod.GET)
    public String gateClient(){
        return "gateClient/list";
    }
    @RequestMapping(value = "gateClient/edit",method = RequestMethod.GET)
    public String gateClientEdit(){
        return "gateClient/edit";
    }
    @RequestMapping(value = "gateClient/authority",method = RequestMethod.GET)
    public String gateClientAuthority(){
        return "gateClient/authority";
    }
    @RequestMapping(value = "gateLog",method = RequestMethod.GET)
    public String gateLog(){
        return "gateLog/list";
    }
    @RequestMapping(value = "service",method = RequestMethod.GET)
    public String service(){return "service/list";}
    @RequestMapping(value = "test",method = RequestMethod.GET)
    public String test(){
        return "test/list";
    }
    @RequestMapping(value = "test/edit",method = RequestMethod.GET)
    public String testEdit(){
        return "test/edit";
    }
    @RequestMapping(value = "generate",method = RequestMethod.GET)
    public String generate(){return "generate/list";}
    @RequestMapping(value = "generate/edit",method = RequestMethod.GET)
    public String generateEdit(){return "generate/edit";}
    @RequestMapping(value = "agent",method = RequestMethod.GET)
    public String agent(){return "c/list";}
    @RequestMapping(value = "agent/edit",method = RequestMethod.GET)
    public String agentEdit(){return "agent/edit";}
    @RequestMapping(value = "custaddr",method = RequestMethod.GET)
    public String custaddr(){return "custaddr/list";}
    @RequestMapping(value = "custaddr/edit",method = RequestMethod.GET)
    public String custaddrEdit(){return "custaddr/edit";}
    @RequestMapping(value = "main",method = RequestMethod.GET)
    public String main(){return "main";}
    @RequestMapping(value = "login",method = RequestMethod.GET)
    public String login(){return "login";}
    @RequestMapping(value = "generate/column_list/{id}",method = RequestMethod.GET)
    public String column_list(@PathVariable String id){return "generate/column_list";}
    @RequestMapping(value = "linkman",method = RequestMethod.GET)
    public String linkman(){return "linkman/list";}
    @RequestMapping(value = "linkman/edit",method = RequestMethod.GET)
    public String linkmanEdit(){return "linkman/edit";}
    @RequestMapping(value = "contractinfo",method = RequestMethod.GET)
    public String contractinfo(){return "contractinfo/list";}
    @RequestMapping(value = "contractinfo/edit",method = RequestMethod.GET)
    public String contractinfoEdit(){return "contractinfo/edit";}
    @RequestMapping(value = "groupmsg",method = RequestMethod.GET)
    public String groupmsg(){return "groupmsg/list";}
    @RequestMapping(value = "groupmsg/edit",method = RequestMethod.GET)
    public String groupmsgEdit(){return "groupmsg/edit";}
}
