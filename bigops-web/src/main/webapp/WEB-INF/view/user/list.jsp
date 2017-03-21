<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="full-height-content-body direct">
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
        <div class="portlet mt-element-ribbon">
            <div class="ribbon ribbon-right ribbon-clip ribbon-shadow ribbon-border-dash-hor ribbon-color-success uppercase">
                <div class="ribbon-sub ribbon-clip ribbon-right"></div>
                用户信息
            </div>
            <div class="portlet-title">
                <div class="caption">
                    <span class="bold">Quick Info</span>
                </div>
            </div>
            <div class="portlet-body">
                <h3>This is direct-content-body</h3>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        User.init(${params});
    })
</script>