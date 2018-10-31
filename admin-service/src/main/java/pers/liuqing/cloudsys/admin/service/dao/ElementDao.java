package pers.liuqing.cloudsys.admin.service.dao;

import pers.liuqing.cloudsys.admin.common.dao.BaseDao;
import pers.liuqing.cloudsys.admin.service.entity.Element;
import pers.liuqing.cloudsys.admin.service.mapper.ElementMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-23 20:27
 */
@Service
public class ElementDao extends BaseDao<ElementMapper,Element> {
    public List<Element> getAuthorityElementByUserId(String userId){
        return mapper.selectAuthorityElementByUserId(userId);
    }
    public List<Element> getAuthorityElementByUserId(String userId,String menuId){
        return mapper.selectAuthorityMenuElementByUserId(userId,menuId);
    }
    public Element getElementByCode(String code){
        return  mapper.selectElementByCode(code);
    }
}
