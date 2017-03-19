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
                <form class="sidebar-search  " action="#" method="POST">
                    <a href="javascript:;" class="remove">
                        <i class="icon-close"></i>
                    </a>
                    <div class="input-group">
                        <input type="text" id="txt_regex" class="form-control" placeholder="Search...">
                        <span class="input-group-btn">
                                            <a href="javascript:;" class="btn" onclick="filterTree()">
                                                <i class="icon-magnifier"></i>
                                            </a>
                                        </span>
                    </div>
                </form>
                <!-- END RESPONSIVE QUICK SEARCH FORM -->
            </li>
            <li class="nav-item">
                <%--<a href="layout_ajax_page_content_3.html" class="ajaxify nav-link">--%>
                    <%--<i class="icon-bar-chart"></i> Section 2</a>--%>
                    <div id="tree_org" class="tree-demo bg-trans" style="background-color: transparent;"> </div>
            </li>
        </ul>
        <!-- END SIDEBAR MENU -->
        <!-- END SIDEBAR MENU -->
    </div>
    <!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->
<SCRIPT type="text/javascript">
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        view: {
            showLine: false
        }
    };

    var zNodes =[
        { id:1, pId:0, name:"父节点1 - 展开", url:"../login/login.jsp", open:true},
        { id:11, pId:1, name:"父节点11 - 折叠", click:"Layout.loadAjaxContent('/user/findUserList.do?start=1&length=10')"},
        { id:111, pId:11, name:"叶子节点111", click:"Layout.loadAjaxContent('/user/indexAjax.do?employId=1',$(this))"},
        { id:112, pId:11, name:"叶子节点112"},
        { id:113, pId:11, name:"叶子节点113"},
        { id:114, pId:11, name:"叶子节点114"},
        { id:12, pId:1, name:"父节点12 - 折叠"},
        { id:121, pId:12, name:"叶子节点121"},
        { id:122, pId:12, name:"叶子节点122"},
        { id:123, pId:12, name:"叶子节点123"},
        { id:124, pId:12, name:"叶子节点124"},
        { id:13, pId:1, name:"父节点13 - 没有子节点", isParent:true},
        { id:131, pId:13, name:"叶子节点131"},
        { id:132, pId:13, name:"叶子节点132"},
        { id:133, pId:13, name:"叶子节点133"},
        { id:134, pId:13, name:"叶子节点134"},
        { id:2, pId:0, name:"父节点2 - 折叠"},
        { id:21, pId:2, name:"父节点21 - 展开", open:true},
        { id:211, pId:21, name:"叶子节点211"},
        { id:212, pId:21, name:"叶子节点212"},
        { id:213, pId:21, name:"叶子节点213"},
        { id:214, pId:21, name:"叶子节点214"},
        { id:22, pId:2, name:"父节点22 - 折叠"},
        { id:221, pId:22, name:"叶子节点221"},
        { id:222, pId:22, name:"叶子节点222"},
        { id:223, pId:22, name:"叶子节点223"},
        { id:224, pId:22, name:"叶子节点224"},
        { id:23, pId:2, name:"父节点23 - 折叠"},
        { id:231, pId:23, name:"叶子节点231"},
        { id:232, pId:23, name:"叶子节点232"},
        { id:233, pId:23, name:"叶子节点233"},
        { id:234, pId:23, name:"叶子节点234"},
        { id:3, pId:0, name:"父节点3 - 没有子节点", isParent:true},
        { id:31, pId:3, name:"叶子节点31"},
        { id:311, pId:31, name:"叶子节点311"},
        { id:312, pId:31, name:"叶子节点312"},
        { id:313, pId:31, name:"叶子节点313"},
        { id:314, pId:31, name:"叶子节点314"},
        { id:32, pId:3, name:"叶子节点32"},
        { id:321, pId:32, name:"叶子节点321"},
        { id:322, pId:32, name:"叶子节点322"},
        { id:323, pId:32, name:"叶子节点323"},
        { id:324, pId:32, name:"叶子节点324"},
        { id:33, pId:3, name:"叶子节点33"},
        { id:331, pId:33, name:"叶子节点331"},
        { id:332, pId:33, name:"叶子节点332"},
        { id:333, pId:33, name:"叶子节点333"},
        { id:334, pId:33, name:"叶子节点334"},
        { id:34, pId:3, name:"叶子节点34"},
        { id:341, pId:34, name:"叶子节点341"},
        { id:342, pId:34, name:"叶子节点342"},
        { id:343, pId:34, name:"叶子节点343"},
        { id:344, pId:34, name:"叶子节点344"},
        { id:4, pId:0, name:"父节点4 - 没有子节点", isParent:true},
        { id:41, pId:4, name:"叶子节点34", isParent:true}

    ];

    $(document).ready(function(){
        $("#tree_org").jstree({
            "core" : {
                "themes" : {
                    "name" : "default-dark",
                    "responsive": false
                },
                // so that create works
                "check_callback" : true,
                'data': [{
                    "text": "Parent Node",
                    "children": [{
                        "text": "Initially selected",
                        "state": {
                            "selected": true
                        }
                    }, {
                        "text": "Custom Icon",
                        "icon": "fa fa-warning icon-state-danger"
                    }, {
                        "text": "Initially open",
                        "icon" : "fa fa-folder icon-state-success",
                        "state": {
                            "opened": true
                        },
                        "children": [
                            {"text": "Another node", "icon" : "fa fa-file icon-state-warning"}
                        ]
                    }, {
                        "text": "Another Custom Icon",
                        "icon": "fa fa-warning icon-state-warning"
                    }, {
                        "text": "Disabled Node",
                        "icon": "fa fa-check icon-state-success",
                        "state": {
                            "disabled": true
                        }
                    }, {
                        "text": "Sub Nodes",
                        "icon": "fa fa-folder icon-state-danger",
                        "children": [
                            {"text": "Item 1", "icon" : "fa fa-file icon-state-warning", "li_attr":{"type":"leaf"}},
                            {"text": "Item 2", "icon" : "fa fa-file icon-state-success", "li_attr":{"type":"leaf"}},
                            {"text": "Item 3", "icon" : "fa fa-file icon-state-default", "li_attr   ":{"type":"node"}},
                            {"text": "Item 4", "icon" : "fa fa-file icon-state-danger"},
                            {"text": "Item 5", "icon" : "fa fa-file icon-state-info"}
                        ]
                    }]
                },
                    "Another Node"
                ]
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder icon-state-warning icon-lg"
                },
                "file" : {
                    "icon" : "fa fa-file icon-state-warning icon-lg"
                }
            },
            "state" : { "key" : "demo2" },
            "contextmenu": {
                "items": {
                    "create": {
                        "label": "添加",
                        "_disabled": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
//                            console.info(obj.li_attr.type=    ="leaf");
                            return obj.li_attr.type=="leaf";
                        },
                        "action": function (data) {
                            var inst = $.jstree.reference(data.reference),
                                obj = inst.get_node(data.reference);
                            inst.create_node(obj, {}, "last", function (new_node) {
                                setTimeout(function () {
                                    inst.edit(new_node);
                                }, 0);
                            })
                        }
                    }
                }
            },
            "plugins" : [ "wholerow", "search", "contextmenu", "dnd", "state", "types" ]
        });
//        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
    });

    function filterTree() {
        var regex = $("#txt_regex").val().trim();
        var to = false;
        if (to) {
            clearTimeout(to);
        }
        to = setTimeout(function () {
            var v = $("#txt_regex").val().trim();
            $('#tree_org').jstree(true).search(v);
        }, 250);
    }
</SCRIPT>