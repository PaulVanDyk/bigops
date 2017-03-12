package com.ywb.bigops.service.user;

import com.ywb.bigops.common.util.BigOpsException;
import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;

import java.util.List;

/**
 * UserService
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public interface UserService {

    /**
     * 添加用户
     *
     * @param userDomain, see {@link UserDomain}
     * @return boolean
     * @throws BigOpsException
     * @see UserDomain
     * @see BigOpsException
     */
    Boolean insertUser(UserDomain userDomain) throws BigOpsException;

    /**
     * 通过ID获取用户
     *
     * @param id, see {@link Integer}
     * @return userDomain, see {@link UserDomain}
     * @throws BigOpsException
     * @see UserDomain
     * @see BigOpsException
     */
    UserDomain findUserById(Integer id) throws BigOpsException;

    /**
     * 分页获取用户列表
     *
     * @param condition, see {@link UserCondition}
     * @return userDomain, see {@linkplain UserDomain List&lt;UserDomain&gt;}
     * @throws BigOpsException
     * @see UserDomain
     * @see UserCondition
     * @see BigOpsException
     */
    List<UserDomain> findUserListByConditionWithPage(UserCondition condition) throws BigOpsException;

    /**
     * 通过条件获取用户个数
     *
     * @param condition, see {@link UserCondition}
     * @return count, see {@link Integer}
     * @throws BigOpsException
     * @see UserCondition
     * @see BigOpsException
     */
    Integer findUserCountByCondition(UserCondition condition) throws BigOpsException;

    /**
     * 通过id更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @return boolean
     * @throws BigOpsException
     * @see UserDomain
     * @see BigOpsException
     */
    Boolean updateUserById(UserDomain userDomain) throws BigOpsException;

    /**
     * 通过id强制更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @return boolean
     * @throws BigOpsException
     * @see UserDomain
     * @see BigOpsException
     */
    Boolean updateUserByIdWithForce(UserDomain userDomain) throws BigOpsException;

    /**
     * 通过id更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @param ids,        see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @throws BigOpsException
     * @see UserDomain
     * @see BigOpsException
     */
    Boolean updateUserByIds(UserDomain userDomain, List<Integer> ids) throws BigOpsException;

    /**
     * 通过id强制更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @param ids,        see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @throws BigOpsException
     * @see UserDomain
     * @see BigOpsException
     */
    Boolean updateUserByIdsWithForce(UserDomain userDomain, List<Integer> ids) throws BigOpsException;

    /**
     * 通过条件更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @param condition,  see {@link UserCondition}
     * @return boolean
     * @throws BigOpsException
     * @see UserDomain
     * @see UserCondition
     * @see BigOpsException
     */
    Boolean updateUserByCondition(UserDomain userDomain, UserCondition condition) throws BigOpsException;

    /**
     * 通过条件强制更新用户
     *
     * @param userDomain, see {@link UserDomain}
     * @param condition,  see {@link UserCondition}
     * @return boolean
     * @throws BigOpsException
     * @see UserDomain
     * @see UserCondition
     * @see BigOpsException
     */
    Boolean updateUserByConditionWithForce(UserDomain userDomain, UserCondition condition) throws BigOpsException;

    /**
     * 通过id删除用户
     *
     * @param id, see {@link Integer}
     * @return boolean
     * @throws BigOpsException
     * @see BigOpsException
     */
    Boolean deleteUserById(Integer id) throws BigOpsException;

    /**
     * 通过id批量删除用户
     *
     * @param ids, see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @throws BigOpsException
     * @see BigOpsException
     */
    Boolean deleteUserByIds(List<Integer> ids) throws BigOpsException;
}
