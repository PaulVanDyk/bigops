package com.ywb.bigops.dao;

import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;

import java.util.List;

/**
 * 用户管理
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public interface UserDao {

    /**
     * 添加用户
     *
     * @param userDomain, see {@link UserDomain}
     * @return boolean
     * @see UserDomain
     */
    Boolean insertUser(UserDomain userDomain);

    /**
     * 通过ID获取用户
     *
     * @param id, see {@link Integer}
     * @return userDomain, see {@link UserDomain}
     * @see UserDomain
     */
    UserDomain findUserById(Integer id);

    /**
     * 分页获取用户列表
     *
     * @param condition, see {@link UserCondition}
     * @return userDomain, see {@linkplain UserDomain List&lt;UserDomain&gt;}
     * @see UserDomain
     * @see UserCondition
     */
    List<UserDomain> findUserListByConditionWithPage(UserCondition condition);

    /**
     * 通过条件获取用户个数
     *
     * @param condition, see {@link UserCondition}
     * @return count, see {@link Integer}
     * @see UserCondition
     */
    Integer findUserCountByCondition(UserCondition condition);

    /**
     * 通过id更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @return boolean
     * @see UserDomain
     */
    Boolean updateUserById(UserDomain userDomain);

    /**
     * 通过id强制更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @return boolean
     * @see UserDomain
     */
    Boolean updateUserByIdWithForce(UserDomain userDomain);

    /**
     * 通过id更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @param ids,        see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @see UserDomain
     */
    Boolean updateUserByIds(UserDomain userDomain, List<Integer> ids);

    /**
     * 通过id强制更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @param ids,        see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @see UserDomain
     */
    Boolean updateUserByIdsWithForce(UserDomain userDomain, List<Integer> ids);

    /**
     * 通过条件更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @param condition,  see {@link UserCondition}
     * @return boolean
     * @see UserDomain
     * @see UserCondition
     */
    Boolean updateUserByCondition(UserDomain userDomain, UserCondition condition);

    /**
     * 通过条件强制更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @param condition,  see {@link UserCondition}
     * @return boolean
     * @see UserDomain
     * @see UserCondition
     */
    Boolean updateUserByConditionWithForce(UserDomain userDomain, UserCondition condition);

    /**
     * 通过id删除用户
     *
     * @param id, see {@link Integer}
     * @return boolean
     */
    Boolean deleteUserById(Integer id);

    /**
     * 通过id批量删除用户
     *
     * @param ids, see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     */
    Boolean deleteUserByIds(List<Integer> ids);
}
