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
    <%@include file="../layout/head.jsp"%>
    <link href="<%=contextPath%>/assets/global/plugins/icheck/skins/all.css" rel="stylesheet" type="text/css" />
    <!-- END HEAD -->
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-fixed">
    <div class="page-wrapper">
        <!-- BEGIN HEADER -->
        <%@include file="../layout/page-header.jsp"%>
        <!-- END HEADER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <%@include file="../layout/page-treebar.jsp"%>
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
                        <div class="full-height-content-body">
                        <div class="note note-info">
                            <p> Page contents can be loaded via ajax. To enable ajax content loading for the sidebar menu you can follow below steps: </p>
                        </div>
                        <div class="portlet light bordered direct">
                            <div class="portlet-title">
                                <div class="caption">
                                    <i class="icon-share font-dark hide"></i>
                                    <span class="caption-subject font-dark bold uppercase">Quick Info</span>
                                </div>
                                <div class="actions">
                                    <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                        <i class="icon-cloud-upload"></i>
                                    </a>
                                    <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                        <i class="icon-wrench"></i>
                                    </a>
                                    <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;"> </a>
                                    <a class="btn btn-circle btn-icon-only btn-default" href="javascript:;">
                                        <i class="icon-trash"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="portlet-body">
                                <a href="javascript:void(0);" onclick="$('.direct').toggleClass('direct-open');">direct</a>
                                <p> 1. Add a DIV wrapper with <code>page-content-body</code> class under <code>page-content</code> DIV of the page content. </p>
                                <p> 2. Apply <code>ajaxify nav-link</code> class to links of the sidebar menu and specify the content URL using <code>href="some_ajax_content.php"</code> link attribute. </p>
                                <p> 3. Use <code>../layout.loadAjaxContent('some_url.php')</code> to load an ajax content programmatically </p>
                                <p> 4. Use <code>../layout.addAjaxContentSuccessCallback(function(res){ // res is ajax response object })</code> to add ajax success callback function </p>
                                <p>Use <code>../layout.addAjaxContentErrorCallback(function(res){ // res is ajax response object })</code> to add ajax error callback function</p>
                            </div>
                            <div class="direct-content">
                                <div class="portlet mt-element-ribbon">
                                    <div class="ribbon ribbon-right ribbon-clip ribbon-shadow ribbon-border-dash-hor ribbon-color-success uppercase">
                                        <div class="ribbon-sub ribbon-clip ribbon-right"></div>
                                        Portlet Ribbon
                                    </div>
                                    <div class="portlet-title">
                                    </div>
                                    <div class="portlet-body">
                                    </div>
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
            <%@include file="../layout/page-quick-sidebar.jsp"%>
            <!-- END QUICK SIDEBAR -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <%@include file="../layout/page-footer.jsp"%>
        <!-- END FOOTER -->


        <!-- BEGIN DIALOG -->
        <!-- END DIALOG -->
    </div>
    <!-- BEGIN QUICK NAV -->
    <%@include file="../layout/page-quick-nav.jsp"%>
    <!-- END QUICK NAV -->
    <%@include file="../layout/foot.jsp"%>
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="<%=contextPath%>/assets/global/plugins/icheck/icheck.min.js" type="text/javascript"></script>
    <script src="<%=contextPath%>/assets/pages/scripts/user.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
</body>
</html>
