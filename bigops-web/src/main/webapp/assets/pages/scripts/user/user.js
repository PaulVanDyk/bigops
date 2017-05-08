/**
 * Created by dream on 2017/3/19.
 */
var User = function () {

    var gridUser = new Datatable();

    /**
     * 初始化页面插件
     * @private
     */
    var _initPlugin = function () {

        //自定义邮箱名称校验方法
        jQuery.validator.addMethod("checkUserEmail", function (value, element) {
            var returnVal = false;
            var uid = $("#edit_userForm #user_ids").val();

            $.ajax({
                type: "POST",
                url: "/user/checkEmail.do",
                data: {
                    email: value,
                    id: uid ? uid : 0
                },
                async: false,
                success: function (data) {
                    if (data) {
                        returnVal = true;
                    }
                }
            });
            return returnVal;
        }, "该邮箱已注册，请更换其他邮箱");
    };

    /**
     * 初始化页面事件
     * @private
     */
    var _bindHandle = function () {
        var bakDirect;
        $(document).on("click", "#dt_user > tbody > tr", function (e) {
            if (e.target.tagName.toLocaleUpperCase() == "SPAN" || e.target.tagName.toLocaleUpperCase() == "INPUT") {
                return;
            }
            if (bakDirect && bakDirect === this) {
                $(".direct").toggleClass("direct-open");
            } else {
                bakDirect = this;
                var id = $(this).find(":checkbox").val();
                directUserDetail(id);
                handleFixedDirect();
            }
        });

        $("#search_form").on("click", "#showAll", function () {
            $("#txtSearch").val("");
            gridUser.setAjaxParam("isSearch", false);
            var selected = $('#tree_org').jstree().get_selected(true);
            if ($(this).prop("checked")) {
                var params = "params=depth:true,organizationId:";
                params += selected ? selected[0].id : "0";
                Layout.loadAjaxContent('/user/indexAjax.do?' + params, $(selected[0]))
            } else {
                var params = "params=organizationId:";
                params += selected ? selected[0].id : "0";
                Layout.loadAjaxContent('/user/indexAjax.do?' + params, $(selected[0]))
            }
        });

        $("#search_form").on("click", ":button", function () {
            var text = $("#txtSearch").val().replace("/[ ,　]/g", "");
            if (text) {
                gridUser.setAjaxParam("mutilText", text);
            } else {
                gridUser.setAjaxParam("mutilText", undefined);
            }
            gridUser.setAjaxParam("isSearch", true);
            gridUser.getDataTable().ajax.reload(null, true);
        });

        $(document).on('click', '.direct-content .portlet-bottom :button', function () {
            switch ($(this).attr("name")) {
                case "edit":
                    var id = $(this).attr("data-value");
                    _gotoEditUser(id);
                    break;
                case "delete":
                    var id = $(this).attr("data-value");
                    _delUser(id);
                    break;
                case "resetPwd":
                    var id = $(this).attr("data-value");
                    _resetPwd(id);
                    break;
                case "close":
                    $(".direct").toggleClass("direct-open");
                    break;
            }
        });

        /**
         * 批量操作 启用、禁用、删除
         */
        $(document).on("click", ".table-container :button", function () {
            //获取所有选择项
            var options = $(".checkboxes:checked");
            if (options && options.length > 0) {
                var ids = "";
                $.each(options, function () {
                    ids = "," + $(this).val();
                });
                if ($(this).attr("name") == "btn_enable") {
                    _changeStatus(ids.substr(1), 0);
                } else if ($(this).attr("name") == "btn_disable") {
                    _changeStatus(ids.substr(1), 0);
                } else if ($(this).attr("name") == "btn_delete") {
                    _deleteUser(ids.substr(1));
                }
            } else {
                toastr.warning("请选择操作项", undefined, {"positionClass": "toast-top-full-width"});
            }
        });
    };

    /**
     * 初始化数据列表
     * @private
     */
    var _initTable = function () {
        gridUser.init({
            src: $("#dt_user"),
            loadingMessage: 'Loading...',
            dataTable: { // here you can define a typical datatable settings from http://datatables.net/usage/options
                "bAutoWidth": true,
                "ordering": false,
                "pageLength": 10, // default record count per pag
                "pagingType": "bootstrap_full_number",
                "ajax": {
                    "url": contextPath + "/user/findUserList.do" // ajax source
                },
                "columns": [
                    {"data": "uid"},
                    {"data": "realname"},
                    {"data": "title"},
                    {"data": "email"},
                    {"data": "mobile"},
                    {"data": "im1"},
                    {"data": "expires"},
                    {"data": "lastUpdateTime"},
                    {"data": "status"}
                ],
                "columnDefs": [
                    {
                        "targets": [0],
                        "data": "uid",
                        "render": function (data, type, full) {
                            return '<label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">' +
                                '<input type="checkbox" class="checkboxes" value="' + data + '"/> <span></span> </label>';
                        }
                    },
                    {
                        "targets": [5],
                        "render": function (data, type, full) {
                            if (data) {
                                return data;
                            }
                            return "-";
                        }
                    },
                    {
                        "targets": [6],
                        "render": function (data, type, full) {
                            if (data) {
                                return moment(data).format("YYYY-MM-DD HH:mm:ss");
                            }
                            return "-";
                        }
                    },
                    {
                        "targets": [7],
                        "render": function (data, type, full) {
                            if (data) {
                                return moment(data).format("YYYY-MM-DD HH:mm:ss");
                            }
                            return "-";
                        }
                    },
                    {
                        "targets": [8],
                        "data": "uid",
                        "render": function (data, type, full) {
                            if (full.status == 1) {
                                return '<span class="label label-success"> 启用 </span>';
                            } else if (full.status == 0) {
                                return '<span class="label label-default"> 禁用 </span>';
                            } else {
                                return '<span class="label label-warning"> 离职 </span>';
                            }

                        }
                    }
                ]
            }
        });
    };

    var directUserDetail = function (uid) {
        if (!uid) {
            return;
        }
        App.blockUI();
        $.post("/user/findUserById.do", {
            id: uid
        }, function (data) {
            if (data.status == "success") {
                $(".direct-content .portlet-bottom :button").attr("data-value", data.data.uid);
                $(".direct-content .portlet-title #view_realname").text(data.data.realname);
                $(".direct-content .portlet-title #view_expires").text(moment(data.data.expires).format("YYYY-MM-DD"));
                $(".direct-content .portlet-title #view_desc").text(data.data.description);
                $(".direct-content .portlet-body #view_gender").text(data.data.gender ? "男" : "女");
                $(".direct-content .portlet-body #view_birthday").text(moment(data.data.birthday).format("YYYY-MM-DD"));
                $(".direct-content .portlet-body #view_isAdmin").text(data.data.isAdmin ? "管理员" : "普通用户");
                if (data.data.status == 1) {
                    $(".direct-content .portlet-body #view_status").text("启用");
                } else if (data.data.status == 0) {
                    $(".direct-content .portlet-body #view_status").text("禁用");
                } else {
                    $(".direct-content .portlet-body #view_status").text("离职");
                }
                $(".direct-content .portlet-body #view_employId").text(data.data.employId);
                $(".direct-content .portlet-body #view_title").text(data.data.title);
                $(".direct-content .portlet-body #view_organizationName").text(data.data.organizationName);
                $(".direct-content .portlet-body #view_userGrupName").text(data.data.userGroupName);
                $(".direct-content .portlet-body #view_mobile").text(data.data.mobile);
                $(".direct-content .portlet-body #view_tel").text(data.data.tel);
                $(".direct-content .portlet-body #view_email").text(data.data.email);
                $(".direct-content .portlet-body #view_im1").text(data.data.im1);
                $(".direct-content .portlet-body #view_im2").text(data.data.im2);

                $(".direct").toggleClass("direct-open", true);
            } else {
                $(".direct-content .portlet-title #view_realname").text("");
                $(".direct-content .portlet-title #view_desc").text("");
                $(".direct-content .portlet-title #view_expires").text("");
                $(".direct-content .portlet-body #view_gender").text("");
                $(".direct-content .portlet-body #view_birthday").text("");
                $(".direct-content .portlet-body #view_isAdmin").text("");
                $(".direct-content .portlet-body #view_status").text("");
                $(".direct-content .portlet-body #view_employId").text("");
                $(".direct-content .portlet-body #view_title").text("");
                $(".direct-content .portlet-body #view_organizationName").text("");
                $(".direct-content .portlet-body #view_userGrupName").text("");
                $(".direct-content .portlet-body #view_mobile").text("");
                $(".direct-content .portlet-body #view_tel").text("");
                $(".direct-content .portlet-body #view_email").text("");
                $(".direct-content .portlet-body #view_im1").text("");
                $(".direct-content .portlet-body #view_im2").text("");
                toastr.error(data.errorCode + "：" + data.errorMessage, "获取用户信息失败", {"positionClass": "toast-top-full-width"});
            }
            App.unblockUI();
        }).error(function (e) {
            App.unblockUI();
            toastr.error(e, "获取用户信息失败", {"positionClass": "toast-top-full-width"});
        });
    }

    var _gotoAddUser = function (oid, oname, targetNode) {
        $(".page-container .page-content-wrapper .page-content .page-title").toggleClass("hide", true);
        Layout.loadAjaxContent('/user/gotoAdd.do?oid=' + oid + "&oname=" + oname, $(targetNode));
    };

    var _gotoEditUser = function (id, targetNode) {
        $(".page-container .page-content-wrapper .page-content .page-title").toggleClass("hide", true);
        Layout.loadAjaxContent('/user/gotoEdit.do?id=' + id, $(targetNode));
    };

    var _resetPwd = function (ids) {
        if (!uid) {
            return;
        }
        App.blockUI();
        $.post("/user/findUserById.do", {
            id: uid
        }, function (data) {
            if (data.status == "success") {
                $("#modal_user .modal-body #user_ids").val(data.data.uid);
                $("#modal_user .modal-body #input_realname").val(data.data.realname);
                $("#modal_user .modal-body #input_desc").val(data.data.description);
                $("#modal_user .modal-body #input_gender_" + data.data.gender).attr("checked", "checked");
                $("#modal_user .modal-body #input_birthday").val(data.data.age);
                $("#modal_user .modal-body #input_isAdmin_" + data.data.isAdmin).attr("checked", "checked");
                $("#modal_user .modal-body #input_organizationId").val(data.data.organizationId);
                $("#modal_user .modal-body #input_organizationName").val(data.data.organizationName);
                $("#modal_user .modal-body #input_expires").val(data.data.expires);
                $("#modal_user .modal-body #input_mobile").val(data.data.mobile);
                $("#modal_user .modal-body #input_email").val(data.data.email);
                $("#modal_user .modal-body #input_im1").val(data.data.im1);
                $("#modal_user").modal('show');
            } else {
                toastr.error(data.errorCode + "：" + data.errorMessage, "获取用户信息失败", {"positionClass": "toast-top-full-width"});
            }
            App.unblockUI();
        }).error(function (e) {
            App.unblockUI();
            toastr.error(e, "获取用户信息失败", {"positionClass": "toast-top-full-width"});
        });
    };

    var _addUserValidate = function () {
        var addUserForm = $("#add_userForm");
        addUserForm.validate({
            errorElement: 'span',
            errorClass: "help-block help-block-error",
            focusInvalid: false,
            ignore: "",
            rules: {
                realname: {
                    required: true,
                    maxlength: 24
                },
                organizationName: {
                    required: true
                },
                age: {
                    required: true
                },
                mobile: {
                    required: true,
                    digits: true,
                    rangelength: [11, 11]
                },
                email: {
                    required: true,
                    email: true,
                    checkUserEmail: true
                }
            },
            messages: {
                realname: {
                    required: "请填写姓名",
                    maxlength: "姓名最长为24字符"
                },
                organizationName: {
                    required: "请选择部门"
                },
                age: {
                    required: "请填写生日"
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
                if (element.parent().hasClass("input-group")) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavoir
                }
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
                            // toastr.success(data.method = "addUser" ? "添加用户成功" : "修改用户成功", undefined, {"positionClass": "toast-top-full-width"});
                            toastr.success("添加用户成功", undefined, {"positionClass": "toast-top-full-width"});
                            window.location.reload();
                        } else {
                            // toastr.error(data.errorCode + "：" + data.errorMessage, data.method = "addUser" ? "添加用户失败" : "修改用户失败", {"positionClass": "toast-top-full-width"});
                            toastr.error(data.errorCode + "：" + data.errorMessage, "添加用户失败", {"positionClass": "toast-top-full-width"});
                        }
                        App.unblockUI();
                    }
                })
            }
        });
    };

    var _editUserValidate = function () {
        var editUserForm = $("#edit_userForm");
        editUserForm.validate({
            errorElement: 'span',
            errorClass: "help-block help-block-error",
            focusInvalid: false,
            ignore: "",
            rules: {
                realname: {
                    required: true,
                    maxlength: 24
                },
                organizationName: {
                    required: true
                },
                age: {
                    required: true
                },
                mobile: {
                    required: true,
                    digits: true,
                    rangelength: [11, 11]
                },
                email: {
                    required: true,
                    email: true,
                    checkUserEmail: true
                }
            },
            messages: {
                realname: {
                    required: "请填写姓名",
                    maxlength: "姓名最长为24字符"
                },
                organizationName: {
                    required: "请选择部门"
                },
                age: {
                    required: "请填写生日"
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
                if (element.parent().hasClass("input-group")) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element); // for other inputs, just perform default behavoir
                }
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
                editUserForm.ajaxSubmit({
                    success: function (data) {
                        if (data.status == "success") {
                            // toastr.success(data.method = "addUser" ? "添加用户成功" : "修改用户成功", undefined, {"positionClass": "toast-top-full-width"});
                            toastr.success("修改用户成功", undefined, {"positionClass": "toast-top-full-width"});
                            window.location.reload();
                        } else {
                            // toastr.error(data.errorCode + "：" + data.errorMessage, data.method = "addUser" ? "添加用户失败" : "修改用户失败", {"positionClass": "toast-top-full-width"});
                            toastr.error(data.errorCode + "：" + data.errorMessage, "修改用户失败", {"positionClass": "toast-top-full-width"});
                        }
                        App.unblockUI();
                    }
                })
            }
        });
    };

    var _delUser = function (ids) {
        swal({
                title: "确认删除?",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "取消",
                confirmButtonClass: "btn-danger",
                confirmButtonText: "确认",
                closeOnConfirm: true
            },
            function () {
                App.blockUI();
                $.post("/user/delUser.do", {
                    ids: ids
                }, function (data) {
                    if (data.status == "success") {
                        toastr.success("删除用户成功", undefined, {"positionClass": "toast-top-full-width"});
                        $('#tree_org').jstree(true).refresh();
                    } else {
                        toastr.error(data.errorCode + "：" + data.errorMessage, "删除用户失败", {"positionClass": "toast-top-full-width"});
                    }
                    App.unblockUI();
                    $(".direct").toggleClass("direct-open", false);
                    $("#dt_user").DataTable().ajax.reload(null, false);
                }).error(function (e) {
                    App.unblockUI();
                    toastr.error(e, "删除用户失败", {"positionClass": "toast-top-full-width"});
                });
            });
    };

    var _moveUser = function (id, oid) {
        $.post("/user/moveUser.do", {
            ids: id,
            oid: oid
        }, function (data) {
            if (data.status == "success") {
                toastr.success("移动用户成功", undefined, {"positionClass": "toast-top-full-width"});
                $('#tree_org').jstree(true).refresh();
            } else {
                toastr.error(data.errorCode + "：" + data.errorMessage, "移动用户失败", {"positionClass": "toast-top-full-width"});
            }
            App.unblockUI($("#tree_org"));
        }).error(function (e) {
            App.unblockUI($("#tree_org"));
            toastr.error(e, "移动用户失败", {"positionClass": "toast-top-full-width"});
        });
    };

    var _changeStatus = function (ids, status) {
        var titleText = status ? "启用" : "禁用";
        swal({
                title: "确认" + titleText + "?",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "取消",
                confirmButtonClass: "btn-danger",
                confirmButtonText: "确认",
                closeOnConfirm: true
            },
            function () {
                App.blockUI();
                $.post("/user/modifyUser.do", {
                    ids: ids,
                    status: status
                }, function (data) {
                    if (data.status == "success") {
                        toastr.success(titleText + "用户成功", undefined, {"positionClass": "toast-top-full-width"});
                        $('#tree_org').jstree(true).refresh();
                    } else {
                        toastr.error(data.errorCode + "：" + data.errorMessage, titleText + "用户失败", {"positionClass": "toast-top-full-width"});
                    }
                    App.unblockUI();
                    $(".direct").toggleClass("direct-open", false);
                    $("#dt_user").DataTable().ajax.reload(null, false);
                }).error(function (e) {
                    App.unblockUI();
                    toastr.error(e, titleText + "用户失败", {"positionClass": "toast-top-full-width"});
                });
            });
    }

    var _initParam = function (params) {
        if (params) {
            gridUser.clearAjaxParams();
            $(params).each(function () {
                gridUser.setAjaxParam(this.key, this.value);
            });
        }
    }

    return {
        init: function () {
            _initPlugin();
            _bindHandle();
        },
        gotoAdd: function (oid, oname, targetNode) {
            _gotoAddUser(oid, oname, targetNode);
        },
        gotoEdit: function (id, targetNode) {
            _gotoEditUser(id, targetNode);
        },
        addUserValidate: function () {
            _addUserValidate();
        },
        editUserValidate: function () {
            _editUserValidate();
        },
        resetPwd: function (ids) {
            _resetPwd(ids);
        },
        delUser: function (ids) {
            _delUser(ids);
        },
        moveUser: function (id, pid) {
            _moveUser(id, pid);
        },
        ajaxLoad: function (params) {
            _initParam(params);
            _initTable();
        }
    }
}
();
function arrayToJson(array) {
    var o = {};
    $.each(array, function () {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

$(document).ready(function () {
    User.init();
});
window.onload = function () {
    App.addResizeHandler(handleFixedDirect);
};
function handleFixedDirect() {
    var curHeight = $(".direct-content .portlet").height() - $(".direct-content .portlet .portlet-title").outerHeight() - $(".direct-content .portlet .portlet-bottom").outerHeight();
    var direct = $(".direct-content .portlet .portlet-body");
    App.destroySlimScroll(direct);
    direct.outerHeight(curHeight);
    App.initSlimScroll(direct);
}