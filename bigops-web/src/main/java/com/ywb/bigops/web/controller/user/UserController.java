package com.ywb.bigops.web.controller.user;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ywb.bigops.common.util.BigOpsException;
import com.ywb.bigops.common.util.DigestUtils;
import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;
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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @RequestMapping("/findUserList")
    @ResponseBody
    public PageInfo findUserList(PageInfo<UserDomain> pageInfo, UserCondition cond) {
        try {
            cond.setPageIndex(pageInfo.getStart());
            cond.setPageSize(pageInfo.getLength());
            List<UserDomain> list = this.userService.findUserListByConditionWithPage(cond);
            int count = this.userService.findUserCountByCondition(cond);
            pageInfo.setData(list);
            pageInfo.setRecordsTotal(count);
        } catch (BigOpsException e) {
            logger.error("findUserList pageInfo:" + JSONObject.toJSONString(pageInfo) + ", cond:" + JSONObject.toJSONString(cond), e);
        } catch (Exception ex) {
            logger.error("findUserList pageInfo:" + JSONObject.toJSONString(pageInfo) + ", cond:" + JSONObject.toJSONString(cond), ex);
        }
        return pageInfo;
    }

}
