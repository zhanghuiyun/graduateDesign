<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
	    <base href="<%=basePath%>">
	    <title>哎呀，糟糕</title>
  	</head>
  
  	<body>
	  	<div class="container">
	  		<div class="row">
	  			<div class="col-lg-8 col-lg-offset-2">
	  				<h2>异常页面</h2>
	  			</div>
	  			<div class="col-lg-8 col-lg-offset-2">
	  				<h3>${param.exception}</h3>
	  			</div>
	  		</div>
	  	</div>
  	</body>
</html>
