<%@ page language="java" import="java.sql.*"
	contentType="text/html; charset=utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>检验注册页面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<style type="text/css">
#login {
	width: 450px;
	height: 100px;
	margin: 50px auto;
}

#btn {
	margin-left: 100px;
	margin-top: -25px;
	width: 120px;
	height: 25px;
	font-size: 11px;
}

body {
	background-color: #ecfcf9;
}
</style>
<!--  
    <link rel="stylesheet" type="text/css" href="styles.css">  
    -->

</head>

<body>
	<br>
	<%  
    request.setCharacterEncoding("utf-8");          //设置request对象字符编码格式
    String users=request.getParameter("username");  //获取表单中用户输入的用户名
    String pass=request.getParameter("password1");  //获取表单中用户输入的密码
   
    session.setAttribute("user1", users);           //将用户名，密码存到session对象中
    session.setAttribute("pass1", pass);
     
    String driver = "com.mysql.jdbc.Driver";      //连数据库
    String url = "jdbc:mysql://127.0.0.1:3306/testdb";    
    String use = "root";     
    String password = "13450376787zwq";    
    Class.forName(driver);    
    Connection conn= DriverManager.getConnection(url,use,password);  
   // PreparedStatement sql =conn.prepareStatement("select * from userregister where username=? and password=?");  
    
    PreparedStatement sql =conn.prepareStatement("select * from userregister where username=?");  
    sql.setString(1,users);      
    ResultSet rs=sql.executeQuery();       
 %>

	<%
  if(rs.next())     //用户名存在（返回true），就不能注册，
  {  
   sql.close();
   conn.close();
  %>
	<%--<% response.setHeader("refresh","2;url=register1.jsp");%> --%>
	<jsp:forward page="register_fail.jsp" />
	<%
   }
   else    //用户名不存在就可以注册  ，进入短信验证页面
   {  
   sql.close();
   conn.close();  
     %>
	<jsp:forward page="shortMessage.jsp" />
	<%}%>
</body>
</html>






