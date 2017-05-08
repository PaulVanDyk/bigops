<%--
  Created by IntelliJ IDEA.
  User: Erlei Chen
  Date: 2016/8/26
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
    <!-- BEGIN HEAD -->
    <%@include file="../layout/head.jsp" %>
    <link href="<%=contextPath%>/assets/global/plugins/icheck/skins/all.css" rel="stylesheet" type="text/css"/>
    <link href="<%=contextPath%>/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <!-- END HEAD -->
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-fixed">
<div class="page-wrapper">
    <!-- BEGIN HEADER -->
    <%@include file="../layout/page-header.jsp" %>
    <!-- END HEADER -->
    <!-- BEGIN CONTAINER -->
    <div class="page-container">
        <!-- BEGIN SIDEBAR -->
        <%@include file="page-orgtree.jsp" %>
        <!-- END SIDEBAR -->
        <!-- BEGIN CONTENT -->
        <div class="page-content-wrapper">
            <!-- BEGIN CONTENT BODY -->
            <div class="page-content">
                <!-- BEGIN PAGE HEADER-->
                <!-- BEGIN THEME PANEL -->
                <%--<%@include file="../layout/page-theme-panel.jsp"%>--%>
                <!-- END THEME PANEL -->
                <!-- BEGIN PAGE BAR -->
                <div class="page-bar">
                    <ul class="page-breadcrumb">
                        <li>
                            <span style="font-size: 24px;">运维帮科技</span>
                        </li>
                        <%--<li class="mgl10">--%>
                        <%--<button type="button" class="btn btn-xs blue editName">修改名称</button>--%>
                        <%--</li>--%>
                        <%--<li class="mgl10">--%>
                        <%--<button type="button" class="btn btn-xs blue newOrg">新建子部门</button>--%>
                        <%--</li>--%>
                        <%--<li class="mgl10">--%>
                        <%--<button type="button" class="btn btn-xs red del">删除</button>--%>
                        <%--</li>--%>
                        <%--<li class="mgl10">--%>
                        <%--<button type="button" class="btn btn-xs blue newUser">新增成员</button>--%>
                        <%--</li>--%>
                    </ul>
                    <%--<div class="page-toolbar">--%>
                    <%--<button type="button" class="btn btn-xs default">修改名字</button>--%>
                    <%--</div>--%>
                </div>
                <!-- END PAGE BAR -->
                <div class="page-title">
                    <form class="form-inline" id="search_form">
                        <label class="mt-checkbox mt-checkbox-outline mt-checkbox-disabled">
                            <input id="showAll" disabled type="checkbox"> 显示所有成员
                            <span></span>
                        </label>
                        <div class="form-group">
                            <label class="sr-only" for="txtSearch">多维条件检索</label>
                            <input type="text" id="txtSearch" class="form-control input-large" placeholder="多维条件检索">
                        </div>
                        <button type="button" class="btn blue mgl20">搜索</button>
                    </form>
                </div>
                <!-- END PAGE HEADER-->
                <div class="page-content-body full-height-content full-height-content-scrollable">
                    <div class="full-height-content-body direct">
                        <div class="direct-content">
                            <div class="portlet mt-element-ribbon">
                                <div class="ribbon ribbon-right ribbon-clip ribbon-shadow ribbon-border-dash-hor ribbon-color-success uppercase">
                                    <div class="ribbon-sub ribbon-clip ribbon-right"></div>
                                    用户信息
                                </div>
                                <div class="portlet-title">
                                    <div class="mt-comments">
                                        <div class="mt-comment" style="padding: 0px; margin: 0px;">
                                            <div class="mt-comment-img">
                                                <img id="view_img" src="../assets/pages/media/users/avatar1.jpg"></div>
                                            <div class="mt-comment-body">
                                                <div class="mt-comment-info">
                                                    <span id="view_realname" class="mt-comment-author">Michael Baker</span>
                                                    <span id="view_expires" class="mt-comment-date">26 Feb, 10:30AM</span>
                                                </div>
                                                <div id="view_desc" class="mt-comment-text"> Lorem Ipsum is simply dummy text of the printing and
                                                    typesetting industry.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="portlet-body scroller">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">性别:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_gender"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">生日:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_birthday"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">用户类型:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_isAdmin"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">用户状态:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_status"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">工号:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_employId"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">职务:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_title"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">工作部门:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_organizationName"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">用户组:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_userGroupName"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <h3 class="form-section">联系方式</h3>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">手机:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_mobile"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">电话:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_tel"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">邮箱:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_email"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">IM1:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_im1"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="control-label col-md-2">IM2:</label>
                                                        <div class="col-md-10">
                                                            <p class="form-control-static" id="view_im2"> Male </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="portlet-bottom">
                                    <div class="row"> <div class="inline"><button class="btn btn-info mgl15" name="edit" data-value="">编辑</button><button class="btn btn-danger mgl15" name="delete" data-value="">删除</button><button class="btn btn-warning mgl15" name="resetPwd" data-value="">重置密码</button><button class="btn btn-default mgl15" name="close">关闭</button></div></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END CONTENT BODY -->
        </div>
        <!-- END CONTENT -->
        <!-- BEGIN QUICK SIDEBAR -->
        <%@include file="../layout/page-quick-sidebar.jsp" %>
        <!-- END QUICK SIDEBAR -->
    </div>
    <!-- END CONTAINER -->
    <!-- BEGIN FOOTER -->
    <%@include file="../layout/page-footer.jsp" %>
    <!-- END FOOTER -->


    <!-- BEGIN DIALOG -->
    <!-- END DIALOG -->
</div>
<!-- BEGIN QUICK NAV -->
<%@include file="../layout/page-quick-nav.jsp" %>
<!-- END QUICK NAV -->
<%@include file="../layout/foot.jsp" %>
<!-- BEGIN DIALOG -->
<div id="modal_orgSelect" class="modal fade" tabindex="-1" data-backdrop="static" data-keyboard="false">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
        <h4 class="modal-title">选择部门</h4>
    </div>
    <div class="modal-body bg-blue-chambray scroller" style="height: 550px; padding: 15px;">
        <div id="tree_orgSelect" class="tree-demo bg-trans"></div>
    </div>
    <div class="modal-footer">
        <button type="button" data-dismiss="modal" class="btn btn-outline dark">取消</button>
        <button type="button" class="btn green">确定</button>
    </div>
</div>
<!-- END DIALOG -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=contextPath%>/assets/global/plugins/icheck/icheck.min.js" type="text/javascript"></script>
<script src="<%=contextPath%>/assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="<%=contextPath%>/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=contextPath%>/assets/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
<script src="<%=contextPath%>/assets/pages/scripts/user/user.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>
