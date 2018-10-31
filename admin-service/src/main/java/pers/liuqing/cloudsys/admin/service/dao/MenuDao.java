package pers.liuqing.cloudsys.admin.service.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.liuqing.cloudsys.admin.common.dao.BaseDao;
import pers.liuqing.cloudsys.admin.service.constant.CommonConstant;
import pers.liuqing.cloudsys.admin.service.entity.Element;
import pers.liuqing.cloudsys.admin.service.entity.Menu;
import pers.liuqing.cloudsys.admin.service.entity.ResourceAuthority;
import pers.liuqing.cloudsys.admin.service.mapper.MenuMapper;

import java.util.Date;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-12 8:48
 */
@Service
public class MenuDao extends BaseDao<MenuMapper,Menu> {
    @Autowired
    ElementDao elementDao;
    @Autowired
    ResourceAuthorityDao resourceAuthorityDao;
    @Override
    public void insertSelective(Menu entity) {
        if(CommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Menu parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.insertSelective(entity);
        entity=super.selectOne(entity);
        //菜单插入权限表
        ResourceAuthority resourceAuthority=new ResourceAuthority();
        resourceAuthority.setResourceType("menu");
        resourceAuthority.setResourceId(entity.getId().toString());
        resourceAuthority.setAuthorityType("group");
        resourceAuthority.setParentId("-1");
        resourceAuthority.setAuthorityId("1");
        resourceAuthorityDao.insertSelective(resourceAuthority);
        //后台先添加增删改查权限
        if (entity.getHref()!=null&&!"".equals(entity.getHref())) {
            //插入元素表
            Element element = new Element();
            element.setCode(entity.getCode() + ":view");
            element.setType("uri");
            element.setName("查看");
            element.setUri(entity.getHref().replace("admin","back"));
            element.setMenuId(entity.getId().toString());
            element.setMethod("GET");
            element.setCrtTime(new Date());
            element.setCrtUser(entity.getCrtUser());
            element.setCrtName(entity.getCrtName());
            elementDao.insertSelective(element);
            //插入权限表
            Element element1=elementDao.getElementByCode(element.getCode());
            resourceAuthority=new ResourceAuthority();
            resourceAuthority.setResourceType("button");
            resourceAuthority.setResourceId(element1.getId().toString());
            resourceAuthority.setAuthorityType("group");
            resourceAuthority.setParentId("-1");
            resourceAuthority.setAuthorityId("1");
            resourceAuthorityDao.insertSelective(resourceAuthority);

            element = new Element();
            element.setCode(entity.getCode() + ":btn_add");
            element.setType("button");
            element.setName("新增");
            element.setUri(entity.getHref().replace("admin","back"));
            element.setMenuId(entity.getId().toString());
            element.setMethod("POST");
            element.setCrtTime(new Date());
            element.setCrtUser(entity.getCrtUser());
            element.setCrtName(entity.getCrtName());
            elementDao.insertSelective(element);

            //插入权限表
            element1=elementDao.getElementByCode(element.getCode());
            resourceAuthority=new ResourceAuthority();
            resourceAuthority.setResourceType("button");
            resourceAuthority.setResourceId(element1.getId().toString());
            resourceAuthority.setAuthorityType("group");
            resourceAuthority.setParentId("-1");
            resourceAuthority.setAuthorityId("1");
            resourceAuthorityDao.insertSelective(resourceAuthority);

            element = new Element();
            element.setCode(entity.getCode() + ":btn_edit");
            element.setType("button");
            element.setName("编辑");
            element.setUri(entity.getHref().replace("admin","back"));
            element.setMenuId(entity.getId().toString());
            element.setMethod("PUT");
            element.setCrtTime(new Date());
            element.setCrtUser(entity.getCrtUser());
            element.setCrtName(entity.getCrtName());
            elementDao.insertSelective(element);

            //插入权限表
            element1=elementDao.getElementByCode(element.getCode());
            resourceAuthority=new ResourceAuthority();
            resourceAuthority.setResourceType("button");
            resourceAuthority.setResourceId(element1.getId().toString());
            resourceAuthority.setAuthorityType("group");
            resourceAuthority.setParentId("-1");
            resourceAuthority.setAuthorityId("1");
            resourceAuthorityDao.insertSelective(resourceAuthority);

            element = new Element();
            element.setCode(entity.getCode() + ":btn_del");
            element.setType("button");
            element.setName("删除");
            element.setUri(entity.getHref().replace("admin","back"));
            element.setMenuId(entity.getId().toString());
            element.setMethod("DELETE");
            element.setCrtTime(new Date());
            element.setCrtUser(entity.getCrtUser());
            element.setCrtName(entity.getCrtName());
            elementDao.insertSelective(element);

            //插入权限表
            element1=elementDao.getElementByCode(element.getCode());
            resourceAuthority=new ResourceAuthority();
            resourceAuthority.setResourceType("button");
            resourceAuthority.setResourceId(element1.getId().toString());
            resourceAuthority.setAuthorityType("group");
            resourceAuthority.setParentId("-1");
            resourceAuthority.setAuthorityId("1");
            resourceAuthorityDao.insertSelective(resourceAuthority);

        }
    }

    @Override
    public void updateById(Menu entity) {
        if(CommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Menu parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.updateById(entity);
    }
    /**
     * 获取用户可以访问的菜单
     * @param id
     * @return
     */
    public List<Menu> getUserAuthorityMenuByUserId(int id){
        return mapper.selectAuthorityMenuByUserId(id);
    }

    /**
     * 根据用户获取可以访问的系统
     * @param id
     * @return
     */
    public List<Menu> getUserAuthoritySystemByUserId(int id){
        return mapper.selectAuthoritySystemByUserId(id);
    }
}
