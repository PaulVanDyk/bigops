<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="full-height-content-body direct">
    <div class="table-container">
        <div class="table-actions-wrapper">
            <span> </span>
            <button class="btn btn-sm green" name="btn_enable">
                <i class="fa fa-check-circle-o"></i> 启用
            </button>
            <button class="btn btn-sm yellow" name="btn_disable">
                <i class="fa fa-ban"></i> 禁用
            </button>
            <button class="btn btn-sm red" name="btn_delete">
                <i class="fa fa-remove"></i> 删除
            </button>
        </div>
        <table class="table table-striped table-bordered table-hover table-checkable order-column"
               id="dt_user">
            <thead>
            <tr>
                <th>
                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                        <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes"/>
                        <span></span>
                    </label>
                </th>
                <th> 用户名</th>
                <th> 职务</th>
                <th> 邮箱</th>
                <th> 手机</th>
                <th> IM</th>
                <th> 失效时间</th>
                <th> 最后修改时间</th>
                <th> 状态</th>
                <%--<th width="10%"> 操作</th>--%>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <div class="direct-content">
        <div class="portlet mt-element-ribbon">
            <div class="ribbon ribbon-right ribbon-clip ribbon-shadow ribbon-border-dash-hor ribbon-color-success uppercase">
                <div class="ribbon-sub ribbon-clip ribbon-right"></div>
                用户信息
            </div>
            <div class="portlet-title">
                <div class="mt-comments">
                    <div class="mt-comment" style="padding: 0px; margin: 0px;">
                        <div class="mt-comment-img">
                            <img id="view_img" src="../assets/pages/media/users/avatar1.jpg"></div>
                        <div class="mt-comment-body">
                            <div class="mt-comment-info">
                                <span id="view_realname" class="mt-comment-author">Michael Baker</span>
                                <span id="view_expires" class="mt-comment-date">26 Feb, 10:30AM</span>
                            </div>
                            <div id="view_desc" class="mt-comment-text"> Lorem Ipsum is simply dummy text of the
                                printing and
                                typesetting industry.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr class="bg-white">
                        <th colspan="2">基本信息</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td style="width:100px;">性别:</td>
                        <td id="view_gender"></td>
                    </tr>
                    <tr>
                        <td>生日:</td>
                        <td id="view_birthday"></td>
                    </tr>
                    <tr>
                        <td>用户类型:</td>
                        <td id="view_isAdmin"></td>
                    </tr>
                    <tr>
                        <td>用户状态:</td>
                        <td id="view_status"></td>
                    </tr>
                    <tr>
                        <td>工号:</td>
                        <td id="view_employId"></td>
                    </tr>
                    <tr>
                        <td>职务:</td>
                        <td id="view_title"></td>
                    </tr>
                    <tr>
                        <td>工作部门:</td>
                        <td id="view_organizationName"></td>
                    </tr>
                    <tr>
                        <td>用户组:</td>
                        <td id="view_userGroupName"></td>
                    </tr>
                    </tbody>
                    <thead>
                    <tr class="bg-white">
                        <th colspan="2">联系方式</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>手机:</td>
                        <td id="view_mobile"></td>
                    </tr>
                    <tr>
                        <td>电话:</td>
                        <td id="view_tel"></td>
                    </tr>
                    <tr>
                        <td>邮箱:</td>
                        <td id="view_email"></td>
                    </tr>
                    <tr>
                        <td>IM1:</td>
                        <td id="view_im1"></td>
                    </tr>
                    <tr>
                        <td>IM2:</td>
                        <td id="view_im2"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="portlet-bottom">
                <div class="row">
                    <div class="inline">
                        <button class="btn btn-info mgl15" name="edit" data-value="">编辑</button>
                        <button class="btn btn-danger mgl15" name="delete" data-value="">删除</button>
                        <button class="btn btn-warning mgl15" name="resetPwd" data-value="">重置密码</button>
                        <button class="btn btn-default mgl15" name="close">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        User.ajaxLoad(${params});
    })
</script>