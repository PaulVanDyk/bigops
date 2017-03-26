<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="full-height-content-body direct">
    <div class="row">
        <div class="col-md-12">
        <table class="table table-striped table-bordered table-hover table-checkable order-column"
               id="dt_user">
            <thead>
            <tr>
                <th>
                    <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
                        <input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" />
                        <span></span>
                    </label>
                </th>
                <th> 用户名</th>
                <th> 邮箱</th>
                <th> 手机</th>
                <th> IM</th>
                <th> 失效时间</th>
                <th> 最后登录IP</th>
                <th> 状态</th>
                <%--<th width="10%"> 操作</th>--%>
            </tr>
            </thead>
            <tbody></tbody>
        </table>
        </div>
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
                                <span id="view_date" class="mt-comment-date">26 Feb, 10:30AM</span>
                            </div>
                            <div id="view_desc" class="mt-comment-text"> Lorem Ipsum is simply dummy text of the printing and
                                typesetting industry.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="portlet-body">
                <form class="form-horizontal" role="form">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">性别:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static" id="view_gender"> Male </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">年龄:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static" id="view_age"> Male </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">用户类型:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static" id="view_isAdmin"> Male </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">所属机构:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static" id="view_organizationId"> Male </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">到期时间:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static" id="view_expires"> Male </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h3 class="form-section">联系方式</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">电话:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static" id="view_mobile"> Male </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">邮箱:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static" id="view_email"> Male </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-3">IM:</label>
                                    <div class="col-md-9">
                                        <p class="form-control-static" id="view_im"> Male </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="portlet-bottom">
                <div class="row"> <div class="col-md-6"><button class="btn btn-info" data-value="">编辑</button></div></div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        User.init(${params});
    })
</script>