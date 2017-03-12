<%--
  Created by IntelliJ IDEA.
  User: Erlei Chen
  Date: 2016/8/26
  Time: 14:04
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
        <ul class="page-sidebar-menu   " data-keep-expanded="true" data-auto-scroll="true" data-slide-speed="200">
            <li class="nav-item start ">
                <a href="/" class="nav-link nav-toggle">
                    <i class="icon-home"></i>
                    <span class="title">首页</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu hide">
                    <li class="nav-item start ">
                        <a href="<%=contextPath%>/index.do" class="nav-link ">
                            <i class="icon-bar-chart"></i>
                            <span class="title">Dashboard 1</span>
                        </a>
                    </li>
                    <li class="nav-item start ">
                        <a href="<%=contextPath%>/indexAjax.do" class="nav-link ">
                            <i class="icon-bulb"></i>
                            <span class="title">Dashboard 2</span>
                            <span class="badge badge-success">1</span>
                        </a>
                    </li>
                    <li class="nav-item start ">
                        <a href="#" class="nav-link ">
                            <i class="icon-graph"></i>
                            <span class="title">Dashboard 3</span>
                            <span class="badge badge-danger">5</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="heading">
                <h3 class="uppercase">模块</h3>
            </li>
            <li class="nav-item  ">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-game-controller"></i>
                    <span class="title">游戏管理</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item  ">
                        <a href="<%=contextPath%>/plane/gotoPlaySeason.do" class="nav-link ">
                            <span class="title">赛季管理</span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link ">
                            <span class="title">飞机管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoPlaneManageBasic.do" class="nav-link ">普通飞机</a>
                            </li>
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoPlaneManageHot.do" class="nav-link ">热点飞机</a>
                            </li>
                            <%--<li class="nav-item ">--%>
                                <%--<a href="<%=contextPath%>/plane/gotoPlaneGroup.do" class="nav-link ">分组管理</a>--%>
                            <%--</li>--%>
                        </ul>
                    </li>
                    <li class="nav-item  ">
                        <a href="javascript:;" class="nav-link ">
                            <span class="title">关卡设置</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoPlanePass.do" class="nav-link ">关卡管理</a>
                            </li>
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoPlanePassDetail.do" class="nav-link ">配置管理</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item  ">
                        <a href="" class="nav-link ">
                            <span class="title">奖品管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoRedPacketPrize.do" class="nav-link "> 红包奖品 </a>
                            </li>
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoGoodsPrize.do" class="nav-link "> 实物奖品 </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item ">
                        <a href="<%=contextPath%>/plane/gotoByCash.do" class="nav-link ">
                            <span class="title">提现信息管理</span>
                            <%--<span class="badge badge-success">2</span>--%>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a href="<%=contextPath%>/plane/gotoPlanePush.do" class="nav-link ">
                            <span class="title">公告管理</span>
                        </a>
                    </li>
                    <li class="nav-item  ">
                        <a href="" class="nav-link ">
                            <span class="title">BI分析</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoPlanePutRecord.do" class="nav-link "> 红包投放日报 </a>
                            </li>
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoActiveAnalyze.do" class="nav-link "> 日活分析 </a>
                            </li>
                        </ul>
                    </li>
                    <%--<li class="nav-item  ">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <span class="title">兑换管理</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoByCash.do" class="nav-link "> 必要奖励 </a>
                            </li>
                            <li class="nav-item ">
                                <a href="<%=contextPath%>/plane/gotoRankCash.do" class="nav-link ">
                                    排行榜奖励 </a>
                            </li>
                        </ul>
                    </li>--%>
                    <li class="nav-item hide">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <span class="title">三级菜单模板</span>
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item ">
                                <a href="#" class="nav-link "> 菜单1 </a>
                            </li>
                            <li class="nav-item ">
                                <a href="#" class="nav-link "> 菜单2 </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="heading hide">
                <h3 class="uppercase">设置</h3>
            </li>
            <li class="nav-item hide">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-settings"></i>
                    <span class="title">System</span>
                    <span class="arrow"></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item  ">
                        <a href="#" class="nav-link ">
                            <span class="title">Item 1</span>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item hide">
                <a href="javascript:;" class="nav-link nav-toggle">
                    <i class="icon-folder"></i>
                    <span class="title">Multi Level Menu</span>
                    <span class="arrow "></span>
                </a>
                <ul class="sub-menu">
                    <li class="nav-item">
                        <a href="javascript:;" class="nav-link nav-toggle">
                            <i class="icon-settings"></i> Item 1
                            <span class="arrow"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item">
                                <a href="#" target="_blank" class="nav-link">
                                    <i class="icon-user"></i> Arrow Toggle
                                    <span class="arrow nav-toggle"></span>
                                </a>
                                <ul class="sub-menu">
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="icon-power"></i> Sample Link 1</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="icon-paper-plane"></i> Sample Link 2</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="#" class="nav-link">
                                            <i class="icon-star"></i> Sample Link 3</a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon-camera"></i> Sample Link 1</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon-link"></i> Sample Link 2</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon-pointer"></i> Sample Link 3</a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="?p=dashboard-2" target="_blank" class="nav-link">
                            <i class="icon-globe"></i> Arrow Toggle
                            <span class="arrow nav-toggle"></span>
                        </a>
                        <ul class="sub-menu">
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon-tag"></i> Sample Link 1</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon-pencil"></i> Sample Link 1</a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="icon-graph"></i> Sample Link 1</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->
