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
        <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px">
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
                <form class="sidebar-search  " action="page_general_search_3.html" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                                            <a href="javascript:;" class="btn submit">
                                                <i class="icon-magnifier"></i>
                                            </a>
                                        </span>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="nav-item active">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-folder"></i>
                    <span class="title">Section 1</span>
                    <span class="arrow open"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item active">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-settings"></i> Child Section
                            <span class="arrow open"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_1.html" class="ajaxify nav-link">
                                    <i class="icon-camera"></i> Sample Link 1</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_2.html" class="ajaxify nav-link">
                                    <i class="icon-link"></i> Sample Link 2</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_3.html" class="ajaxify nav-link">
                                    <i class="icon-pointer"></i> Sample Link 3</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_4.html" class="ajaxify nav-link">
                                    <i class="icon-camera"></i> Sample Link 4</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_5.html" class="ajaxify nav-link">
                                    <i class="icon-link"></i> Sample Link 5</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_1.html" class="ajaxify nav-link">
                                    <i class="icon-pointer"></i> Sample Link 6</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item open">
                        <a href="javascript:;" target="_blank" class="nav-link">
                            <i class="icon-globe"></i> Arrow Toggle
                            <span class="arrow nav-toggle"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_2.html" class="ajaxify nav-link">
                                    <i class="icon-camera"></i> Sample Link 1</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_3.html" class="ajaxify nav-link">
                                    <i class="icon-link"></i> Sample Link 2</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_4.html" class="ajaxify nav-link">
                                    <i class="icon-pointer"></i> Sample Link 3</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_5.html" class="ajaxify nav-link">
                                    <i class="icon-camera"></i> Sample Link 4</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_1.html" class="ajaxify nav-link">
                                    <i class="icon-link"></i> Sample Link 5</a>
                            </li>
                            <li class="nav-item">
                                <a href="layout_ajax_page_content_2.html" class="ajaxify nav-link">
                                    <i class="icon-pointer"></i> Sample Link 6</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="layout_ajax_page_content_3.html" class="ajaxify nav-link">
                    <i class="icon-bar-chart"></i> Section 2</a>
            </li>
            <li class="nav-item">
                <a href="layout_ajax_page_content_4.html" class="ajaxify nav-link">
                    <i class="icon-user"></i> Section 3</a>
            </li>
            <li class="nav-item">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-folder"></i>
                    <span class="title">Section 4</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="layout_ajax_page_content_5.html" class="ajaxify nav-link">
                            <i class="icon-camera"></i> Sample Link 1</a>
                    </li>
                    <li class="nav-item">
                        <a href="layout_ajax_page_content_1.html" class="ajaxify nav-link">
                            <i class="icon-link"></i> Sample Link 2</a>
                    </li>
                    <li class="nav-item">
                        <a href="layout_ajax_page_content_2.html" class="ajaxify nav-link">
                            <i class="icon-pointer"></i> Sample Link 3</a>
                    </li>
                    <li class="nav-item">
                        <a href="layout_ajax_page_content_3.html" class="ajaxify nav-link">
                            <i class="icon-camera"></i> Sample Link 4</a>
                    </li>
                    <li class="nav-item">
                        <a href="layout_ajax_page_content_4.html" class="ajaxify nav-link">
                            <i class="icon-link"></i> Sample Link 5</a>
                    </li>
                    <li class="nav-item">
                        <a href="layout_ajax_page_content_5.html" class="ajaxify nav-link">
                            <i class="icon-pointer"></i> Sample Link 6</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->