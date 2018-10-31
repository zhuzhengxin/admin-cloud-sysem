package pers.liuqing.cloudsys.admin.service.dao;

import org.springframework.stereotype.Service;
import pers.liuqing.cloudsys.admin.common.dao.BaseDao;
import pers.liuqing.cloudsys.admin.service.entity.GateLog;
import pers.liuqing.cloudsys.admin.service.mapper.GateLogMapper;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-07-01 14:36
 */
@Service
public class GateLogDao extends BaseDao<GateLogMapper,GateLog> {

    @Override
    public void insert(GateLog entity) {
        mapper.insert(entity);
    }

    @Override
    public void insertSelective(GateLog entity) {
        mapper.insertSelective(entity);
    }
}
