<%@ page language="java" import="java.util.*" import ="java.sql.*"
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
    <%
    request.setCharacterEncoding("utf-8");
    String driver = "com.mysql.jdbc.Driver";   //连接数据库 
    String url = "jdbc:mysql://127.0.0.1:3306/testdb";    
    String use = "root";     
    String password = "13450376787zwq";    
    Class.forName(driver);    
    Connection conn= DriverManager.getConnection(url,use,password);  
    PreparedStatement sql1 =conn.prepareStatement("insert into userregister(username,password)values(?,?)");  
   
    String a=(String)session.getAttribute("user1");        //获取session对象中存放的用户输入的用户名，密码
    String b=(String)session.getAttribute("pass1");
    
    sql1.setString(1,a);  
    sql1.setString(2,b);     
    sql1.executeUpdate();   
    sql1.close();//断开连接
    conn.close();  
    out.println("恭喜您注册成功,3秒后将自动返回登录界面。。。。"); 
    response.setHeader("refresh","3;url=login.jsp");   
     %> 
</body>
</html>
