package com.ywb.bigops.service.user.impl;

import com.ywb.bigops.dao.UserDao;
import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;
import com.ywb.bigops.service.user.UserService;

import javax.annotation.Resource;
import java.util.List;

/**
 * UserServiceImpl
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

    @Override
    public Boolean insertUser(UserDomain userDomain) {
        return this.userDao.insertUser(userDomain);
    }

    @Override
    public UserDomain findUserById(Integer id) {
        return this.userDao.findUserById(id);
    }

    @Override
    public List<UserDomain> findUserListByConditionWithPage(UserCondition condition) {
        return this.userDao.findUserListByConditionWithPage(condition);
    }

    @Override
    public UserDomain findUserByCondition(UserCondition condition) {
        condition.setPageIndex(0);
        condition.setPageSize(1);
        List<UserDomain> list = this.userDao.findUserListByConditionWithPage(condition);
        if (null != list && list.size() != 0) {
            return list.get(0);
        } else {
            return null;
        }
    }

    @Override
    public Integer findUserCountByCondition(UserCondition condition) {
        return this.userDao.findUserCountByCondition(condition);
    }

    @Override
    public Boolean updateUserById(UserDomain userDomain) {
        return this.userDao.updateUserById(userDomain);
    }

    @Override
    public Boolean updateUserByIdWithForce(UserDomain userDomain) {
        return this.userDao.updateUserByIdWithForce(userDomain);
    }

    @Override
    public Boolean updateUserByIds(UserDomain userDomain, List<Integer> ids) {
        return this.userDao.updateUserByIds(userDomain, ids);
    }

    @Override
    public Boolean updateUserByIdsWithForce(UserDomain userDomain, List<Integer> ids) {
        return this.userDao.updateUserByIdsWithForce(userDomain, ids);
    }

    @Override
    public Boolean updateUserByCondition(UserDomain userDomain, UserCondition condition) {
        return this.userDao.updateUserByCondition(userDomain, condition);
    }

    @Override
    public Boolean updateUserByConditionWithForce(UserDomain userDomain, UserCondition condition) {
        return this.userDao.updateUserByConditionWithForce(userDomain, condition);
    }

    @Override
    public Boolean deleteUserById(Integer id) {
        return this.userDao.deleteUserById(id);
    }

    @Override
    public Boolean deleteUserByIds(List<Integer> ids) {
        return this.userDao.deleteUserByIds(ids);
    }
}
