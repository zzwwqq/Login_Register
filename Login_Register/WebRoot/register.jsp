<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
      
    <title>这是注册页面</title>  
      
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
    
<script language="javascript">    
function isValid(form)    
{    
if (form.username.value=="")    
 {    
 alert("用户名不能为空");    
 return false;    
 }    
if (form.password1.value!=form.password2.value)    
{    
alert("两次输入的密码不同！");    
return false;    
}    
else  if (form.password1.value=="")    
{    
alert("用户密码不能为空！");    
return false;    
}    
else return true;    
}    
</script>    
</head>  
   
  <body>  
  <center>  
   <body bgcolor="#e3e3e3">  
  <h2>用户注册</h2>  
  <form action="check_register.jsp" method="post" onSubmit="return isValid(this);">  
<table>  
  <tr><td>用户名:</td><td><input type="text" name="username" size="20"/></td></tr>  
  <tr><td>输入密码:</td><td><input type="text" name="password1" size="20"/></td></tr>  
  <tr><td>再次确认密码:</td><td><input type="text"name="password2" size="20"/></td><tr>  
  <tr><td><input type="submit" value="提交"/><td><input type="reset" value="重置"/>  
  </table>  
</form>  
  </center>  
   <br>  
  </body>  
</html>  



