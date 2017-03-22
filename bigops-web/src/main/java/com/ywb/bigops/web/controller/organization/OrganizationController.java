package com.ywb.bigops.web.controller.organization;

import com.ywb.bigops.common.util.BigOpsException;
import com.ywb.bigops.domain.organization.OrganizationCondition;
import com.ywb.bigops.domain.organization.OrganizationDomain;
import com.ywb.bigops.domain.user.UserCondition;
import com.ywb.bigops.domain.user.UserDomain;
import com.ywb.bigops.service.organization.OrganizationService;
import com.ywb.bigops.service.user.UserService;
import com.ywb.bigops.web.controller.BaseController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            condition.setSortField("createTime");
            condition.setSortDesc("DESC");
            condition.setPageIndex(0);
            condition.setPageSize(Integer.MAX_VALUE);
            List<OrganizationDomain> organizationList = this.organizationService.findOrganizationListByConditionWithPage(condition);
            if (null != organizationList) {
                for (OrganizationDomain domain : organizationList) {
                    node = new HashMap();
                    node.put("id", domain.getOid());
                    node.put("text", domain.getOname());
                    node.put("parent", domain.getPid() == 0 ? "#" : domain.getPid());
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

}
