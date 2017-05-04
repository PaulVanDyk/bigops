package com.ywb.bigops.web.controller.user;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ywb.bigops.common.util.BigOpsException;
import com.ywb.bigops.common.util.DigestUtils;
import com.ywb.bigops.domain.organization.OrganizationCondition;
import com.ywb.bigops.domain.organization.OrganizationDomain;
import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;
import com.ywb.bigops.service.organization.OrganizationService;
import com.ywb.bigops.service.user.UserService;
import com.ywb.bigops.web.controller.BaseController;
import com.ywb.bigops.web.controller.JsonData;
import com.ywb.bigops.web.controller.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.*;

/**
 * UserController
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Resource
    private UserService userService;
    @Resource
    private OrganizationService organizationService;

    @RequestMapping("index")
    public ModelAndView index() {
        return new ModelAndView("user/index");
    }

    @RequestMapping("indexAjax")
    public ModelAndView indexAjax(@RequestParam String params) {
        ModelAndView modelAndView = new ModelAndView("user/list");
        Map map;
        List list = new ArrayList();
        String[] param = params.split("\\,");
        for (String str : param) {
            map = new HashMap();
            String[] item = str.split("\\:");
            map.put("key", item[0]);
            map.put("value", item[1]);
            list.add(map);
        }
        modelAndView.addObject("params", JSONArray.toJSONString(list));
        return modelAndView;
    }

    @RequestMapping("login")
    @ResponseBody
    public JsonData login(String username, String password) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("login");
        try {
            UserCondition condition = new UserCondition();
            condition.setEmail(username);
            UserDomain user = this.userService.findUserByCondition(condition);
            if (null == user) {
                jsonData.setErrorCode("1000");
                jsonData.setErrorMessage("用户名/密码不匹配，请重新输入！");
            } else {
                String passwordDigest = DigestUtils.digest(username + DigestUtils.SEPARATOR
                        + password + DigestUtils.SEPARATOR + DigestUtils.SALT);
                if (passwordDigest.equals(user.getPassword())) {
                    jsonData.setStatus(JsonData.SUCCESS);
                } else {
                    jsonData.setErrorCode("1000");
                    jsonData.setErrorMessage("用户名/密码不匹配，请重新输入！");
                }
            }
        } catch (BigOpsException e) {
            logger.error("login username:" + username + ", password:" + password, e);
        }
        return jsonData;
    }

    @RequestMapping("findUserList")
    @ResponseBody
    public PageInfo findUserList(PageInfo<UserDomain> pageInfo, UserCondition cond, boolean depth, boolean isSearch) {
        try {
            cond.setStatusList(Arrays.asList(new Integer[]{-1, 1}));
            if (isSearch) {
                cond.setPageIndex(pageInfo.getStart());
                cond.setPageSize(pageInfo.getLength());
                cond.setOrganizationId(null);
                List<UserDomain> list = this.userService.findUserListByConditionWithPage(cond);
                int count = this.userService.findUserCountByCondition(cond);
                pageInfo.setData(list);
                pageInfo.setRecordsTotal(count);
            } else {
                if (depth) {
                    cond.setPageIndex(0);
                    cond.setPageSize(Integer.MAX_VALUE);
                    List<UserDomain> list = new ArrayList<UserDomain>();
                    this.findUserListByOrganizationRecursive(list, cond);
                    int length = pageInfo.getStart() + pageInfo.getLength();
                    pageInfo.setData(list.subList(pageInfo.getStart(), length > list.size() ? list.size() : length));
                    pageInfo.setRecordsTotal(list.size());
                } else {
                    cond.setPageIndex(pageInfo.getStart());
                    cond.setPageSize(pageInfo.getLength());
                    List<UserDomain> list = this.userService.findUserListByConditionWithPage(cond);
                    int count = this.userService.findUserCountByCondition(cond);
                    pageInfo.setData(list);
                    pageInfo.setRecordsTotal(count);
                }
            }
        } catch (BigOpsException e) {
            logger.error("findUserList pageInfo:" + JSONObject.toJSONString(pageInfo) + ", cond:" + JSONObject.toJSONString(cond), e);
        } catch (Exception ex) {
            logger.error("findUserList pageInfo:" + JSONObject.toJSONString(pageInfo) + ", cond:" + JSONObject.toJSONString(cond), ex);
        }
        return pageInfo;
    }

    private void findUserListByOrganizationRecursive(List<UserDomain> list, UserCondition condition) throws BigOpsException {
        list.addAll(this.userService.findUserListByConditionWithPage(condition));
        OrganizationCondition organizationCondition = new OrganizationCondition();
        organizationCondition.setPid(Integer.parseInt(condition.getOrganizationId()));
        organizationCondition.setPageIndex(0);
        organizationCondition.setPageSize(Integer.MAX_VALUE);
        List<OrganizationDomain> orgList = this.organizationService.findOrganizationListByConditionWithPage(organizationCondition);
        for (OrganizationDomain domain : orgList) {
            condition.setOrganizationId(String.valueOf(domain.getOid()));
            findUserListByOrganizationRecursive(list, condition);
        }
    }


    @RequestMapping("addUser")
    @ResponseBody
    public JsonData addUser(UserDomain domain) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("addUser");
        try {
            domain.setStatus(1);
            String passwordDigest = DigestUtils.digest(domain.getEmail() + DigestUtils.SEPARATOR
                    + DigestUtils.DEFAULT_PWD + DigestUtils.SEPARATOR + DigestUtils.SALT);
            domain.setPassword(passwordDigest);
            boolean bool = this.userService.insertUser(domain);
            jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
        } catch (BigOpsException e) {
            logger.error("addUser domain:" + JSONObject.toJSONString(domain), e);
        }
        return jsonData;

    }

    @RequestMapping("delUser")
    @ResponseBody
    public JsonData delUser(Integer[] ids) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("delUser");
        try {
            boolean bool = this.userService.deleteUserByIds(Arrays.asList(ids));
            jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
        } catch (BigOpsException e) {
            logger.error("delUser ids:" + ids, e);
        }
        return jsonData;
    }

    @RequestMapping("moveUser")
    @ResponseBody
    public JsonData moveUser(Integer[] ids, Integer oid) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("moveUser");
        try {
            UserDomain domain = new UserDomain();

            OrganizationDomain orgDomain = this.organizationService.findOrganizationById(oid);
//            UserDomain userDomain = this.userService.findUserById(id);

//            String oids = "," + userDomain.getOrganizationId() + ",";
//            String onames = "," + userDomain.getOrganizationName() + ",";
//            domain.setOrganizationId(oids.replace()String.valueOf(oid));
            domain.setOrganizationId(String.valueOf(oid));
            domain.setOrganizationName(orgDomain.getOname());
            boolean bool = this.userService.updateUserByIds(domain, Arrays.asList(ids));
            jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
        } catch (BigOpsException e) {
            logger.error("moveUser ids:" + ids + ", oid:" + oid, e);
        }
        return jsonData;
    }

    @RequestMapping("modifyUser")
    @ResponseBody
    public JsonData modifyUser(UserDomain domain, Integer[] ids) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("modifyUser");
        try {
            boolean bool = this.userService.updateUserByIds(domain, Arrays.asList(ids));
            jsonData.setStatus(bool ? JsonData.SUCCESS : JsonData.FAILED);
        } catch (BigOpsException e) {
            logger.error("modifyUser domain:" + domain + ", ids:" + ids, e);
        }
        return jsonData;
    }

    @RequestMapping("findUserById")
    @ResponseBody
    public JsonData findUserById(Integer id) {
        JsonData jsonData = new JsonData(JsonData.FAILED);
        jsonData.setMethod("findUserById");
        try {
            UserDomain domain = this.userService.findUserById(id);
            jsonData.setStatus(domain == null ? JsonData.FAILED : JsonData.SUCCESS);
            jsonData.setData(domain);
        } catch (BigOpsException e) {
            logger.error("findUserById id:" + id, e);
        }
        return jsonData;
    }

    @RequestMapping("checkEmail")
    @ResponseBody
    public boolean checkEmail(String email, Integer id) {
        boolean bool;
        try {
            UserCondition condition = new UserCondition();

            condition.setEmail(email);
            UserDomain domain = this.userService.findUserByCondition(condition);
            if (null != domain && domain.getEmail().equals(email) && domain.getUid() != id) {
                bool = false;
            } else {
                bool = true;
            }
        } catch (BigOpsException e) {
            bool = false;
            logger.error("checkEmail email:" + email + ", id:" + id, e);
        }
        return bool;
    }

}
