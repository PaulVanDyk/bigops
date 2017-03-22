package com.ywb.bigops.service.organization.impl;

import com.ywb.bigops.dao.organization.OrganizationDao;
import com.ywb.bigops.domain.organization.OrganizationCondition;
import com.ywb.bigops.domain.organization.OrganizationDomain;
import com.ywb.bigops.service.organization.OrganizationService;

import javax.annotation.Resource;
import java.util.List;

/**
 * OrganizationServiceImpl
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public class OrganizationServiceImpl implements OrganizationService {

    @Resource
    private OrganizationDao organizationDao;

    @Override
    public Boolean insertOrganization(OrganizationDomain organizationDomain) {
        return this.organizationDao.insertOrganization(organizationDomain);
    }

    @Override
    public OrganizationDomain findOrganizationById(Integer id) {
        return this.organizationDao.findOrganizationById(id);
    }

    @Override
    public List<OrganizationDomain> findOrganizationListByConditionWithPage(OrganizationCondition condition) {
        return this.organizationDao.findOrganizationListByConditionWithPage(condition);
    }

    @Override
    public OrganizationDomain findOrganizationByCondition(OrganizationCondition condition) {
        condition.setPageIndex(0);
        condition.setPageSize(1);
        List<OrganizationDomain> list = this.organizationDao.findOrganizationListByConditionWithPage(condition);
        if (null != list && list.size() != 0) {
            return list.get(0);
        } else {
            return null;
        }
    }

    @Override
    public Integer findOrganizationCountByCondition(OrganizationCondition condition) {
        return this.organizationDao.findOrganizationCountByCondition(condition);
    }

    @Override
    public Boolean updateOrganizationById(OrganizationDomain organizationDomain) {
        return this.organizationDao.updateOrganizationById(organizationDomain);
    }

    @Override
    public Boolean updateOrganizationByIdWithForce(OrganizationDomain organizationDomain) {
        return this.organizationDao.updateOrganizationByIdWithForce(organizationDomain);
    }

    @Override
    public Boolean updateOrganizationByIds(OrganizationDomain organizationDomain, List<Integer> ids) {
        return this.organizationDao.updateOrganizationByIds(organizationDomain, ids);
    }

    @Override
    public Boolean updateOrganizationByIdsWithForce(OrganizationDomain organizationDomain, List<Integer> ids) {
        return this.organizationDao.updateOrganizationByIdsWithForce(organizationDomain, ids);
    }

    @Override
    public Boolean updateOrganizationByCondition(OrganizationDomain organizationDomain, OrganizationCondition condition) {
        return this.organizationDao.updateOrganizationByCondition(organizationDomain, condition);
    }

    @Override
    public Boolean updateOrganizationByConditionWithForce(OrganizationDomain organizationDomain, OrganizationCondition condition) {
        return this.organizationDao.updateOrganizationByConditionWithForce(organizationDomain, condition);
    }

    @Override
    public Boolean deleteOrganizationById(Integer id) {
        return this.organizationDao.deleteOrganizationById(id);
    }

    @Override
    public Boolean deleteOrganizationByIds(List<Integer> ids) {
        return this.organizationDao.deleteOrganizationByIds(ids);
    }
}
