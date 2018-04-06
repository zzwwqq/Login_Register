<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

 <style type="text/css">
        #login{ width:450px; height:100px; margin:50px auto;}
        #btn{ margin-left:100px; margin-top:-25px; width: 120px;height: 25px; font-size: 11px; }
        body{ background-color: #ecfcf9;}
    </style>


<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	 <% out.println("您输入的账号不存在，请先注册后再登录,3秒后将自动进入注册界面。。。。。");%>   
  <% response.setHeader("refresh","3;url=register.jsp");%>  
</body>
</html>
