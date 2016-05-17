<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
		<title></title>
		<!-- 引入插件样式 -->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
		<!-- 自定义样式 -->
		<link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrapValidator.css">
		<style type="text/css">
			.email-font{
				font-size: 50px;
				margin-top: 50px;
				margin-bottom: 50px;
			}
		</style>
	</head>
	<body>

	  	<!-- HEADER PAGE -->
		<jsp:include page="header.jsp"></jsp:include>
	  	<!-- END / HEADER PAGE -->
	  	
	    <div class="container containerMinHeight">
	    	<div class="row">
	    		<div class="col-lg-12 text-center email-font">
	    			<p>"在路上"旅游网，请输入新密码进行设置</p>
	    		</div>
	    	</div>
	    </div>
	   <h2 align="center"> ${exception.message}${success}</h2>

	   <div class="container">
			<form class="form-horizontal" method="post" action="<%=basePath%>userController/resetPassword" id="emailForm">
			     <div class="row">
			         <div class="col-lg-9 col-lg-offset-3">
					    <div class="form-group">
					        <label for="newPassword" class="col-lg-2 control-label">新密码：</label>
					    	<div class="col-lg-3">
					      	<input type="password" class="form-control" id="password" placeholder="请输入新密码" name="password" autofocus>
					    	</div>
					  	</div>
				    </div>
					<div class="col-lg-9 col-lg-offset-3">
					  	<div class="form-group">
					    	<div class="col-lg-3">
					      	<input type="hidden" class="form-control" name="code" value="${param.code}">
					    	</div>
					  	</div>
					</div>
					<div class="col-lg-9 col-lg-offset-3">
					  	<div class="form-group">
					    	<label for="rePassword" class="col-lg-2 control-label">确认密码：</label>
					    	<div class="col-lg-3">
					     	<input type="password" class="form-control" id="rePassword" placeholder="请保证输入一致" name="confirmPassword">
					    	</div>
					  	</div>
					</div>
				    <div class="col-lg-9 col-lg-offset-3">
					  	<div class="form-group">
					  		<div class="col-lg-2 col-lg-offset-2" >
					      		<input type="submit" class="form-control btn-primary" id="validateBtn">
					    	</div>
					    </div>
					</div>    
			    </div>
			</form>
	    </div>

	    <!-- FOOTER PAGE -->
	 	<jsp:include page="footer.jsp"></jsp:include>
	    <!-- END / FOOTER PAGE -->

	    <!-- 插件脚本 -->
		<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
	    <script type="text/javascript" src="<%=basePath%>js/lib/bootstrapValidator/bootstrapValidator.js"></script>
	</body>
</html>