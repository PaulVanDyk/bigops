<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-md-12">
        <%--<div class="note note-danger">aaaaa</div>--%>
        <div class="table-container direct">
            <%--<div class="table-actions-wrapper">--%>
                <%--<button class="btn btn-sm green table-group-action-submit" onclick="">--%>
                    <%--<i class="fa fa-plus"></i> 新增赛季--%>
                <%--</button>--%>
                <%--&lt;%&ndash;<div class="table-group-action-filter">&ndash;%&gt;--%>
                <%--&lt;%&ndash;各种检索条件&ndash;%&gt;--%>
                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--</div>--%>
            <table class="table table-striped table-bordered table-hover"
                   id="dt_user">
                <thead>
                <tr role="row" class="heading">
                    <th width="10%"> 用户名</th>
                    <th width="8%"> 邮箱</th>
                    <th width="8%"> 手机</th>
                    <th width="8%"> 业务编码</th>
                    <th width="8%"> 失效时间</th>
                    <th width="10%"> 最后登录IP</th>
                    <th width="6%"> 状态</th>
                    <%--<th width="10%"> 操作</th>--%>
                </tr>
                </thead>
                <tbody></tbody>
            </table>

            <div class="direct-content">
                <div class="content-title">
                    <div class="actions">
                        <a href="javascript:;" onclick="$('.direct').toggleClass('direct-open');" class="btn btn-icon-only purple">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                    <div class="caption">
                        <span class="bold">Quick Info</span>
                    </div>
                </div>
                <div class="content-body">
                    <h3>This is direct-content-body</h3>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        User.init(${params});
    })
</script>