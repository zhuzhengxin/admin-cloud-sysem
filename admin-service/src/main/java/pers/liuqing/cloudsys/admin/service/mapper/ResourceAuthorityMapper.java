package pers.liuqing.cloudsys.admin.service.mapper;

import org.apache.ibatis.annotations.Param;
import pers.liuqing.cloudsys.admin.service.entity.ResourceAuthority;
import tk.mybatis.mapper.common.Mapper;

public interface ResourceAuthorityMapper extends Mapper<ResourceAuthority> {
    public void deleteByAuthorityIdAndResourceType(@Param("authorityId") String authorityId, @Param("resourceType") String resourceType);
}