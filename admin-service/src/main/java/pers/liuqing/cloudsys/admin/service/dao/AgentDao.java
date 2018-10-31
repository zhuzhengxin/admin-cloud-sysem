package pers.liuqing.cloudsys.admin.service.dao;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pers.liuqing.cloudsys.admin.common.dao.BaseDao;
import pers.liuqing.cloudsys.admin.service.entity.Agent;
import pers.liuqing.cloudsys.admin.service.mapper.AgentMapper;

/**
 * AgentBiz
 * Created by liuqinga on 2017/09/04 19:49:27.
 */
@Service
@Transactional
public class AgentDao extends BaseDao<AgentMapper,Agent> {

}