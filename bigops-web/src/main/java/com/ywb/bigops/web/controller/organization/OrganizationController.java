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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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


    @RequestMapping("gotoAdd")
    public ModelAndView gotoAdd(Integer pid, String pname) {
        ModelAndView modelAndView = new ModelAndView("user/addOrg");
        modelAndView.addObject("pid", pid);
        modelAndView.addObject("pname", pname);
        return modelAndView;
    }

    @RequestMapping("gotoEdit")
    public ModelAndView gotoEdit(Integer id) {
        ModelAndView modelAndView = null;
        try {
            modelAndView = new ModelAndView("user/editOrg");
            OrganizationDomain organizationDomain = this.organizationService.findOrganizationById(id);
            OrganizationDomain organizationDomain2 = this.organizationService.findOrganizationById(organizationDomain.getPid());
            modelAndView.addObject("organizationDomain", organizationDomain);
            if (organizationDomain2 != null) {
                modelAndView.addObject("pname", organizationDomain2.getOname());
            }
        } catch (BigOpsException e) {
            logger.error("gotoEdit id:" + id, e);
        }
        return modelAndView;
    }


    @RequestMapping("lazyList")
    @ResponseBody
    public List lazyList(Integer pid) {
        List<Map> list = new ArrayList<Map>();
        try {
            Map node;
            OrganizationCondition condition = new OrganizationCondition();
            if (pid != null) {
                condition.setPid(pid);
            }
            condition.setSortField("`order`,CONVERT( oname USING gbk ) COLLATE gbk_chinese_ci");
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
//                    node.put("children", true);
                    list.add(node);
                }
            }

            UserCondition userCondition = new UserCondition();
//            userCondition.setOrganizationId(String.valueOf(pid));
            userCondition.setPageIndex(0);
            userCondition.setPageSize(Integer.MAX_VALUE);
            userCondition.setSortField("CONVERT( realname USING gbk ) COLLATE gbk_chinese_ci");
            userCondition.setSortDesc("asc");
            userCondition.setStatusList(Arrays.asList(new Integer[]{-1, 1}));
            List<UserDomain> userList = this.userService.findUserListByConditionWithPage(userCondition);
            if (null != userList) {
                for (UserDomain domain : userList) {
                    for (String oid : domain.getOrganizationId().split("\\,")) {
                        node = new HashMap();
                        node.put("id", oid + "_" + domain.getUid());
                        node.put("text", domain.getRealname());
                        node.put("parent", oid);
                        String prefixStr = domain.getStatus() == -1 ? "static-" : "";
                        node.put("type", domain.getGender() == 0 ? prefixStr + "female" : prefixStr + "male");
                        list.add(node);
                    }
                }
            }
        } catch (BigOpsException e) {
            logger.error("lazyList pid:" + pid, e);
        }
        return list;
    }

    @RequestMapping("lazyOrgList")
    @ResponseBody
    public List lazyOrgList(Integer pid) {
        List<Map> list = new ArrayList<Map>();
        try {
            Map node;
            OrganizationCondition condition = new OrganizationCondition();
            if (pid != null) {
                condition.setPid(pid);
            }
            condition.setSortField("`order`,CONVERT( oname USING gbk ) COLLATE gbk_chinese_ci");
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
//                    node.put("children", true);
                    list.add(node);
                }
            }
        } catch (BigOpsException e) {
            logger.error("lazyOrgList pid:" + pid, e);
        }
        return list;
    }

    @RequestMapping("addOrg")
    @ResponseBody
    public JsonData addOrg(OrganizationDomain domain) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("addOrg");
        try {
            OrganizationDomain parentDomain = this.organizationService.findOrganizationById(domain.getPid());
            domain.setCreateTime(new Date());
            if (parentDomain.getType().equals("static")) {
                domain.setType("static-default");
            } else {
                domain.setType("default");
            }
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
            OrganizationCondition condition = new OrganizationCondition();
            condition.setPid(ids[0]);
            OrganizationDomain entity = this.organizationService.findOrganizationByCondition(condition);
            if (entity != null) {
                jsonData.setErrorMessage("无法删除非空节点");
            } else {
                UserCondition userCondition = new UserCondition();
                userCondition.setOrganizationId(String.valueOf(ids[0]));
                UserDomain userDomain = this.userService.findUserByCondition(userCondition);
                if (userDomain != null) {
                    jsonData.setErrorMessage("无法删除非空节点");
                } else {
                    boolean bool = this.organizationService.deleteOrganizationByIds(Arrays.asList(ids));
                    jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
                }
            }
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
