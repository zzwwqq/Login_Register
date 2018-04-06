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

<title>WelcomeLogin</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<!-- 引入 login.css文件 -->
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

	<script type="text/javascript">
		function refresh(obj){
			obj.src="imageServlet?"+Math.random();
		}
	</script>
</head>

<body>

	<h1>Welcome Login</h1>

	<div class="login-form">
	<!-- 每个键值对之间分号隔开  -->
		
		<div class="close"></div>
		<div class="clo"></div>
		
		<!-- 脱离文档流 -->
		<div class="head-info">
			<label class="lbl1"></label> <label class="lbl2"></label> <label class="lbl3"></label>
		</div>
		<div class="clear"></div>
		<!-- 为了清除浮动 -->
		<div class="avtar">
			<img src="images/avtar.png" />
		</div>
		<!-- action 属性规定当提交表单时，向何处发送表单数据。 
		登录和注册两个input语句不能换行，必须在同一行
		-->
		<div>
			<form name="login" method="post" action="check_login.jsp">

				<input type="text" name="username" class="text" value="Username"
					onfocus="this.value = '';"
					onblur="if(this.value==''){this.value='Username';}" />
					 <input type="password" name="password" class="key" value="123456"
					onfocus="this.value='';"
					onblur="if(this.value==''){this.value='1223334444'}" /> 
					<label class="registerlabel">输入验证码：</label>
    	            <input type="text" name="randomCode" class="verify" value="" onfocus="this.value='';"
					onblur="if(this.value==''){this.value=''}"/>
    	            <img title="点击"  onclick="javascript:refresh(this);" src="imageServlet"/>
    	            <br/>
    	            <p class="hereregister">如果您还没有注册，请单击<a href="register.jsp" class="hereregister1">这里</a>注册！<a href="#" class="fondpassword">忘记密码？</a> </p>
					<input type="submit" value="登录" class="signin" /><input type="reset" value="重置" class="reset"/>									
				<!-- 脱离文档流 -->
			</form>
		</div>

	</div>
  
	<div class="copy-rights">
		<p>
			Copyright &copy; 2018. zwq All rights reserved.please visit github
			for more information. <a href="https://github.com/" title="zwqgithub"
				target="_blank">GitHub</a>
		<p />
	</div>
</body>
</html>
