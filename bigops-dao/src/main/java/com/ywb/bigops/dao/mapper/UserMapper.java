package com.ywb.bigops.dao.mapper;

import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;

import java.util.List;
import java.util.Map;

/**
 * 用户管理
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public interface UserMapper {

    /**
     * 添加用户
     *
     * @param userDomain
     * @return boolean
     */
    boolean insertUser(UserDomain userDomain);

    /**
     * 通过ID获取用户
     *
     * @param id
     * @return userDomain, see {@link UserDomain}
     * @see UserDomain
     */
    UserDomain findUserById(int id);

    /**
     * 分页获取用户列表
     *
     * @param condition
     * @return userDomain, see {@linkplain UserDomain List&lt;UserDomain&gt;}
     * @see UserDomain
     */
    List<UserDomain> findUserListByConditionWithPage(UserCondition condition);

    /**
     * 通过条件获取用户个数
     *
     * @param condition
     * @return count
     */
    int findUserCountByCondition(UserCondition condition);

    /**
     * 通过id更新用户
     *
     * @param userDomain
     * @return boolean
     */
    boolean updateUserById(UserDomain userDomain);

    /**
     * 通过id强制更新用户
     *
     * @param userDomain
     * @return boolean
     */
    boolean updateUserByIdWithForce(UserDomain userDomain);

    /**
     * 通过ids批量更新用户
     *
     * @param map example: user:UserDomain、ids:ids
     * @return boolean
     */
    boolean updateUserByIds(Map map);

    /**
     * 通过ids强制批量更新用户
     *
     * @param map example: user:UserDomain、ids:ids
     * @return boolean
     */
    boolean updateUserByIdsWithForce(Map map);

    /**
     * 通过条件更新用户
     *
     * @param map example: user:UserDomain、condition:UserCondition
     * @return boolean
     */
    boolean updateUserByCondition(Map map);

    /**
     * 通过条件强制更新用户
     *
     * @param map example: user:UserDomain、condition:UserCondition
     * @return boolean
     */
    boolean updateUserByConditionWithForce(Map map);

    /**
     * 通过id删除用户
     *
     * @param id
     * @return boolean
     */
    boolean deleteUserById(int id);

    /**
     * 通过ids批量删除用户
     *
     * @param ids
     * @return boolean
     */
    boolean deleteUserByIds(List<Integer> ids);
}
