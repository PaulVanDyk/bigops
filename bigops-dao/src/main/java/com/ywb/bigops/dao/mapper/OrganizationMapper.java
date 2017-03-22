package com.ywb.bigops.dao.mapper;

import com.ywb.bigops.domain.organization.OrganizationCondition;
import com.ywb.bigops.domain.organization.OrganizationDomain;

import java.util.List;
import java.util.Map;

/**
 * 机构管理
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public interface OrganizationMapper {

    /**
     * 添加用户
     *
     * @param organizationDomain
     * @return boolean
     */
    boolean insertOrganization(OrganizationDomain organizationDomain);

    /**
     * 通过ID获取用户
     *
     * @param id
     * @return organizationDomain, see {@link OrganizationDomain}
     * @see OrganizationDomain
     */
    OrganizationDomain findOrganizationById(int id);

    /**
     * 分页获取用户列表
     *
     * @param condition
     * @return organizationDomain, see {@linkplain OrganizationDomain List&lt;OrganizationDomain&gt;}
     * @see OrganizationDomain
     */
    List<OrganizationDomain> findOrganizationListByConditionWithPage(OrganizationCondition condition);

    /**
     * 通过条件获取用户个数
     *
     * @param condition
     * @return count
     */
    int findOrganizationCountByCondition(OrganizationCondition condition);

    /**
     * 通过id更新用户
     *
     * @param organizationDomain
     * @return boolean
     */
    boolean updateOrganizationById(OrganizationDomain organizationDomain);

    /**
     * 通过id强制更新用户
     *
     * @param organizationDomain
     * @return boolean
     */
    boolean updateOrganizationByIdWithForce(OrganizationDomain organizationDomain);

    /**
     * 通过ids批量更新用户
     *
     * @param map example: organization:OrganizationDomain、ids:ids
     * @return boolean
     */
    boolean updateOrganizationByIds(Map map);

    /**
     * 通过ids强制批量更新用户
     *
     * @param map example: organization:OrganizationDomain、ids:ids
     * @return boolean
     */
    boolean updateOrganizationByIdsWithForce(Map map);

    /**
     * 通过条件更新用户
     *
     * @param map example: organization:OrganizationDomain、condition:OrganizationCondition
     * @return boolean
     */
    boolean updateOrganizationByCondition(Map map);

    /**
     * 通过条件强制更新用户
     *
     * @param map example: organization:OrganizationDomain、condition:OrganizationCondition
     * @return boolean
     */
    boolean updateOrganizationByConditionWithForce(Map map);

    /**
     * 通过id删除用户
     *
     * @param id
     * @return boolean
     */
    boolean deleteOrganizationById(int id);

    /**
     * 通过ids批量删除用户
     *
     * @param ids
     * @return boolean
     */
    boolean deleteOrganizationByIds(List<Integer> ids);
}
