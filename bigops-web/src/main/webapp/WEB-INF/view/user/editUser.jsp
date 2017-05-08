<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="full-height-content-body" style="padding: 15px;">
    <div class="portlet light bordered">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-equalizer font-red-sunglo"></i>
                <span class="caption-subject font-red-sunglo bold">编辑用户</span>
                <%--<span class="caption-helper">form actions without bg color</span>--%>
            </div>
        </div>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form id="edit_userForm" class="form-horizontal" action="/user/modifyUser.do" method="post">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">姓名:</label>
                        <div class="col-md-8">
                            <input type="hidden" id="user_ids" name="ids" value="${userDomain.uid}">
                            <input type="text" class="form-control" name="realname" value="${userDomain.realname}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">性别:</label>
                        <div class="col-md-8">
                            <div class="mt-radio-inline">
                                <label class="mt-radio">
                                    <input type="radio" name="gender" value="1" ${userDomain.gender==1?"checked":""}> 男
                                    <span></span>
                                </label>
                                <label class="mt-radio">
                                    <input type="radio" name="gender" value="0" ${userDomain.gender==0?"checked":""}> 女
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">生日:</label>
                        <div class="col-md-8">
                            <div class="input-group input-medium date date-picker" data-date-format="yyyy-mm-dd">
                                <input type="text" class="form-control" id="txt_birthday" name="birthday" readonly>
                                <span class="input-group-btn">
                                    <button class="btn default" type="button">
                                        <i class="fa fa-calendar"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">用户类型:</label>
                        <div class="col-md-8">
                            <div class="mt-radio-inline">
                                <label class="mt-radio">
                                    <input type="radio" name="isAdmin" value="0" ${userDomain.isAdmin==0?"checked":""}>
                                    普通用户
                                    <span></span>
                                </label>
                                <label class="mt-radio">
                                    <input type="radio" name="isAdmin" value="1" ${userDomain.isAdmin==1?"checked":""}>
                                    管理员
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">用户状态:</label>
                        <div class="col-md-8">
                            <div class="mt-radio-inline">
                                <label class="mt-radio">
                                    <input type="radio" name="status" value="1" ${userDomain.status==1?"checked":""}> 启用
                                    <span></span>
                                </label>
                                <label class="mt-radio">
                                    <input type="radio" name="status" value="0" ${userDomain.status==0?"checked":""}> 禁用
                                    <span></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">过期时间:</label>
                        <div class="col-md-8">
                            <div class="input-group input-medium date date-picker" data-date-format="yyyy-mm-dd"
                                 defaultDate>
                                <input type="text" class="form-control" id="txt_expires" name="expires" readonly>
                                <span class="input-group-btn">
                                    <button class="btn default" type="button">
                                        <i class="fa fa-calendar"></i>
                                    </button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">工号:</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="employId" value="${userDomain.employId}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">职务:</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="title" value="${userDomain.title}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">工作部门:</label>
                        <div class="col-md-8">
                            <input type="hidden" class="form-control" id="input_organizationId"
                                   name="organizationId" value="${userDomain.organizationId}">
                            <input type="text" class="form-control" id="input_organizationName"
                                   name="organizationName" value="${userDomain.organizationName}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">所属用户组:</label>
                        <div class="col-md-8">
                            <input type="hidden" class="form-control" id="input_userGroupId"
                                   name="userGroupId" value="${userDomain.userGroupId}">
                            <input type="text" class="form-control" id="input_userGroupName"
                                   name="userGroupName" value="${userDomain.userGroupName}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">手机:</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="mobile" value="${userDomain.mobile}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">电话:</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="tel" value="${userDomain.tel}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">邮箱:</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="email" value="${userDomain.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">IM1:</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="im1" value="${userDomain.im1}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">IM2:</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control" name="im2" value="${userDomain.im2}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">备注:</label>
                        <div class="col-md-8">
                            <textarea rows="5" class="form-control" name="description">${userDomain.description}</textarea>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="text-center">
                            <button type="submit" class="btn green">保存</button>
                            <button type="button" class="btn default">取消</button>
                        </div>
                    </div>
                </div>
            </form>
            <!-- END FORM-->
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        if (jQuery().datepicker) {
            $('.date-picker').datepicker({
                rtl: App.isRTL(),
                orientation: "left",
                language: "zh-CN",
                autoclose: true
            });
        }

        $("#edit_userForm #txt_birthday").parent().datepicker('update', moment('${userDomain.birthday}').format("YYYY-MM-DD"));
        $("#edit_userForm #txt_expires").parent().datepicker('update', moment('${userDomain.expires}').format("YYYY-MM-DD"));

        $(document).scroll(function () {
            $('#edit_userForm .date-picker').datepicker('place'); //#modal is the id of the modal
        });

        User.editUserValidate();

        $("#edit_userForm .form-actions :button.btn.default").click(function () {
            window.location.reload();
        });

        //选择部门
        $("#edit_userForm #input_organizationName").on("click", function () {
            Tree.showOrgSelect($("#edit_userForm #input_organizationId"));
        });

        //选择部门回调
        $("#modal_orgSelect .modal-footer .btn.green").unbind().on("click", function () {
            var items = $("#tree_orgSelect").jstree(true).get_checked(true);
            var oids = '', onames = '';
            $.each(items, function () {
                oids += "," + this.id;
                onames += "," + this.text;
            });
            $("#add_userForm #input_organizationId").val(oids.substr(1));
            $("#add_userForm #input_organizationName").val(onames.substr(1));
            $("#modal_orgSelect").modal("hide");
        });
    });
</script>