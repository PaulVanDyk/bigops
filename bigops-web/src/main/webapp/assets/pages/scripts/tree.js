/**
 * Created by dream on 2017/3/25.
 */
var Tree = function () {
    var _defaultText, _orgValidate, _userValidate;
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
        //添加部门回调
        $("#modal_org .modal-footer .btn.green").on('click', function () {
            if ($(this).attr("data-type") == "add") {
                addOrg();
            } else {
                editOrg();
            }
        });
        //添加用户回调
        $("#modal_user .modal-footer .btn.green").on('click', function () {
            if ($(this).attr("data-type") == "add") {
                addUser();
            } else {
                editUser();
            }
        });

        //修改名称
        $(".page-bar").on('click', '.editName', function () {
            var selected = $('#tree_org').jstree().get_selected(true)[0];
            var inst = $.jstree.reference(selected);
            _defaultText = selected.text;
            setTimeout(function () {
                inst.edit(selected);
            }, 0);
        });
        //新建子部门
        $(".page-bar").on('click', '.newOrg', function () {
            var selected = $('#tree_org').jstree().get_selected(true)[0];

            if (selected.type == "male" || selected.type == "female") {
                toastr.warning("请选择部门进行添加操作");
                return;
            }
            $("#modal_org").modal('show');
            $("#modal_org #pid").val(selected.id);
        });
        //删除
        $(".page-bar").on('click', '.del', function () {
            var selected = $('#tree_org').jstree().get_selected(true)[0];

            if (selected.type == "default") {
                delOrg(selected.id);
            } else if (selected.type == "male" || selected.type == "female") {
                delUser(selected.id);
            }
        });
        //新建用户
        $(".page-bar").on('click', '.newUser', function () {
            var selected = $('#tree_org').jstree().get_selected(true)[0];
            if (selected.type == "male" || selected.type == "female") {
                toastr.warning("请选择部门进行添加操作");
                return;
            }
            $("#modal_user").modal('show');
        });
    }

    var initTree = function () {
        $("#tree_org").jstree({
            "core": {
                "themes": {
                    "name": "default-dark",
                    "responsive": false
                },
                // so that create works
                "check_callback": true,
                'data': {
                    "url": "/organization/lazyList.do?lazy",
                    "data": function (node) {
                        return {"pid": node.id === "#" ? "0" : node.id};
                    }
                }
            },
            "types": {
                "#": {
                    "icon": "fa fa-folder icon-state-info icon-lg",
                    "max_children": 1,
                    "max_depth": 4,
                    "valid_children": ["default", "static"]
                },
                "static": {
                    "icon": "fa fa-folder icon-state-danger icon-lg",
                    "valid_children": []
                },
                "default": {
                    "icon": "fa fa-folder icon-state-warning icon-lg",
                    "valid_children": ["default", "male", "female"]
                },
                "file": {
                    "icon": "fa fa-file icon-state-default icon-lg"
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
            "state": {"key": "demo2"},
            "contextmenu": {
                "items": {
                    "createOrg": {
                        "label": "添加部门",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type == "male" || obj.type == "female";
                        },
                        "action": function (data) {
                            Tree.resetOrgForm();
                            var selected = $('#tree_org').jstree().get_selected(true);
                            $("#modal_org #pid").val(selected[0].id);
                            $("#modal_org .modal-header .modal-title").text("添加部门");
                            $("#modal_org .modal-footer .btn.green").attr("data-type", "add").text("添加");
                            $("#modal_org").modal('show');
                        }
                    },
                    "createUser": {
                        "label": "添加用户",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type == "male" || obj.type == "female";
                        },
                        "action": function (data) {
                            Tree.resetUserForm();
                            var selected = $('#tree_org').jstree().get_selected(true);
                            $("#modal_user #input_organizationId").val(selected[0].id);
                            $("#modal_user .modal-header .modal-title").text("添加用户");
                            $("#modal_user .modal-footer .btn.green").attr("data-type", "add").text("添加");
                            $("#modal_user").modal('show');
                        }
                    },
                    "editOrg": {
                        "label": "修改部门",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type == "male" || obj.type == "female" || obj.type == "#";
                        },
                        "action": function (data) {
                            Tree.resetOrgForm();
                            var selected = $('#tree_org').jstree().get_selected(true);
                            $("#modal_org #org_ids").val(selected[0].id);
                            $("#modal_org #oname").val(selected[0].text);
                            $("#modal_org .modal-header .modal-title").text("编辑部门");
                            $("#modal_org .modal-footer .btn.green").attr("data-type", "edit").text("保存");
                            $("#modal_org").modal('show');
                        }
                    },
                    "editUser": {
                        "label": "修改用户",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type == "default" || obj.type == "#";
                        },
                        "action": function (data) {
                            Tree.resetUserForm();
                            var selected = $('#tree_org').jstree().get_selected(true);
                            $("#modal_user #user_ids").val(selected[0].id.split("_")[1]);
                            $("#modal_user #input_email").attr("readonly", "readonly");
                            $("#modal_user .modal-header .modal-title").text("编辑用户");
                            $("#modal_user .modal-footer .btn.green").attr("data-type", "edit").text("保存");
                            $("#modal_user").modal('show');
                        }
                    },
                    "delete": {
                        "label": "删除",
                        "_ishide": function (data) {
                            var inst = $.jstree.reference(data.reference);
                            obj = inst.get_node(data.reference);
                            return obj.type == "static" || obj.type == "#";
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
                                    if (obj.type == "default") {
                                        delOrg(obj.id);
                                    } else if (obj.type == "male" || obj.type == "female") {
                                        delUser(obj.id.split("_")[1]);
                                    }
                                });
                        }
                    }
                }
            },
            "plugins": ["unique", "search", "contextmenu", "dnd", "state", "types"]
        });
        $("#tree_org").on("click.jstree", function (e) {
            if (e.target.tagName == "I" || e.target.tagName == "i") {
                return;
            }
            var inst = $.jstree.reference(e.target),
                node = inst.get_node(e.target);
            var type = node.type;
            if (!type || type == "default" || type == "static") {
                Layout.loadAjaxContent('/user/indexAjax.do?params=organizationId:' + node.id, $(node))
            } else if (type == "male" || type == "female") {
                Layout.loadAjaxContent('/user/indexAjax.do?params=uid:' + node.id.split("_")[1], $(node))
            }
        }).on("move_node.jstree", function (e, data) {
            App.blockUI({"target": $("#tree_org"), "animate": true, "iconOnly": true});
            if (data.node.type == "default") {
                moveOrg(data.node.id, data.parent);
            } else if (data.node.type == "male" || data.node.type == "female") {
                var id = data.node.id.split("_")[1];
                moveUser(id, data.parent);
            }
        });
    };

    var addOrg = function () {
        var addOrgForm = $("#org-form");
        _orgValidate = addOrgForm.validate({
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
                            $("#modal_org").modal('hide');
                            $('#tree_org').jstree(true).refresh();
                        } else {
                            toastr.error("机构添加失败");
                        }
                        App.unblockUI();
                    }
                })
            }
        });

        addOrgForm.attr("action", "/organization/addOrg.do").submit();
    };

    var editOrg = function () {
        var addOrgForm = $("#org-form");
        _orgValidate = addOrgForm.validate({
            errorElement: 'span',
            errorClass: "help-block help-block-error",
            focusInvalid: false,
            ignore: "",
            rules: {
                oname: {
                    required: true,
                    maxlength: 24
                }
            },
            messages: {
                oname: {
                    required: "请填写部门",
                    maxlength: "最大字符长度为24字符"
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
                            $("#modal_org").modal('hide');
                            $('#tree_org').jstree(true).refresh();
                        } else {
                            toastr.error("机构添加失败");
                        }
                        App.unblockUI();
                    }
                })
            }
        });

        addOrgForm.attr("action", "/organization/modifyOrg.do").submit();
    };

    var addUser = function () {
        var addUserForm = $("#user-form");
        _userValidate = addUserForm.validate({
            errorElement: 'span',
            errorClass: "help-block help-block-error",
            focusInvalid: false,
            ignore: "",
            rules: {
                realname: {
                    required: true,
                    maxlength: 24
                },
                age: {
                    required: true,
                    digits: true,
                    min: 10,
                    max: 100
                },
                mobile: {
                    required: true,
                    digits: true,
                    rangelength: [11, 11]
                },
                email: {
                    required: true,
                    email: true,
                    remote: "/user/checkEmail.do"
                }
            },
            messages: {
                realname: {
                    required: "请填写姓名",
                    maxlength: "姓名最长为24字符"
                },
                age: {
                    required: "请填写年龄",
                    digits: "年龄必须为数字",
                    min: "年龄必须大于等于10",
                    max: "年龄必须小于等于100"
                },
                mobile: {
                    required: "请填写手机号",
                    digits: "手机号必须为数字",
                    rangelength: "手机号长度必须为{0}位"
                },
                email: {
                    required: "请填写邮箱",
                    email: "请输入正确的邮箱格式",
                    remote: "该邮箱已被注册"
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
                addUserForm.ajaxSubmit({
                    success: function (data) {
                        if (data.status == "success") {
                            $("#modal_user").modal('hide');
                            $('#tree_org').jstree(true).refresh();
                        } else {
                            toastr.error("添加用户失败");
                        }
                        App.unblockUI();
                    }
                })
            }
        });

        addUserForm.attr("action", "/user/addUser.do").submit();
    };

    var editUser = function () {
        var addUserForm = $("#user-form");
        _userValidate = addUserForm.validate({
            errorElement: 'span',
            errorClass: "help-block help-block-error",
            focusInvalid: false,
            ignore: "",
            rules: {
                realname: {
                    required: true,
                    maxlength: 24
                },
                age: {
                    required: true,
                    digits: true,
                    min: 10,
                    max: 100
                },
                mobile: {
                    required: true,
                    digits: true,
                    rangelength: [11, 11]
                }
            },
            messages: {
                realname: {
                    required: "请填写姓名",
                    maxlength: "姓名最长为24字符"
                },
                age: {
                    required: "请填写年龄",
                    digits: "年龄必须为数字",
                    min: "年龄必须大于等于10",
                    max: "年龄必须小于等于100"
                },
                mobile: {
                    required: "请填写手机号",
                    digits: "手机号必须为数字",
                    rangelength: "手机号长度必须为{0}位"
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
                addUserForm.ajaxSubmit({
                    success: function (data) {
                        if (data.status == "success") {
                            $("#modal_user").modal('hide');
                            var node = $('#tree_org').jstree().get_selected(true)[0];
                            var type = node.type;
                            if (!type || type == "default" || type == "static") {
                                Layout.loadAjaxContent('/user/indexAjax.do?params=organizationId:' + node.id, $(node))
                            } else if (type == "male" || type == "female") {
                                Layout.loadAjaxContent('/user/indexAjax.do?params=uid:' + node.id.split("_")[1], $(node))
                            }
                            $('#tree_org').jstree(true).refresh();
                        } else {
                            toastr.error("修改用户失败");
                        }
                        App.unblockUI();
                    }
                })
            }
        });

        addUserForm.attr("action", "/user/modifyUser.do").submit();
    };

    var delOrg = function (id) {
        App.blockUI();
        $.post("/organization/delOrg.do", {
            ids: id
        }, function (data) {
            if (data.status == "success") {
                toastr.success("机构删除成功");
                $('#tree_org').jstree(true).refresh();
            } else {
                toastr.error("机构删除失败");
            }
            App.unblockUI();
        }).error(function (e) {
            App.unblockUI();
            toastr.error(e);
        });
    };

    var delUser = function (id) {
        App.blockUI();
        $.post("/user/delUser.do", {
            ids: id
        }, function (data) {
            if (data.status == "success") {
                toastr.success("用户删除成功");
                $('#tree_org').jstree(true).refresh();
            } else {
                toastr.error("用户删除失败");
            }
            App.unblockUI();
        }).error(function (e) {
            App.unblockUI();
            toastr.error(e);
        });
    };

    var moveOrg = function (id, pid) {
        $.post("/organization/moveOrg.do", {
            ids: id,
            pid: pid
        }, function (data) {
            if (data.status == "success") {
                toastr.success("机构移动成功");
                $('#tree_org').jstree(true).refresh();
            } else {
                toastr.error("机构移动失败");
            }
            App.unblockUI($("#tree_org"));
        }).error(function (e) {
            App.unblockUI($("#tree_org"));
            toastr.error(e);
        });
    };

    var moveUser = function (id, oid) {
        $.post("/user/moveUser.do", {
            ids: id,
            oid: oid
        }, function (data) {
            if (data.status == "success") {
                toastr.success("用户移动成功");
                $('#tree_org').jstree(true).refresh();
            } else {
                toastr.error("用户移动失败");
            }
            App.unblockUI($("#tree_org"));
        }).error(function (e) {
            App.unblockUI($("#tree_org"));
            toastr.error(e);
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
        resetOrgForm: function () {
            if (_orgValidate) {
                _orgValidate.resetForm();
            }
        },
        resetUserForm: function () {
            if (_userValidate) {
                _userValidate.resetForm();
            }
        }
    };
}();

jQuery(document).ready(function () {
    Tree.init();
});

/***
 Usage
 ***/
//Custom.doSomeStuff();