<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<!-- Page title -->
<title>Login</title>
<!-- End of Page title -->
<!-- Libraries -->
 <style type="text/css">
        #login{ width:450px; height:100px; margin:50px auto;}
        #btn{ margin-left:100px; margin-top:-25px; width: 120px;height: 25px; font-size: 11px; }
        body{ background-color: #ecfcf9;}
    </style>

</head>
<body>

	<p>欢迎您,登录成功！</p>

</body>
</html>

