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
<!-- BEGIN THEME GLOBAL STYLES -->
<link href="<%=contextPath%>/assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
<link href="<%=contextPath%>/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<link href="<%=contextPath%>/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/layouts/layout/css/custom.css" rel="stylesheet" type="text/css" />
<link href="<%=contextPath%>/assets/layouts/layout/css/themes/blue.min.css" rel="stylesheet" type="text/css" id="style_color" />
<link href="<%=contextPath%>/assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
<!-- END THEME LAYOUT STYLES -->
<!-- BEGIN USER STYLES -->
<%--<link rel="stylesheet" href="<%=contextPath%>/assets/global/plugins/jquery-ztree/themes/zTreeStyle/zTreeStyle.css" type="text/css">--%>
<link rel="stylesheet" href="<%=contextPath%>/assets/global/plugins/jquery-ztree/themes/metroStyle/metroStyle.css" type="text/css">
<!-- END USER STYLES -->
<link rel="shortcut icon" href="<%=contextPath%>/favicon.ico" />
<!-- END HEAD -->

<!-- BEGIN PREFIX SCRIPTS -->
<script src="<%=contextPath%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=contextPath%>/assets/global/plugins/jquery-ztree/js/jquery.ztree.core.min.js" type="text/javascript"></script>
<!-- END PREFIX SCRIPTS -->