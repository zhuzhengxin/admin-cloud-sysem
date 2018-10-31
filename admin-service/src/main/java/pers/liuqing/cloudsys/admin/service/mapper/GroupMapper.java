package pers.liuqing.cloudsys.admin.service.mapper;

import org.apache.ibatis.annotations.Param;
import pers.liuqing.cloudsys.admin.service.entity.Group;
import tk.mybatis.mapper.common.Mapper;

public interface GroupMapper extends Mapper<Group> {
    public void deleteGroupMembersById(@Param("groupId") int groupId);
    public void deleteGroupLeadersById(@Param("groupId") int groupId);
    public void insertGroupMembersById(@Param("groupId") int groupId, @Param("userId") int userId);
    public void insertGroupLeadersById(@Param("groupId") int groupId, @Param("userId") int userId);
}