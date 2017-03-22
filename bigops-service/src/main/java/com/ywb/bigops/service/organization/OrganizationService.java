package com.ywb.bigops.service.organization;

import com.ywb.bigops.common.util.BigOpsException;
import com.ywb.bigops.domain.organization.OrganizationCondition;
import com.ywb.bigops.domain.organization.OrganizationDomain;

import java.util.List;

/**
 * OrganizationService
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public interface OrganizationService {

    /**
     * 添加机构
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @return boolean
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see BigOpsException
     */
    Boolean insertOrganization(OrganizationDomain organizationDomain) throws BigOpsException;

    /**
     * 通过ID获取机构
     *
     * @param id, see {@link Integer}
     * @return organizationDomain, see {@link OrganizationDomain}
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see BigOpsException
     */
    OrganizationDomain findOrganizationById(Integer id) throws BigOpsException;

    /**
     * 分页获取机构列表
     *
     * @param condition, see {@link OrganizationCondition}
     * @return organizationDomain, see {@linkplain OrganizationDomain List&lt;OrganizationDomain&gt;}
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see OrganizationCondition
     * @see BigOpsException
     */
    List<OrganizationDomain> findOrganizationListByConditionWithPage(OrganizationCondition condition) throws BigOpsException;

    /**
     * 获取机构
     *
     * @param condition, see {@link OrganizationCondition}
     * @return organizationDomain, see {@link OrganizationDomain}
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see OrganizationCondition
     * @see BigOpsException
     */
    OrganizationDomain findOrganizationByCondition(OrganizationCondition condition) throws BigOpsException;

    /**
     * 通过条件获取机构个数
     *
     * @param condition, see {@link OrganizationCondition}
     * @return count, see {@link Integer}
     * @throws BigOpsException
     * @see OrganizationCondition
     * @see BigOpsException
     */
    Integer findOrganizationCountByCondition(OrganizationCondition condition) throws BigOpsException;

    /**
     * 通过id更新机构
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @return boolean
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see BigOpsException
     */
    Boolean updateOrganizationById(OrganizationDomain organizationDomain) throws BigOpsException;

    /**
     * 通过id强制更新机构
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @return boolean
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see BigOpsException
     */
    Boolean updateOrganizationByIdWithForce(OrganizationDomain organizationDomain) throws BigOpsException;

    /**
     * 通过id更新机构
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @param ids,                see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see BigOpsException
     */
    Boolean updateOrganizationByIds(OrganizationDomain organizationDomain, List<Integer> ids) throws BigOpsException;

    /**
     * 通过id强制更新机构
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @param ids,                see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see BigOpsException
     */
    Boolean updateOrganizationByIdsWithForce(OrganizationDomain organizationDomain, List<Integer> ids) throws BigOpsException;

    /**
     * 通过条件更新机构
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @param condition,          see {@link OrganizationCondition}
     * @return boolean
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see OrganizationCondition
     * @see BigOpsException
     */
    Boolean updateOrganizationByCondition(OrganizationDomain organizationDomain, OrganizationCondition condition) throws BigOpsException;

    /**
     * 通过条件强制更新机构
     *
     * @param organizationDomain, see {@link OrganizationDomain}
     * @param condition,          see {@link OrganizationCondition}
     * @return boolean
     * @throws BigOpsException
     * @see OrganizationDomain
     * @see OrganizationCondition
     * @see BigOpsException
     */
    Boolean updateOrganizationByConditionWithForce(OrganizationDomain organizationDomain, OrganizationCondition condition) throws BigOpsException;

    /**
     * 通过id删除机构
     *
     * @param id, see {@link Integer}
     * @return boolean
     * @throws BigOpsException
     * @see BigOpsException
     */
    Boolean deleteOrganizationById(Integer id) throws BigOpsException;

    /**
     * 通过id批量删除机构
     *
     * @param ids, see {@linkplain Integer List&lt;Integer&gt;}
     * @return boolean
     * @throws BigOpsException
     * @see BigOpsException
     */
    Boolean deleteOrganizationByIds(List<Integer> ids) throws BigOpsException;
}
