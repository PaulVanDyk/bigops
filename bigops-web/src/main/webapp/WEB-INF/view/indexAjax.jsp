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
    <%@include file="layout/head.jsp"%>
    <!-- END HEAD -->
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-sidebar-fixed">
    <div class="page-wrapper">
        <!-- BEGIN HEADER -->
        <%@include file="layout/page-header.jsp"%>
        <!-- END HEADER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <%@include file="layout/page-treebar.jsp"%>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                    <!-- BEGIN PAGE HEADER-->
                    <!-- BEGIN THEME PANEL -->
                    <%@include file="layout/page-theme-panel.jsp"%>
                    <!-- END THEME PANEL -->
                    <!-- BEGIN PAGE BAR -->
                    <div class="page-bar">
                        <ul class="page-breadcrumb">
                            <li>
                                <a href="index.html">Home</a>
                                <i class="fa fa-circle"></i>
                            </li>
                            <li>
                                <span>Page Layouts</span>
                            </li>
                        </ul>
                        <div class="page-toolbar">
                            <div class="btn-group pull-right">
                                <button type="button" class="btn green btn-sm btn-outline dropdown-toggle" data-toggle="dropdown"> Actions
                                    <i class="fa fa-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu pull-right" role="menu">
                                    <li>
                                        <a href="#">
                                            <i class="icon-bell"></i> Action</a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-shield"></i> Another action</a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-user"></i> Something else here</a>
                                    </li>
                                    <li class="divider"> </li>
                                    <li>
                                        <a href="#">
                                            <i class="icon-bag"></i> Separated link</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- END PAGE BAR -->
                    <!-- BEGIN PAGE TITLE-->
                    <h1 class="page-title"> Ajax Content Page
                        <small>loading content via ajax</small>
                    </h1>
                    <!-- END PAGE TITLE-->
                    <!-- END PAGE HEADER-->
                    <div class="page-content-body">
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
                                <p> 3. Use <code>Layout.loadAjaxContent('some_url.php')</code> to load an ajax content programmatically </p>
                                <p> 4. Use <code>Layout.addAjaxContentSuccessCallback(function(res){ // res is ajax response object })</code> to add ajax success callback function </p>
                                <p>Use <code>Layout.addAjaxContentErrorCallback(function(res){ // res is ajax response object })</code> to add ajax error callback function</p>
                            </div>
                            <div class="direct-content">
                                <div class="content-title">
                                    <div class="actions">
                                        <a href="javascript:;" onclick="$('.direct').toggleClass('direct-open');" class="btn btn-icon-only purple">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                    <div class="caption">
                                        <span class="bold">Quick Info</span>
                                    </div>
                                </div>
                                <div class="content-body">
                                    <h3>This is direct-content-body</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            <!-- BEGIN QUICK SIDEBAR -->
            <%@include file="layout/page-quick-sidebar.jsp"%>
            <!-- END QUICK SIDEBAR -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <%@include file="layout/page-footer.jsp"%>
        <!-- END FOOTER -->
    </div>
    <!-- BEGIN QUICK NAV -->
    <%@include file="layout/page-quick-nav.jsp"%>
    <!-- END QUICK NAV -->
    <%@include file="layout/foot.jsp"%>
</body>
</html>
