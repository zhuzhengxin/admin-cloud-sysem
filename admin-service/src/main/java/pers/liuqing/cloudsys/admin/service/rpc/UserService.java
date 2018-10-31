package pers.liuqing.cloudsys.admin.service.rpc;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.liuqing.cloudsys.admin.api.vo.authority.PermissionInfo;
import pers.liuqing.cloudsys.admin.api.vo.user.UserInfo;
import pers.liuqing.cloudsys.admin.common.util.TreeUtil;
import pers.liuqing.cloudsys.admin.service.constant.CommonConstant;
import pers.liuqing.cloudsys.admin.service.dao.ElementDao;
import pers.liuqing.cloudsys.admin.service.dao.MenuDao;
import pers.liuqing.cloudsys.admin.service.dao.UserDao;
import pers.liuqing.cloudsys.admin.service.entity.Element;
import pers.liuqing.cloudsys.admin.service.entity.Menu;
import pers.liuqing.cloudsys.admin.service.entity.User;
import pers.liuqing.cloudsys.admin.service.vo.MenuTree;

import java.util.ArrayList;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-21 8:15
 */
@Controller
@RequestMapping("api")
public class UserService {
    @Autowired
    private UserDao userDao;
    @Autowired
    private MenuDao menuDao;
    @Autowired
    private ElementDao elementDao;

    @RequestMapping(value = "/user/username/{username}",method = RequestMethod.GET, produces="application/json")
    public  @ResponseBody UserInfo getUserByUsername(@PathVariable("username")String username) {
        UserInfo info = new UserInfo();
        User user = userDao.getUserByUsername(username);
        if(user!=null) {
            BeanUtils.copyProperties(user, info);
            info.setId(user.getId().toString());
        }
        return info;
    }

    @RequestMapping(value = "/user/un/{username}/permissions", method = RequestMethod.GET)
    public @ResponseBody List<PermissionInfo> getPermissionByUsername(@PathVariable("username") String username){
        User user = userDao.getUserByUsername(username);
        List<Menu> menus = menuDao.getUserAuthorityMenuByUserId(user.getId());
        List<PermissionInfo> result = new ArrayList<PermissionInfo>();
        PermissionInfo info = null;
        for(Menu menu:menus){
            if(StringUtils.isBlank(menu.getHref()))
                continue;
            info = new PermissionInfo();
            info.setCode(menu.getCode());
            info.setType(CommonConstant.RESOURCE_TYPE_MENU);
            info.setName(CommonConstant.RESOURCE_ACTION_VISIT);
            String uri = menu.getHref();
            if(!uri.startsWith("/"))
                uri = "/"+uri;
            info.setUri(uri);
            info.setMethod(CommonConstant.RESOURCE_REQUEST_METHOD_GET);
            result.add(info
            );
            info.setMenu(menu.getTitle());

        }
        List<Element> elements = elementDao.getAuthorityElementByUserId(user.getId()+"");
        for(Element element:elements){
            info = new PermissionInfo();
            info.setCode(element.getCode());
            info.setType(element.getType());
            info.setUri(element.getUri());
            info.setMethod(element.getMethod());
            info.setName(element.getName());
            info.setMenu(element.getMenuId());
            result.add(info);
        }
        return result;
    }
    @RequestMapping(value = "/user/un/{username}/system", method = RequestMethod.GET)
    @ResponseBody
    public String getSystemsByUsername(@PathVariable("username") String username){
        int userId = userDao.getUserByUsername(username).getId();
        return JSONObject.toJSONString(menuDao.getUserAuthoritySystemByUserId(userId));
    }
    @RequestMapping(value = "/user/un/{username}/menu/parent/{parentId}", method = RequestMethod.GET)
    @ResponseBody
    public String getMenusByUsername(@PathVariable("username") String username,@PathVariable("parentId")Integer parentId){
        int userId = userDao.getUserByUsername(username).getId();
        try {
            if (parentId == null||parentId<0) {
                parentId = menuDao.getUserAuthoritySystemByUserId(userId).get(0).getId();
            }
        } catch (Exception e) {
            return JSONObject.toJSONString(new ArrayList<MenuTree>());
        }
        return JSONObject.toJSONString(getMenuTree(menuDao.getUserAuthorityMenuByUserId(userId), parentId));
    }

    private List<MenuTree> getMenuTree(List<Menu> menus,int root) {
        List<MenuTree> trees = new ArrayList<MenuTree>();
        MenuTree node = null;
        for (Menu menu : menus) {
            node = new MenuTree();
            BeanUtils.copyProperties(menu, node);
            trees.add(node);
        }
        return TreeUtil.bulid(trees, root) ;
    }
}
