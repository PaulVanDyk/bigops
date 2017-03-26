<%--
  Created by IntelliJ IDEA.
  User: Erlei Chen
  Date: 2017/3/13
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String contextPath = request.getContextPath();
%>
<script>
    contextPath = '<%=contextPath%>';
</script>
<!-- BEGIN HEAD -->
<meta charset="utf-8" />
<title>Metronic Admin Theme #1 | Ajax Content Page</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="Preview page of Metronic Admin Theme #1 for loading content via ajax" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="<%=contextPath%>/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/jstree/dist/themes/default-dark/style.min.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL STYLES -->
<link href="<%=contextPath%>/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="<%=contextPath%>/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<link href="<%=contextPath%>/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="<%=contextPath%>/assets/layouts/layout/css/custom.css" rel="stylesheet" type="text/css" />
<!-- END THEME LAYOUT STYLES -->
<!-- BEGIN USER STYLES -->
<!-- END USER STYLES -->
<link rel="shortcut icon" href="<%=contextPath%>/favicon.ico" />
<!-- END HEAD -->

<!-- BEGIN PREFIX SCRIPTS -->
<script src="<%=contextPath%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<!-- END PREFIX SCRIPTS -->