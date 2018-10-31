package pers.liuqing.cloudsys.admin.service.mapper;

import org.apache.ibatis.annotations.Param;
import pers.liuqing.cloudsys.admin.service.entity.User;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<User> {
    public List<User> selectMemberByGroupId(@Param("groupId") int groupId);
    public List<User> selectLeaderByGroupId(@Param("groupId") int groupId);
}