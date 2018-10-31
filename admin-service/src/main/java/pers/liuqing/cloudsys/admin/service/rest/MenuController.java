package pers.liuqing.cloudsys.admin.service.rest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.common.util.TreeUtil;
import pers.liuqing.cloudsys.admin.service.constant.CommonConstant;
import pers.liuqing.cloudsys.admin.service.dao.MenuDao;
import pers.liuqing.cloudsys.admin.service.dao.UserDao;
import pers.liuqing.cloudsys.admin.service.entity.Menu;
import pers.liuqing.cloudsys.admin.service.vo.AuthorityMenuTree;
import pers.liuqing.cloudsys.admin.service.vo.MenuTree;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-12 8:49
 */
@Controller
@RequestMapping("menu")
public class MenuController extends BaseController<MenuDao, Menu> {
    @Autowired
    private UserDao userDao;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> list(String title) {
        Example example = new Example(Menu.class);
        if (StringUtils.isNotBlank(title))
            example.createCriteria().andLike("title", "%" + title + "%");
        return baseDao.selectByExample(example);
    }

    @RequestMapping(value = "/system", method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> getSystem() {
        Menu menu = new Menu();
        menu.setParentId(CommonConstant.ROOT);
        return baseDao.selectList(menu);
    }

    @RequestMapping(value = "/menuTree", method = RequestMethod.GET)
    @ResponseBody
    public List<MenuTree> listMenu(Integer parentId) {
        try {
            if (parentId == null) {
                parentId = this.getSystem().get(0).getId();
            }
        } catch (Exception e) {
            return new ArrayList<MenuTree>();
        }
        List<MenuTree> trees = new ArrayList<MenuTree>();
        MenuTree node = null;
        Example example = new Example(Menu.class);
        Menu parent = baseDao.selectById(parentId);
        example.createCriteria().andLike("path", parent.getPath() + "%").andNotEqualTo("id",parent.getId());
        return getMenuTree(baseDao.selectByExample(example), parent.getId());
    }

    @RequestMapping(value = "/authorityTree", method = RequestMethod.GET)
    @ResponseBody
    public List<AuthorityMenuTree> listAuthorityMenu() {
        List<AuthorityMenuTree> trees = new ArrayList<AuthorityMenuTree>();
        AuthorityMenuTree node = null;
        for (Menu menu : baseDao.selectListAll()) {
            node = new AuthorityMenuTree();
            node.setText(menu.getTitle());
            BeanUtils.copyProperties(menu, node);
            trees.add(node);
        }
        return TreeUtil.bulid(trees,CommonConstant.ROOT);
    }

    @RequestMapping(value = "/user/authorityTree", method = RequestMethod.GET)
    @ResponseBody
    public List<MenuTree> listUserAuthorityMenu(Integer parentId){
        int userId = userDao.getUserByUsername(getCurrentUserName()).getId();
        try {
            if (parentId == null) {
                parentId = this.getSystem().get(0).getId();
            }
        } catch (Exception e) {
            return new ArrayList<MenuTree>();
        }
        return getMenuTree(baseDao.getUserAuthorityMenuByUserId(userId),parentId);
    }

    @RequestMapping(value = "/user/system", method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> listUserAuthoritySystem() {
        int userId = userDao.getUserByUsername(getCurrentUserName()).getId();
        return baseDao.getUserAuthoritySystemByUserId(userId);
    }

    private List<MenuTree> getMenuTree(List<Menu> menus,int root) {
        List<MenuTree> trees = new ArrayList<MenuTree>();
        MenuTree node = null;
        for (Menu menu : menus) {
            node = new MenuTree();
            BeanUtils.copyProperties(menu, node);
            trees.add(node);
        }
        return TreeUtil.bulid(trees,root) ;
    }
    //取得快捷方式的菜单
    @RequestMapping(value = "/getShortCutList", method = RequestMethod.GET)
    @ResponseBody
    public List<Menu> getShortCutList() {
        Example example = new Example(Menu.class);
        example.createCriteria().andEqualTo("attr1", "Y");
        return baseDao.selectByExample(example);
    }

}
