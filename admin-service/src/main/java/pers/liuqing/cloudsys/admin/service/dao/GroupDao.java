package pers.liuqing.cloudsys.admin.service.dao;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import pers.liuqing.cloudsys.admin.common.dao.BaseDao;
import pers.liuqing.cloudsys.admin.service.constant.CommonConstant;
import pers.liuqing.cloudsys.admin.service.entity.Group;
import pers.liuqing.cloudsys.admin.service.entity.Menu;
import pers.liuqing.cloudsys.admin.service.entity.ResourceAuthority;
import pers.liuqing.cloudsys.admin.service.mapper.GroupMapper;
import pers.liuqing.cloudsys.admin.service.mapper.MenuMapper;
import pers.liuqing.cloudsys.admin.service.mapper.ResourceAuthorityMapper;
import pers.liuqing.cloudsys.admin.service.mapper.UserMapper;
import pers.liuqing.cloudsys.admin.service.vo.AuthorityMenuTree;
import pers.liuqing.cloudsys.admin.service.vo.GroupUsers;

import java.util.ArrayList;
import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-12 8:48
 */
@Service
public class GroupDao extends BaseDao<GroupMapper,Group> {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private ResourceAuthorityMapper resourceAuthorityMapper;
    @Autowired
    private MenuMapper menuMapper;
    @Override
    public void insertSelective(Group entity) {
        if(CommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Group parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.insertSelective(entity);
    }

    @Override
    public void updateById(Group entity) {
        if(CommonConstant.ROOT == entity.getParentId()){
            entity.setPath("/"+entity.getCode());
        }else{
            Group parent = this.selectById(entity.getParentId());
            entity.setPath(parent.getPath()+"/"+entity.getCode());
        }
        super.updateById(entity);
    }

    /**
     * 获取群组关联用户
     * @param groupId
     * @return
     */
    public GroupUsers getGroupUsers(int groupId) {
        return new GroupUsers(userMapper.selectMemberByGroupId(groupId),userMapper.selectLeaderByGroupId(groupId));
    }

    /**
     * 变更群主所分配用户
     * @param groupId
     * @param members
     * @param leaders
     */
    public void modifyGroupUsers(int groupId, String members, String leaders){
        mapper.deleteGroupLeadersById(groupId);
        mapper.deleteGroupMembersById(groupId);
        if(!StringUtils.isEmpty(members)){
            String[] mem = members.split(",");
            for(String m:mem){
                mapper.insertGroupMembersById(groupId,Integer.parseInt(m));
            }
        }
        if(!StringUtils.isEmpty(leaders)){
            String[] mem = leaders.split(",");
            for(String m:mem){
                mapper.insertGroupLeadersById(groupId,Integer.parseInt(m));
            }
        }
    }

    /**
     * 变更群组关联的菜单
     * @param groupId
     * @param menuTrees
     */
    public void modifyAuthorityMenu(int groupId, List<AuthorityMenuTree> menuTrees){
        resourceAuthorityMapper.deleteByAuthorityIdAndResourceType(groupId+"",CommonConstant.RESOURCE_TYPE_MENU);
        ResourceAuthority authority = null;
        for(AuthorityMenuTree menuTree:menuTrees){
            authority = new ResourceAuthority(CommonConstant.AUTHORITY_TYPE_GROUP,CommonConstant.RESOURCE_TYPE_MENU);
            authority.setAuthorityId(groupId+"");
            authority.setResourceId(menuTree.getId()+"");
            authority.setParentId("-1");
            resourceAuthorityMapper.insertSelective(authority);
        }
    }

    /**
     * 分配资源权限
     * @param groupId
     * @param menuId
     * @param elementId
     */
    public void modifyAuthorityElement(int groupId,int menuId,int elementId){
        ResourceAuthority authority = new ResourceAuthority(CommonConstant.AUTHORITY_TYPE_GROUP,CommonConstant.RESOURCE_TYPE_BTN);
        authority.setAuthorityId(groupId + "");
        authority.setResourceId(elementId + "");
        authority.setParentId("-1");
        resourceAuthorityMapper.insertSelective(authority);
    }

    /**
     * 移除资源权限
     * @param groupId
     * @param menuId
     * @param elementId
     */
    public void removeAuthorityElement(int groupId, int menuId, int elementId) {
        ResourceAuthority authority = new ResourceAuthority();
        authority.setAuthorityId(groupId+"");
        authority.setResourceId(elementId + "");
        authority.setParentId("-1");
        resourceAuthorityMapper.delete(authority);
    }


    /**
     * 获取群主关联的菜单
     * @param groupId
     * @return
     */
    public List<AuthorityMenuTree> getAuthorityMenu(int groupId){
        List<Menu> menus = menuMapper.selectMenuByAuthorityId(String.valueOf(groupId), CommonConstant.AUTHORITY_TYPE_GROUP);
        List<AuthorityMenuTree> trees = new ArrayList<AuthorityMenuTree>();
        AuthorityMenuTree node = null;
        for (Menu menu : menus) {
            node = new AuthorityMenuTree();
            node.setText(menu.getTitle());
            BeanUtils.copyProperties(menu, node);
            trees.add(node);
        }
        return trees;
    }


    public List<Integer> getAuthorityElement(int groupId) {
        ResourceAuthority authority = new ResourceAuthority(CommonConstant.AUTHORITY_TYPE_GROUP,CommonConstant.RESOURCE_TYPE_BTN);
        authority.setAuthorityId(groupId+"");
        List<ResourceAuthority> authorities = resourceAuthorityMapper.select(authority);
        List<Integer> ids = new ArrayList<Integer>();
        for(ResourceAuthority auth:authorities){
            ids.add(Integer.parseInt(auth.getResourceId()));
        }
        return ids;
    }
}
