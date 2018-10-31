package pers.liuqing.cloudsys.admin.service.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pers.liuqing.cloudsys.admin.common.constant.UserConstant;
import pers.liuqing.cloudsys.admin.common.dao.BaseDao;
import pers.liuqing.cloudsys.admin.service.entity.User;
import pers.liuqing.cloudsys.admin.service.mapper.MenuMapper;
import pers.liuqing.cloudsys.admin.service.mapper.UserMapper;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-08 16:23
 */
@Service
public class UserDao extends BaseDao<UserMapper,User> {

    @Autowired
    private MenuMapper menuMapper;
    @Override
    public void insertSelective(User entity) {
        String password = new BCryptPasswordEncoder(UserConstant.PW_ENCORDER_SALT).encode(entity.getPassword());
        entity.setPassword(password);
        super.insertSelective(entity);
    }

    @Override
    public void updateById(User entity) {
        String password = new BCryptPasswordEncoder(UserConstant.PW_ENCORDER_SALT).encode(entity.getPassword());
        entity.setPassword(password);
        super.updateById(entity);
    }

    /**
     * 根据用户名获取用户信息
     * @param username
     * @return
     */
    public User getUserByUsername(String username){
        User user = new User();
        user.setUsername(username);
        return mapper.selectOne(user);
    }

    /**
     * 获取spring security中的实际用户ID
     * @param securityContextImpl
     * @return
     */
/*    public int getSecurityUserId(SecurityContextImpl securityContextImpl) {
        org.springframework.security.core.userdetails.User securityUser = (org.springframework.security.core.userdetails.User) securityContextImpl.getAuthentication().getPrincipal();
        return this.getUserByUsername(securityUser.getUsername()).getId();
    }*/
}
