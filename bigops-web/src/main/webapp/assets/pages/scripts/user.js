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

    };

    /**
     * 初始化页面事件
     * @private
     */
    var _bindHandle = function () {
        var bakDirect;
        $(document).on("click", "#dt_user > tbody > tr", function () {
            if (bakDirect && bakDirect === this) {
                $(".direct").toggleClass("direct-open");
            } else {
                bakDirect = this;
                var id = $(this).find(":checkbox").val();
                directUserDetail(id);
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
                    initEdit(id);
                    break;
                case "close":
                    $(".direct").toggleClass("direct-open");
                    break;
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
                    {"data": "email"},
                    {"data": "mobile"},
                    {"data": "im1"},
                    {"data": "expires"},
                    {"data": "lastLoginIp"},
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
                        "targets": [4, 5, 6],
                        "render": function (data, type, full) {
                            if (data) {
                                return data;
                            }
                            return "-";
                        }
                    },
                    {
                        "targets": [7],
                        "data": "uid",
                        "render": function (data, type, full) {
                            if (full.status == 1) {
                                return '<span class="label label-success"> 启用 </span>';
                            } else {
                                return '<span class="label label-success"> 禁用 </span>';
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
                $(".direct-content .portlet-title #view_desc").text(data.data.description);
                $(".direct-content .portlet-body #view_gender").text(data.data.gender ? "男" : "女");
                $(".direct-content .portlet-body #view_age").text(data.data.age);
                $(".direct-content .portlet-body #view_isAdmin").text(data.data.isAdmin ? "管理员" : "普通用户");
                $(".direct-content .portlet-body #view_organizationName").text(data.data.organizationName);
                $(".direct-content .portlet-body #view_expires").text(data.data.expires);
                $(".direct-content .portlet-body #view_mobile").text(data.data.mobile);
                $(".direct-content .portlet-body #view_email").text(data.data.email);
                $(".direct-content .portlet-body #view_im").text(data.data.im1);

                $(".direct").toggleClass("direct-open", true);
            } else {
                $(".direct-content .portlet-title #view_realname").text("");
                $(".direct-content .portlet-title #view_desc").text("");
                $(".direct-content .portlet-body #view_gender").text("");
                $(".direct-content .portlet-body #view_age").text("");
                $(".direct-content .portlet-body #view_isAdmin").text("");
                $(".direct-content .portlet-body #view_organizationName").text("");
                $(".direct-content .portlet-body #view_expires").text("");
                $(".direct-content .portlet-body #view_mobile").text("");
                $(".direct-content .portlet-body #view_email").text("");
                $(".direct-content .portlet-body #view_im").text("");
                toastr.error(data.errorCode + "：" + data.errorMessage, "获取用户信息失败", {"positionClass": "toast-top-full-width"});
            }
            App.unblockUI();
        }).error(function (e) {
            App.unblockUI();
            toastr.error(e, "获取用户信息失败", {"positionClass": "toast-top-full-width"});
        });
    }

    var initEdit = function (uid) {
        if (!uid) {
            return;
        }
        $("#modal_user .modal-header .modal-title").text("编辑用户");
        $("#modal_user .modal-footer .btn.green").attr("data-type", "edit").text("保存");
        App.blockUI();
        $.post("/user/findUserById.do", {
            id: uid
        }, function (data) {
            if (data.status == "success") {
                $("#modal_user .modal-body #user_ids").val(data.data.uid);
                $("#modal_user .modal-body #input_realname").val(data.data.realname);
                $("#modal_user .modal-body #input_desc").val(data.data.description);
                $("#modal_user .modal-body #input_gender_" + data.data.gender).attr("checked", "checked");
                $("#modal_user .modal-body #input_age").val(data.data.age);
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
})