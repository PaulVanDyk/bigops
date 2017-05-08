<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="full-height-content-body" style="padding: 15px;">
    <div class="portlet light bordered">
        <div class="portlet-title">
            <div class="caption">
                <i class="icon-equalizer font-red-sunglo"></i>
                <span class="caption-subject font-red-sunglo bold">添加机构</span>
                <%--<span class="caption-helper">form actions without bg color</span>--%>
            </div>
        </div>
        <div class="portlet-body form">
            <!-- BEGIN FORM-->
            <form id="add_orgForm" class="form-horizontal" action="/organization/addOrg.do" method="post">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">所属部门:</label>
                        <div class="col-md-8">
                            <input type="hidden" class="form-control" value="${pid}">
                            <input type="text" class="form-control" name="pname" value="${pname}" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">部门名称：</label>
                        <div class="col-md-8">
                            <input type="text" name="oname" class="form-control" placeholder="请输入部门名称">
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="text-center">
                            <button type="submit" class="btn green">添加</button>
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
        Tree.addOrgValidate();
        $("#add_orgForm .form-actions :button.btn.default").click(function () {
            window.location.reload();
        });
    });
</script>