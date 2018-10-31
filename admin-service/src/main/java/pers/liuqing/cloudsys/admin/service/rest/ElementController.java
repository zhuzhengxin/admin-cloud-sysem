package pers.liuqing.cloudsys.admin.service.rest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pers.liuqing.cloudsys.admin.common.msg.ObjectRestResponse;
import pers.liuqing.cloudsys.admin.common.msg.TableResultResponse;
import pers.liuqing.cloudsys.admin.common.rest.BaseController;
import pers.liuqing.cloudsys.admin.service.dao.ElementDao;
import pers.liuqing.cloudsys.admin.service.dao.UserDao;
import pers.liuqing.cloudsys.admin.service.entity.Element;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-23 20:30
 */
@Controller
@RequestMapping("element")
public class ElementController extends BaseController<ElementDao, Element> {
  @Autowired
  private UserDao userDao;

  @RequestMapping(value = "/page", method = RequestMethod.GET)
  @ResponseBody
  public TableResultResponse<Element> page(@RequestParam(defaultValue = "10") int limit,
                                           @RequestParam(defaultValue = "1") int offset, String name, @RequestParam(defaultValue = "0") int menuId) {
    Example example = new Example(Element.class);
    Example.Criteria criteria = example.createCriteria();
    criteria.andEqualTo("menuId", menuId);
    if(StringUtils.isNotBlank(name)){
      criteria.andLike("name", "%" + name + "%");
    }
    List<Element> elements = baseDao.selectByExample(example);
    return new TableResultResponse<Element>(elements.size(), elements);
  }

  @RequestMapping(value = "/user", method = RequestMethod.GET)
  @ResponseBody
  public ObjectRestResponse<Element> getAuthorityElement(String menuId) {
    int userId = userDao.getUserByUsername(getCurrentUserName()).getId();
    List<Element> elements = baseDao.getAuthorityElementByUserId(userId + "",menuId);
    return new ObjectRestResponse<List<Element>>().rel(true).result(elements);
  }

  @RequestMapping(value = "/user/menu", method = RequestMethod.GET)
  @ResponseBody
  public ObjectRestResponse<Element> getAuthorityElement() {
    int userId = userDao.getUserByUsername(getCurrentUserName()).getId();
    List<Element> elements = baseDao.getAuthorityElementByUserId(userId + "");
    return new ObjectRestResponse<List<Element>>().rel(true).result(elements);
  }
}
