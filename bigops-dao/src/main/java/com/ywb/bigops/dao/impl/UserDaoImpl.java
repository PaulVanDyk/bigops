package com.ywb.bigops.dao.impl;

import com.ywb.bigops.dao.UserDao;
import com.ywb.bigops.dao.mapper.UserMapper;
import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * UserDaoImpl
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public class UserDaoImpl implements UserDao {

    @Resource
    private UserMapper userMapper;

    @Override
    public Boolean insertUser(UserDomain userDomain) {
        return this.userMapper.insertUser(userDomain);
    }

    @Override
    public UserDomain findUserById(Integer id) {
        return this.userMapper.findUserById(id);
    }

    @Override
    public List<UserDomain> findUserListByConditionWithPage(UserCondition condition) {
        return this.userMapper.findUserListByConditionWithPage(condition);
    }

    @Override
    public Integer findUserCountByCondition(UserCondition condition) {
        return this.userMapper.findUserCountByCondition(condition);
    }

    @Override
    public Boolean updateUserById(UserDomain userDomain) {
        return this.userMapper.updateUserById(userDomain);
    }

    @Override
    public Boolean updateUserByIdWithForce(UserDomain userDomain) {
        return this.userMapper.updateUserByIdWithForce(userDomain);
    }

    @Override
    public Boolean updateUserByIds(UserDomain userDomain, List<Integer> ids) {
        Map map = new HashMap();
        map.put("user", userDomain);
        map.put("ids", ids);
        return this.userMapper.updateUserByIds(map);
    }

    @Override
    public Boolean updateUserByIdsWithForce(UserDomain userDomain, List<Integer> ids) {
        Map map = new HashMap();
        map.put("user", userDomain);
        map.put("ids", ids);
        return this.userMapper.updateUserByIdsWithForce(map);
    }

    @Override
    public Boolean updateUserByCondition(UserDomain userDomain, UserCondition condition) {
        Map map = new HashMap();
        map.put("user", userDomain);
        map.put("condition", condition);
        return this.userMapper.updateUserByCondition(map);
    }

    @Override
    public Boolean updateUserByConditionWithForce(UserDomain userDomain, UserCondition condition) {
        Map map = new HashMap();
        map.put("user", userDomain);
        map.put("condition", condition);
        return this.userMapper.updateUserByConditionWithForce(map);
    }

    @Override
    public Boolean deleteUserById(Integer id) {
        return this.userMapper.deleteUserById(id);
    }

    @Override
    public Boolean deleteUserByIds(List<Integer> ids) {
        return this.userMapper.deleteUserByIds(ids);
    }
}
