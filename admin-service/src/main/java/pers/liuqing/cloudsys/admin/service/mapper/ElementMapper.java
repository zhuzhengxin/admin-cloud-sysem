package pers.liuqing.cloudsys.admin.service.mapper;

import org.apache.ibatis.annotations.Param;
import pers.liuqing.cloudsys.admin.service.entity.Element;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface ElementMapper extends Mapper<Element> {
    public List<Element> selectAuthorityElementByUserId(@Param("userId") String userId);
    public List<Element> selectAuthorityMenuElementByUserId(@Param("userId") String userId, @Param("menuId") String menuId);
    public List<Element> selectAuthorityElementByClientId(@Param("clientId") String clientId);
    public Element selectElementByCode(@Param("code")String code);
}