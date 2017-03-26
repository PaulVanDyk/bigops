package com.ywb.bigops.web.controller.organization;

import com.alibaba.fastjson.JSONObject;
import com.ywb.bigops.common.util.BigOpsException;
import com.ywb.bigops.domain.organization.OrganizationCondition;
import com.ywb.bigops.domain.organization.OrganizationDomain;
import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;
import com.ywb.bigops.service.organization.OrganizationService;
import com.ywb.bigops.service.user.UserService;
import com.ywb.bigops.web.controller.BaseController;
import com.ywb.bigops.web.controller.JsonData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

/**
 * OrganizationController
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
@Controller
@RequestMapping("/organization")
public class OrganizationController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(OrganizationController.class);

    @Resource
    private OrganizationService organizationService;
    @Resource
    private UserService userService;

    @RequestMapping("lazyList")
    @ResponseBody
    public List lazyList(Integer pid) {
        List<Map> list = new ArrayList<Map>();
        try {
            Map node;
            OrganizationCondition condition = new OrganizationCondition();
            condition.setPid(StringUtils.isEmpty(pid) ? 0 : pid);
            condition.setSortField("order");
            condition.setSortDesc("asc");
            condition.setPageIndex(0);
            condition.setPageSize(Integer.MAX_VALUE);
            condition.setStatus(1);
            List<OrganizationDomain> organizationList = this.organizationService.findOrganizationListByConditionWithPage(condition);
            if (null != organizationList) {
                for (OrganizationDomain domain : organizationList) {
                    node = new HashMap();
                    node.put("id", domain.getOid());
                    node.put("text", domain.getOname());
                    node.put("parent", domain.getPid() == 0 ? "#" : domain.getPid());
                    node.put("type", domain.getType());
                    node.put("order", domain.getOrder());
                    node.put("children", true);
                    list.add(node);
                }
            }

            UserCondition userCondition = new UserCondition();
            userCondition.setOrganizationId(pid);
            userCondition.setPageIndex(0);
            userCondition.setPageSize(Integer.MAX_VALUE);
            userCondition.setSortField("realname");
            userCondition.setSortDesc("ASC");
            userCondition.setStatus(1);
            List<UserDomain> userList = this.userService.findUserListByConditionWithPage(userCondition);
            if (null != userList) {
                for (UserDomain domain : userList) {
                    node = new HashMap();
                    node.put("id", "u_" + domain.getUid());
                    node.put("text", domain.getRealname());
                    node.put("parent", domain.getOrganizationId());
                    node.put("type", domain.getGender() == 0 ? "female" : "male");
                    list.add(node);
                }
            }
        } catch (BigOpsException e) {
            logger.error("lazyList pid:" + pid, e);
        }
        return list;
    }

    @RequestMapping("addOrg")
    @ResponseBody
    public JsonData addOrg(OrganizationDomain domain) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("addOrg");
        try {
            domain.setCreateTime(new Date());
            domain.setType("default");
            domain.setOrder(10);
            domain.setStatus(1);
            boolean bool = this.organizationService.insertOrganization(domain);
            jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
        } catch (BigOpsException e) {
            logger.error("addOrg domain:" + JSONObject.toJSONString(domain), e);
        }
        return jsonData;

    }

    @RequestMapping("delOrg")
    @ResponseBody
    public JsonData delOrg(Integer[] ids) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("delOrg");
        try {
            OrganizationDomain domain = new OrganizationDomain();
            domain.setUpdateTime(new Date());
            domain.setStatus(0);
            boolean bool = this.organizationService.updateOrganizationByIds(domain, Arrays.asList(ids));
            jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
        } catch (BigOpsException e) {
            logger.error("delOrg ids:" + ids, e);
        }
        return jsonData;
    }

    @RequestMapping("moveOrg")
    @ResponseBody
    public JsonData moveOrg(Integer[] ids, Integer pid) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("moveOrg");
        try {
            OrganizationDomain domain = new OrganizationDomain();
            domain.setUpdateTime(new Date());
            domain.setPid(pid);
            boolean bool = this.organizationService.updateOrganizationByIds(domain, Arrays.asList(ids));
            jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
        } catch (BigOpsException e) {
            logger.error("moveOrg ids:" + ids + ", pid:" + pid, e);
        }
        return jsonData;
    }

    @RequestMapping("modifyOrg")
    @ResponseBody
    public JsonData modifyOrg(OrganizationDomain domain, Integer[] ids) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("modifyOrg");
        try {
            domain.setUpdateTime(new Date());
            boolean bool = this.organizationService.updateOrganizationByIds(domain, Arrays.asList(ids));
            jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
        } catch (BigOpsException e) {
            logger.error("modifyOrg domain:" + domain + ", ids:" + ids, e);
        }
        return jsonData;
    }

    @RequestMapping("checkOrgName")
    @ResponseBody
    public boolean checkOrgName(String orgName, Integer pid) {
        boolean bool;
        try {
            OrganizationCondition condition = new OrganizationCondition();
            condition.setOname(orgName);
            condition.setPid(pid);
            OrganizationDomain domain = this.organizationService.findOrganizationByCondition(condition);
            if (null != domain && domain.getOname().equals(orgName) && domain.getPid() == pid) {
                bool = false;
            } else {
                bool = true;
            }
        } catch (BigOpsException e) {
            bool = false;
            logger.error("renameOrg orgName:" + orgName + ", pid:" + pid, e);
        }
        return bool;
    }
}
