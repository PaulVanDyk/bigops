<%--
  Created by IntelliJ IDEA.
  User: Erlei Chen
  Date: 2017/3/13
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
    <!-- BEGIN SIDEBAR -->
    <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
    <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
    <div class="page-sidebar navbar-collapse collapse">
        <!-- BEGIN SIDEBAR MENU -->
        <!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
        <!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
        <!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
        <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
        <!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
        <!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true"
            data-slide-speed="200" style="padding-top: 20px; padding-bottom: 50px;">
            <!-- DOC: To remove the sidebar toggler from the sidebar you just need to completely remove the below "sidebar-toggler-wrapper" LI element -->
            <li class="sidebar-toggler-wrapper hide">
                <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                <div class="sidebar-toggler">
                    <span></span>
                </div>
                <!-- END SIDEBAR TOGGLER BUTTON -->
            </li>
            <!-- DOC: To remove the search box from the sidebar you just need to completely remove the below "sidebar-search-wrapper" LI element -->
            <li class="sidebar-search-wrapper">
                <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                <!-- DOC: Apply "sidebar-search-bordered" class the below search form to have bordered search box -->
                <!-- DOC: Apply "sidebar-search-bordered sidebar-search-solid" class the below search form to have bordered & solid search box -->
                <form class="sidebar-search  " action="#" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" id="txt_regex" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                                            <a href="javascript:;" class="btn" onclick="Tree.filterTree()">
                                                <i class="icon-magnifier"></i>
                                            </a>
                                        </span>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="nav-item" style="padding: 5px;">
                <div class="btn-group btn-group-devided" data-toggle="buttons">
                    <a href="javascript:;" id="treebar_expand" class="btn btn-xs blue">展开</a>
                    <a href="javascript:;" id="treebar_folding" class="btn btn-xs green">折叠</a>
                </div>
            </li>
            <li class="nav-item">
                <%--<a href="layout_ajax_page_content_3.html" class="ajaxify nav-link">--%>
                <%--<i class="icon-bar-chart"></i> Section 2</a>--%>
                <div id="tree_org" class="tree-demo bg-trans" style="background-color: transparent;"></div>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->
<!-- BEGIN DIALOG -->
<div id="modal_org" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">添加部门</h4>
    </div>
    <div class="modal-body">
        <form id="org-form" class="form-horizontal" action="/organization/addOrg.do" method="post">
            <div class="form-body">
                <div class="form-group">
                    <label class="col-md-3 control-label">部门名称：</label>
                    <div class="col-md-8">
                        <input type="hidden" id="org_ids" name="ids">
                        <input type="hidden" id="pid" name="pid">
                        <input type="text" id="oname" name="oname" class="form-control" placeholder="请输入部门名称">
                        <input type="text" name="shieldAutoSubmit" class="form-control hide" placeholder="屏蔽回车自动提交">
                        <%--<span class="help-block"> A block of help text. </span>--%>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn btn-outline dark">取消</button>
        <button type="button" class="btn green" data-type="add">添加</button>
    </div>
</div>
<div id="modal_user" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">添加成员</h4>
    </div>
    <div class="modal-body">
        <form id="user-form" class="form-horizontal" role="form" action="/user/addUser.do" method="post">
            <div class="form-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">姓名:</label>
                            <div class="col-md-8">
                                <input type="hidden" id="user_ids" name="ids">
                                <input type="text" class="form-control" id="input_realname" name="realname">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">性别:</label>
                            <div class="col-md-8">
                                <div class="mt-radio-inline">
                                    <label class="mt-radio">
                                        <input type="radio" name="gender" id="input_gender_1" value="1" checked> 男
                                        <span></span>
                                    </label>
                                    <label class="mt-radio">
                                        <input type="radio" name="gender" id="input_gender_0" value="0"> 女
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">年龄:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="input_age" name="age">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">用户类型:</label>
                            <div class="col-md-8">
                                <div class="mt-radio-inline">
                                    <label class="mt-radio">
                                        <input type="radio" name="isAdmin" id="input_idAdmin_0" value="0" checked> 普通用户
                                        <span></span>
                                    </label>
                                    <label class="mt-radio">
                                        <input type="radio" name="isAdmin" id="input_idAdmin_1" value="1"> 管理员
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">所属机构:</label>
                            <div class="col-md-8">
                                <input type="hidden" class="form-control" id="input_organizationId"
                                       name="organizationId">
                                <input type="text" class="form-control" id="input_organizationName"
                                       name="organizationName">
                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class="row">--%>
                <%--<div class="col-md-12">--%>
                <%--<div class="form-group">--%>
                <%--<label class="control-label col-md-3">到期时间:</label>--%>
                <%--<div class="col-md-8">--%>
                <%--<input type="text" class="form-control" id="input_expires" name="expires">--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</div>--%>
                <h3 class="form-section">联系方式</h3>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">电话:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="input_mobile" name="mobile">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">邮箱:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="input_email" name="email">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="control-label col-md-3">IM:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="input_im1" name="im1">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn btn-outline dark">取消</button>
        <button type="button" class="btn green" data-type="add">添加</button>
    </div>
</div>
<div id="modal_orgSelect" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">选择部门</h4>
    </div>
    <div class="modal-body bg-blue-chambray" style="height: 550px;">
        <div id="tree_orgSelect" class="tree-demo bg-trans"></div>
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn btn-outline dark">取消</button>
        <button type="button" class="btn green">确定</button>
    </div>
</div>
<!-- END DIALOG -->
<script src="<%=contextPath%>/assets/pages/scripts/tree.js" type="text/javascript"></script>
<SCRIPT type="text/javascript">
    $(document).ready(function () {
    });
</SCRIPT>