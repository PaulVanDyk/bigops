/**
 * Created by dream on 2017/3/25.
 */
var Tree = function () {
    /**
     * 初始化页面插件
     * @private
     */
    var _initPlugin = function () {
        //自定义部门名称校验方法
        jQuery.validator.addMethod("checkOrgName", function (value, element) {
            var returnVal = false;
            var selected = $('#tree_org').jstree().get_selected(true);
            var parentId = selected[0].id;

            $.ajax({
                type: "POST",
                url: "/organization/checkOrgName.do",
                data: {
                    orgName: value,
                    pid: parentId
                },
                async: false,
                success: function (data) {
                    if (data) {
                        returnVal = true;
                    }
                }
            });
            return returnVal;
        }, "部门名称不能重复");

        initTree();
    };

    /**
     * 初始化页面事件
     * @private
     */
    var _bindHandle = function () {
        //展开
        $("#treebar_expand").on("click", function () {
            var selected = $('#tree_org').jstree().get_selected(true);
            if (selected && selected.length > 0 && selected[0].type.indexOf("male") == -1 && selected[0].type.indexOf("female") == -1) {
                $("#tree_org").jstree(true).open_all(selected[0]);
            } else {
                toastr.warning("请选择部门", undefined, {"positionClass": "toast-top-full-width"});
            }
        });
        //折叠
        $("#treebar_folding").on("click", function () {
            var selected = $('#tree_org').jstree().get_selected(true);
            if (selected && selected.length > 0 && selected[0].type.indexOf("male") == -1 && selected[0].type.indexOf("female") == -1) {
                $("#tree_org").jstree(true).close_all(selected[0]);
            } else {
                toastr.warning("请选择部门", undefined, {"positionClass": "toast-top-full-width"});
            }
        });

        //选择部门
        $("#modal_user #input_organizationName").on("click", function () {
            if ($("#modal_orgSelect #tree_orgSelect").jstree(true)) {
                var oids = $("#modal_user #input_organizationId").val();
                oids = oids ? oids.split(",") : [];
                $("#modal_orgSelect #tree_orgSelect").jstree().uncheck_all();
                $("#modal_orgSelect #tree_orgSelect").jstree().select_node(oids);
                $("#modal_orgSelect #tree_orgSelect").jstree().deselect_all();
                $("#modal_orgSelect #tree_orgSelect").jstree().check_node(oids);
            } else {
                $("#modal_orgSelect #tree_orgSelect").jstree({
                    "core": {
                        "themes": {
                            "name": "default-dark",
                            "responsive": false
                        },
                        // so that create works
                        "check_callback": true,
                        'data': {
                            "url": "/organization/lazyOrgList.do"
                        }
                    },
                    "checkbox": {
                        "keep_selected_style": false,
                        "three_state": false,
                        "cascade": "",
                        "tie_selection": false
                    },
                    "types": {
                        "#": {
                            "icon": "fa fa-folder icon-state-info icon-lg",
                            "valid_children": []
                        },
                        "root": {
                            "icon": "fa fa-folder icon-state-info icon-lg",
                            "valid_children": ["default", "static-default"]
                        },
                        "static": {
                            "icon": "fa fa-folder icon-state-danger icon-lg",
                            "valid_children": ["default", "static-default"]
                        },
                        "default": {
                            "icon": "fa fa-folder icon-state-warning icon-lg",
                            "valid_children": ["default", "static-default"]
                        },
                        "static-default": {
                            "icon": "fa fa-folder icon-state-warning icon-lg",
                            "valid_children": ["default", "static-default"]
                        }
                    },
                    "plugins": ["checkbox", "types"]
                });
                $("#modal_orgSelect #tree_orgSelect").on("check_node.jstree", function (node, selected, e) {
                    $.each(selected.node.parents, function () {
                        selected.instance.uncheck_node(this);
                    });
                    unCheckChildRecursive(selected.node, selected.instance);
                });
                $("#modal_orgSelect #tree_orgSelect").on("ready.jstree", function (e, ins) {
                    var oids = $("#modal_user #input_organizationId").val();
                    oids = oids ? oids.split(",") : [];
                    ins.instance.select_node(oids);
                    ins.instance.deselect_all();
                    ins.instance.check_node(oids);
                });
            }
            $("#modal_orgSelect").modal("show");
        });

        //选择部门回调
        $("#modal_orgSelect .modal-footer .btn.green").on("click", function () {
            var items = $("#tree_orgSelect").jstree(true).get_checked(true);
            var oids = '', onames = '';
            $.each(items, function () {
                oids += "," + this.id;
                onames += "," + this.text;
            });
            $("#modal_user #input_organizationId").val(oids.substr(1));
            $("#modal_user #input_organizationName").val(onames.substr(1));
            $("#modal_orgSelect").modal("hide");
        });
    }

    var _showOrgSelect = function (target) {
        if ($("#modal_orgSelect #tree_orgSelect").jstree(true)) {
            var oids = $(target).val();
            oids = oids ? oids.split(",") : [];
            $("#modal_orgSelect #tree_orgSelect").jstree().uncheck_all();
            $("#modal_orgSelect #tree_orgSelect").jstree().select_node(oids);
            $("#modal_orgSelect #tree_orgSelect").jstree().deselect_all();
            $("#modal_orgSelect #tree_orgSelect").jstree().check_node(oids);
        } else {
            $("#modal_orgSelect #tree_orgSelect").jstree({
                "core": {
                    "themes": {
                        "name": "default-dark",
                        "responsive": false
                    },
                    // so that create works
                    "check_callback": true,
                    'data': {
                        "url": "/organization/lazyOrgList.do"
                    }
                },
                "checkbox": {
                    "keep_selected_style": false,
                    "three_state": false,
                    "cascade": "",
                    "tie_selection": false
                },
                "types": {
                    "#": {
                        "icon": "fa fa-folder icon-state-info icon-lg",
                        "valid_children": []
                    },
                    "root": {
                        "icon": "fa fa-folder icon-state-info icon-lg",
                        "valid_children": ["default", "static-default"]
                    },
                    "static": {
                        "icon": "fa fa-folder icon-state-danger icon-lg",
                        "valid_children": ["default", "static-default"]
                    },
                    "default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg",
                        "valid_children": ["default", "static-default"]
                    },
                    "static-default": {
                        "icon": "fa fa-folder icon-state-warning icon-lg",
                        "valid_children": ["default", "static-default"]
                    }
                },
                "plugins": ["checkbox", "types"]
            });
            $("#modal_orgSelect #tree_orgSelect").on("check_node.jstree", function (node, selected, e) {
                $.each(selected.node.parents, function () {
                    selected.instance.uncheck_node(this);
                });
                unCheckChildRecursive(selected.node, selected.instance);
            });
            $("#modal_orgSelect #tree_orgSelect").on("ready.jstree", function (e, ins) {
                var oids = $(target).val();
                oids = oids ? oids.split(",") : [];
                ins.instance.select_node(oids);
                ins.instance.deselect_all();
                ins.instance.check_node(oids);
            });
        }
        $("#modal_orgSelect").modal("show");
    }

    var initTree = function () {
        $("#tree_org").jstree({
            "core": {
                "themes": {
                    "name": "default-dark",
                    "responsive": false
                },
                // so that create works
                "check_callback": function (operation, node, node_parent, node_position, more) {
                    // operation can be 'create_node', 'rename_node', 'delete_node', 'move_node', 'copy_node' or 'edit'
                    // in case of 'rename_node' node_position is filled with the new node name
                    return operation === 'move_node' ? node.parent != node_parent.id : true;
                },
                'data': {
                    "url": "/organization/lazyList.do"
                    // "data": function (node) {
                    //     return {"pid": node.id === "#" ? "0" : node.id};
                    // }
                }
            },
            "unique": {
                "case_sensitive": true
            },
            "types": {
                "#": {
                    "icon": "fa fa-folder icon-state-info icon-lg",
                    "valid_children": []
                },
                "root": {
                    "icon": "fa fa-folder icon-state-info icon-lg",
                    // "valid_children": ["default", "male", "female", "static-default", "static-male", "static-female"]
                    "valid_children": ["default", "static-default"]
                },
                "static": {
                    "icon": "fa fa-folder icon-state-danger icon-lg",
                    "valid_children": ["default", "static-default"]
                },
                "default": {
                    "icon": "fa fa-folder icon-state-warning icon-lg",
                    // "valid_children": ["default", "male", "female", "static-default", "static-male", "static-female"]
                    "valid_children": ["default", "static-default"]
                },
                "static-default": {
                    "icon": "fa fa-folder icon-state-warning icon-lg",
                    // "valid_children": ["default", "male", "female", "static-default", "static-male", "static-female"]
                    "valid_children": ["default", "static-default"]
                },
                "file": {
                    "icon": "fa fa-file icon-state-default icon-lg"
                },
                "static-male": {
                    "icon": "fa fa-male icon-state-success icon-lg",
                    "valid_children": []
                },
                "static-female": {
                    "icon": "fa fa-female icon-state-danger icon-lg",
                    "valid_children": []
                },
                "male": {
                    "icon": "fa fa-male icon-state-success icon-lg",
                    "valid_children": []
                },
                "female": {
                    "icon": "fa fa-female icon-state-danger icon-lg",
                    "valid_children": []
                }
            },
            "state": {"key": "org1"},
            "contextmenu": {
                "items": {
                    "createOrg": {
                        "label": "添加部门",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type.indexOf("male") != -1 || obj.type.indexOf("female") != -1;
                        },
                        "action": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            _gotoAddOrg(obj);
                        }
                    },
                    "createUser": {
                        "label": "添加用户",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type.indexOf("male") != -1 || obj.type.indexOf("female") != -1;
                        },
                        "action": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            User.gotoAdd(obj.id, obj.text, obj);
                        }
                    },
                    "editOrg": {
                        "label": "修改部门",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type.indexOf("male") != -1 || obj.type.indexOf("female") != -1;
                        },
                        "action": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            _gotoEditOrg(obj);
                        }
                    },
                    "editUser": {
                        "label": "修改用户",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type.indexOf("default") != -1 || obj.type == "root";
                        },
                        "action": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            User.gotoEdit(obj.id.split("_")[1], obj);
                        }
                    },
                    "resetPwd": {
                        "label": "重置密码",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type.indexOf("default") != -1 || obj.type == "root";
                        },
                        "action": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            User.resetPwd(obj.id.split("_")[1], obj);
                        }
                    },
                    "delete": {
                        "label": "删除",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type == "root";
                        },
                        "action": function (data) {
                            var inst = $.jstree.reference(data.reference),
                                obj = inst.get_node(data.reference);
                            swal({
                                    title: "确认删除?",
                                    text: obj.text,
                                    type: "warning",
                                    showCancelButton: true,
                                    cancelButtonText: "取消",
                                    confirmButtonClass: "btn-danger",
                                    confirmButtonText: "确认",
                                    closeOnConfirm: true
                                },
                                function () {
                                    if (obj.type.indexOf("default") != -1) {
                                        delOrg(obj.id);
                                    } else if (obj.type == "male" || obj.type == "female") {
                                        User.delUser(obj.id.split("_")[1]);
                                    }
                                });
                        }
                    }
                }
            },
            "plugins": ["unique", "search", "contextmenu", "dnd", "state", "types"]
        }).on('ready.jstree', function (e, data) {
            var selected = $('#tree_org').jstree(true).get_selected(true)[0];
            if (!selected) {
                var inst = data.instance;
                var obj = inst.get_node(e.target.firstChild.firstChild.lastChild);
                inst.select_node(obj);
                selected = obj;
            }
            $("#" + selected.id + "_anchor").trigger("click");
        });
        $("#tree_org").on("click.jstree", function (e) {
            if (!$(e.target).is("a")) {
                return;
            }
            var inst = $.jstree.reference(e.target),
                node = inst.get_node(e.target);
            if (node) {
                $(".page-container .page-content-wrapper .page-content .page-title").toggleClass("hide", false);
                var type = node.type;
                if (type && (type.indexOf("male") != -1 || type.indexOf("female") != -1)) {
                    $(".page-content .page-bar .page-breadcrumb span").text(inst.get_node(inst.get_parent(node)).text);
                    $("#showAll").attr("checked", false).attr("disabled", true).parent().addClass("mt-checkbox-disabled");
                    Layout.loadAjaxContent('/user/indexAjax.do?params=uid:' + node.id.split("_")[1], $(node));
                } else {
                    $(".page-content .page-bar .page-breadcrumb span").text(node.text);
                    $("#showAll").attr("checked", false).attr("disabled", false).parent().removeClass("mt-checkbox-disabled");
                    Layout.loadAjaxContent('/user/indexAjax.do?params=organizationId:' + node.id, $(node));
                }
            }
        }).on("move_node.jstree", function (e, data) {
            App.blockUI({"target": $("#tree_org"), "animate": true, "iconOnly": true});
            if (data.node.type.indexOf("default") != -1) {
                moveOrg(data.node.id, data.parent);
            } else if (data.node.type.indexOf("male") != -1 || data.node.type.indexOf("female") != -1) {
                var id = data.node.id.split("_")[1];
                User.moveUser(id, data.parent);
            }
        });
    };

    var _gotoAddOrg = function (targetNode) {
        $(".page-container .page-content-wrapper .page-content .page-title").toggleClass("hide", true);
        Layout.loadAjaxContent('/organization/gotoAdd.do?pid=' + targetNode.id + "&pname=" + targetNode.text, $(targetNode));
    };

    var _gotoEditOrg = function (targetNode) {
        $(".page-container .page-content-wrapper .page-content .page-title").toggleClass("hide", true);
        Layout.loadAjaxContent('/organization/gotoEdit.do?id=' + targetNode.id, $(targetNode));
    };


    var _addOrgValidate = function () {
        var addOrgForm = $("#add_orgForm");
        addOrgForm.validate({
            errorElement: 'span',
            errorClass: "help-block help-block-error",
            focusInvalid: false,
            ignore: "",
            rules: {
                oname: {
                    required: true,
                    maxlength: 24,
                    checkOrgName: true
                }
            },
            messages: {
                oname: {
                    required: "请填写部门",
                    maxlength: "最大字符长度为24字符",
                    checkOrgName: "部门名称不能重复"
                }
            },
            errorPlacement: function (error, element) { // render error placement for each input type
                error.insertAfter(element); // for other inputs, just perform default behavoir
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                var dom = $(validator.invalidElements()[0]);
                App.scrollTo($(dom), -200);
            },

            highlight: function (element) { // hightlight error inputs
                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
            },
            submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form
                App.blockUI();
                addOrgForm.ajaxSubmit({
                    success: function (data) {
                        if (data.status == "success") {
                            toastr.success("添加部门成功", undefined, {"positionClass": "toast-top-full-width"});
                            window.location.reload();
                        } else {
                            toastr.error(data.errorCode + "：" + data.errorMessage, "添加部门失败", {"positionClass": "toast-top-full-width"});
                        }
                        App.unblockUI();
                    }
                })
            }
        });
    };

    var _editOrgValidate = function () {
        var editOrgForm = $("#edit_orgForm");
        editOrgForm.validate({
            errorElement: 'span',
            errorClass: "help-block help-block-error",
            focusInvalid: false,
            ignore: "",
            rules: {
                oname: {
                    required: true,
                    maxlength: 24,
                    checkOrgName: true
                }
            },
            messages: {
                oname: {
                    required: "请填写部门",
                    maxlength: "最大字符长度为24字符",
                    checkOrgName: "部门名称不能重复"
                }
            },
            errorPlacement: function (error, element) { // render error placement for each input type
                error.insertAfter(element); // for other inputs, just perform default behavoir
            },
            invalidHandler: function (event, validator) { //display error alert on form submit
                var dom = $(validator.invalidElements()[0]);
                App.scrollTo($(dom), -200);
            },

            highlight: function (element) { // hightlight error inputs
                $(element).closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            unhighlight: function (element) { // revert the change done by hightlight
                $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
            },
            submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form
                App.blockUI();
                editOrgForm.ajaxSubmit({
                    success: function (data) {
                        if (data.status == "success") {
                            toastr.success("修改部门成功", undefined, {"positionClass": "toast-top-full-width"});
                            window.location.reload();
                        } else {
                            toastr.error(data.errorCode + "：" + data.errorMessage, "修改部门失败", {"positionClass": "toast-top-full-width"});
                        }
                        App.unblockUI();
                    }
                })
            }
        });
    };

    var delOrg = function (id) {
        App.blockUI();
        $.post("/organization/delOrg.do", {
            ids: id
        }, function (data) {
            if (data.status == "success") {
                toastr.success("删除部门成功", undefined, {"positionClass": "toast-top-full-width"});
                $('#tree_org').jstree(true).refresh();
            } else {
                toastr.error(data.errorCode + "：" + data.errorMessage, "删除部门失败", {"positionClass": "toast-top-full-width"});
            }
            App.unblockUI();
        }).error(function (e) {
            App.unblockUI();
            toastr.error(e, "删除部门失败", {"positionClass": "toast-top-full-width"});
        });
    };

    var moveOrg = function (id, pid) {
        $.post("/organization/moveOrg.do", {
            ids: id,
            pid: pid
        }, function (data) {
            if (data.status == "success") {
                toastr.success("移动部门成功", undefined, {"positionClass": "toast-top-full-width"});
                $('#tree_org').jstree(true).refresh();
            } else {
                toastr.error(data.errorCode + "：" + data.errorMessage, "移动部门失败", {"positionClass": "toast-top-full-width"});
            }
            App.unblockUI($("#tree_org"));
        }).error(function (e) {
            App.unblockUI($("#tree_org"));
            toastr.error(e, "移动部门失败", {"positionClass": "toast-top-full-width"});
        });
    };

    var unCheckChildRecursive = function (obj, instance) {
        $.each(obj.children, function () {
            instance.uncheck_node(this);
            unCheckChildRecursive(instance.get_node(this), instance);
        });
    };
    // public functions
    return {

        //main function
        init: function () {
            //initialize here something.
            _initPlugin();
            _bindHandle();
        },
        filterTree: function () {
            var regex = $("#txt_regex").val().trim();
            var to = false;
            if (to) {
                clearTimeout(to);
            }
            to = setTimeout(function () {
                var v = $("#txt_regex").val().trim();
                $('#tree_org').jstree(true).search(v);
            }, 250);
        },
        addOrgValidate: function () {
            _addOrgValidate();
        },
        editOrgValidate: function () {
            _editOrgValidate();
        },
        showOrgSelect: function (target) {
            _showOrgSelect(target);
        }
    };
}();

jQuery(document).ready(function () {
    Tree.init();
});
window.onload = function () {
    handleFixedTreeBar();
    App.addResizeHandler(handleFixedTreeBar);
};
function handleFixedTreeBar() {
    var curHeight = App.getViewPort().height - $("#tree_org").parent().offset().top;
    var treeOrg = $("#tree_org").parent();
    App.destroySlimScroll(treeOrg);
    treeOrg.height(curHeight - 40);//上下margin分别为20
    App.initSlimScroll(treeOrg);
    treeOrg.css({"height": curHeight + "px", "overflow-x": "auto"}).parent().css("height", curHeight + "px");
}
/***
 Usage
 ***/
//Custom.doSomeStuff();