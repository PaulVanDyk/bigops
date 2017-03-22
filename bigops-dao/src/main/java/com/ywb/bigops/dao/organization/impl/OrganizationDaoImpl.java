package com.ywb.bigops.dao.organization.impl;

import com.ywb.bigops.dao.mapper.OrganizationMapper;
import com.ywb.bigops.dao.organization.OrganizationDao;
import com.ywb.bigops.domain.organization.OrganizationCondition;
import com.ywb.bigops.domain.organization.OrganizationDomain;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * OrganizationDaoImpl
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public class OrganizationDaoImpl implements OrganizationDao {

    @Resource
    private OrganizationMapper organizationMapper;

    @Override
    public Boolean insertOrganization(OrganizationDomain organizationDomain) {
        return this.organizationMapper.insertOrganization(organizationDomain);
    }

    @Override
    public OrganizationDomain findOrganizationById(Integer id) {
        return this.organizationMapper.findOrganizationById(id);
    }

    @Override
    public List<OrganizationDomain> findOrganizationListByConditionWithPage(OrganizationCondition condition) {
        return this.organizationMapper.findOrganizationListByConditionWithPage(condition);
    }

    @Override
    public Integer findOrganizationCountByCondition(OrganizationCondition condition) {
        return this.organizationMapper.findOrganizationCountByCondition(condition);
    }

    @Override
    public Boolean updateOrganizationById(OrganizationDomain organizationDomain) {
        return this.organizationMapper.updateOrganizationById(organizationDomain);
    }

    @Override
    public Boolean updateOrganizationByIdWithForce(OrganizationDomain organizationDomain) {
        return this.organizationMapper.updateOrganizationByIdWithForce(organizationDomain);
    }

    @Override
    public Boolean updateOrganizationByIds(OrganizationDomain organizationDomain, List<Integer> ids) {
        Map map = new HashMap();
        map.put("organization", organizationDomain);
        map.put("ids", ids);
        return this.organizationMapper.updateOrganizationByIds(map);
    }

    @Override
    public Boolean updateOrganizationByIdsWithForce(OrganizationDomain organizationDomain, List<Integer> ids) {
        Map map = new HashMap();
        map.put("organization", organizationDomain);
        map.put("ids", ids);
        return this.organizationMapper.updateOrganizationByIdsWithForce(map);
    }

    @Override
    public Boolean updateOrganizationByCondition(OrganizationDomain organizationDomain, OrganizationCondition condition) {
        Map map = new HashMap();
        map.put("organization", organizationDomain);
        map.put("condition", condition);
        return this.organizationMapper.updateOrganizationByCondition(map);
    }

    @Override
    public Boolean updateOrganizationByConditionWithForce(OrganizationDomain organizationDomain, OrganizationCondition condition) {
        Map map = new HashMap();
        map.put("organization", organizationDomain);
        map.put("condition", condition);
        return this.organizationMapper.updateOrganizationByConditionWithForce(map);
    }

    @Override
    public Boolean deleteOrganizationById(Integer id) {
        return this.organizationMapper.deleteOrganizationById(id);
    }

    @Override
    public Boolean deleteOrganizationByIds(List<Integer> ids) {
        return this.organizationMapper.deleteOrganizationByIds(ids);
    }
}
