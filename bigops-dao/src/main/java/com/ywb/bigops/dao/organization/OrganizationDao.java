package com.ywb.bigops.dao.organization;

import com.ywb.bigops.domain.organization.OrganizationCondition;
import com.ywb.bigops.domain.organization.OrganizationDomain;

import java.util.List;

/**
 * 机构管理
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public interface OrganizationDao {

    /**
     * 添加用户
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @return boolean
     * @see OrganizationDomain
     */
    Boolean insertOrganization(OrganizationDomain organizationDomain);

    /**
     * 通过ID获取用户
     *
     * @param id, see {@link Integer}
     * @return organizationDomain, see {@link OrganizationDomain}
     * @see OrganizationDomain
     */
    OrganizationDomain findOrganizationById(Integer id);

    /**
     * 分页获取用户列表
     *
     * @param condition, see {@link OrganizationCondition}
     * @return organizationDomain, see {@linkplain OrganizationDomain List&lt;OrganizationDomain&gt;}
     * @see OrganizationDomain
     * @see OrganizationCondition
     */
    List<OrganizationDomain> findOrganizationListByConditionWithPage(OrganizationCondition condition);

    /**
     * 通过条件获取用户个数
     *
     * @param condition, see {@link OrganizationCondition}
     * @return count, see {@link Integer}
     * @see OrganizationCondition
     */
    Integer findOrganizationCountByCondition(OrganizationCondition condition);

    /**
     * 通过id更新用户
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @return boolean
     * @see OrganizationDomain
     */
    Boolean updateOrganizationById(OrganizationDomain organizationDomain);

    /**
     * 通过id强制更新用户
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @return boolean
     * @see OrganizationDomain
     */
    Boolean updateOrganizationByIdWithForce(OrganizationDomain organizationDomain);

    /**
     * 通过id更新用户
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @param ids,                see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @see OrganizationDomain
     */
    Boolean updateOrganizationByIds(OrganizationDomain organizationDomain, List<Integer> ids);

    /**
     * 通过id强制更新用户
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @param ids,                see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @see OrganizationDomain
     */
    Boolean updateOrganizationByIdsWithForce(OrganizationDomain organizationDomain, List<Integer> ids);

    /**
     * 通过条件更新用户
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @param condition,          see {@link OrganizationCondition}
     * @return boolean
     * @see OrganizationDomain
     * @see OrganizationCondition
     */
    Boolean updateOrganizationByCondition(OrganizationDomain organizationDomain, OrganizationCondition condition);

    /**
     * 通过条件强制更新用户
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @param condition,          see {@link OrganizationCondition}
     * @return boolean
     * @see OrganizationDomain
     * @see OrganizationCondition
     */
    Boolean updateOrganizationByConditionWithForce(OrganizationDomain organizationDomain, OrganizationCondition condition);

    /**
     * 通过id删除用户
     *
     * @param id, see {@link Integer}
     * @return boolean
     */
    Boolean deleteOrganizationById(Integer id);

    /**
     * 通过id批量删除用户
     *
     * @param ids, see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     */
    Boolean deleteOrganizationByIds(List<Integer> ids);
}
