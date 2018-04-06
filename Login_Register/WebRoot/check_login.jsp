<%@page import="com.ruanko.RandomValidateCode"%>
<%@ page language="java" import="java.sql.*"
	contentType="text/html;charset=utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'check.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--  
    <link rel="stylesheet" type="text/css" href="styles.css">  
    -->
</head>
<body>
	<%  

   request.setCharacterEncoding("utf-8");  
   String users=request.getParameter("username");  //获取登录页面表单中用户输入的用户名，密码
   String pass=request.getParameter("password"); 
   

   boolean flag=false; 
   PreparedStatement sql=null;    
   ResultSet rs=null;  
   Connection conn=null;  
%>

	<%   
    String driver = "com.mysql.jdbc.Driver";    //连接数据库
    String url = "jdbc:mysql://127.0.0.1:3306/testdb";    
    String use = "root";     
    String password = "13450376787zwq";    
    Class.forName(driver);    
    conn= DriverManager.getConnection(url,use,password);
    
    //查询用户名和密码是否同时存在，用户名存在，说明用户已经注册过，    用户名和密码都存在时，再验证验证码是否输入正确，来决定是否能登录
    sql =conn.prepareStatement("select * from userregister where username=? and password=?");  
    sql.setString(1,users);  
    sql.setString(2,pass);  
    rs=sql.executeQuery(); 
    
    //查询用户是否注册，即用户名是否存在
    PreparedStatement sql1=conn.prepareStatement("select * from userregister where username=?");
    sql1.setString(1, users);
    ResultSet rs1=sql1.executeQuery();
    
    //比较验证码
    String input=request.getParameter("randomCode");   //获取用户输入的验证码
    String code=(String)session.getAttribute("RANDOMCODEKEY");  //获取自动生成的验证码   
    
     %>


	<% 
    if(!rs1.next())         //用户名不存在，则转向注册页面
    { 
    %>
	<jsp:forward page="register_remind.jsp" />

	<%}%>

	<%
    if(rs.next()){//用户名密码都正确
         if(input.equals(code)){//验证码输入正确
            flag=true;            
         }      
    }
   rs.close();
   rs1.close();  
   sql.close();  
   conn.close(); //断开连接 
  %>

	<!-- 判断是否是正确的登录用户 -->
	<% 
	if (flag==true)
	{
	 %>

	<jsp:forward page="login_success.jsp" />
	<%
	}
	else {	
	 %>
	<jsp:forward page="login_fail.jsp" />

	<%}%>
</body>
</html>
