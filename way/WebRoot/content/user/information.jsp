<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>用户信息</title>
        <!-- 引入插件样式 -->
        <link rel="stylesheet" href="<%=basePath %>css/lib/bootstrap.min.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" href="<%=basePath %>main-css/accountInfomation.css">
    </head>
    <body class="infomation">
        <!-- HEADER PAGE -->
    	<jsp:include page="../header.jsp"></jsp:include>
        <!-- END / HEADER PAGE -->

		<div class="container containerMinHeight">
			<div class="row">
                <!-- S 导航栏 -->
                <input type="hidden" value="${sessionScope.user.role}" id="role">
                <div class="col-md-2 col-md-offset-1 top">
					<c:if test="${sessionScope.user.role eq 0}">
						<jsp:include page="../tourist/tourist-nav.jsp"></jsp:include>
					</c:if>
					<c:if test="${sessionScope.user.role eq 1}">
						<jsp:include page="../guide/guide-nav.jsp"></jsp:include>
					</c:if>
					<c:if test="${sessionScope.user.role eq 2}">
						<jsp:include page="../admin/admin-nav.jsp"></jsp:include>
					</c:if>
				</div>
                <!-- S 导航栏 -->

                <!-- S 用户信息 -->
                <div class="col-md-5 border col-md-offset-1 user-message">
                    <!-- S 头像 -->
                    <form class="form-horizontal" role="form" action="<%=basePath%>userController/modifyHeadImg" method="post" enctype="multipart/form-data" >
               		   <div class="form-group top_border">
                        	<label for="tourist-picture" class="col-sm-3 control-label">头像：</label>
                        	<div class="col-sm-2">
                          		<img src="<%=basePath%>headImg/${sessionScope.user.img}" id="tourist-picture" name="img" style="width: 50px; height: 50px;">
                        	</div>
                            <div class="col-sm-2">
                            	<input type="submit" id="tourist-submit" name="tourist-submit" value="更改头像">
                            </div>
                            <div class="col-sm-4">
                          		<input type="file" id="tourist-upload" name="img" onchange="previewImage(this)">
                        	</div>
                      	</div>
                    </form>
                    <!-- E 头像 -->

                	<form id="personalData" class="form-horizontal" role="form" action="<%=basePath %>userController/modifyInfo" method="post">
                    	<input type="hidden" name="userId" value="${sessionScope.user.userId}">
                        <!-- 用户名 -->
						<div class="form-group">
                        	<label for="tourist-username" class="col-sm-3 control-label">用户名：</label>
                        	<div class="col-sm-8">
                          		<input type="text" class="form-control" id="tourist-username" name="userName" value="${sessionScope.user.userName}" readonly>
                        	</div>
                      	</div>
                        <!-- 联系电话 -->
                        <div class="form-group">
                        	<label for="tourist-telphone" class="col-sm-3 control-label">联系电话：</label>
                        	<div class="col-sm-8">
                          		<input type="text" class="form-control" id="tourist-telphone" name="telephone" value="${sessionScope.user.telephone}">
                                <p id="teleInfo"></p>
                        	</div>
                      	</div>
                        <!-- 邮箱 -->
                        <div class="form-group">
                        	<label for="tourist-email" class="col-sm-3 control-label">E-mail：</label>
                        	<div class="col-sm-8">
                          		<input type="email" class="form-control" id="tourist-email" name="mail" value="${sessionScope.user.mail}" readonly>
                        	</div>
                      	</div>
                      	<!-- 导游，旅行社 -->
                      	<c:if test="${sessionScope.user.role==1}">
                            <!-- 真实姓名 -->
                            <div class="form-group">
                        	    <label for="tourist-relname" class="col-sm-3 control-label">真实姓名：</label>
                            	<div class="col-sm-8">
                              		<input type="text" class="form-control" id="tourist-relname" name="realName" value="${sessionScope.user.realName}" readonly>
                            	</div>
                      	    </div>
                            <!-- 证件号码 -->
                            <div class="form-group">
                            	<label for="tourist-idnum" class="col-sm-3 control-label">证件号：</label>
                            	<div class="col-sm-8">
                              		<input type="text" class="form-control" id="tourist-idnum" name="idNumber" value="${sessionScope.user.idNumber}" readonly>
                            	</div>
                          	</div>
                            <!-- 证件照 -->
                            <div class="form-group">
                            	<label class="col-sm-3 control-label">证件照：</label>
                            	<div class="col-sm-8">
                              		<img src="<%=basePath%>headImg/${sessionScope.user.picture}" id="identiImg">
                            	</div>
                          	</div>
                      	</c:if>
                      	<!-- 个人简介 -->  
                        <div class="form-group">
                        	<label for="tourist-introduction" class="col-sm-3 control-label" name="tourist-introduction">个人简介：</label>
                        	<div class="col-sm-8">
                          		<textarea class="form-control" id="tourist-introduction" name="introduce"  rows="6">${sessionScope.user.introduce}</textarea>
                                <p id="introduceInfo"></p>
                        	</div>
                      	</div>
                        <div class="form-group">
                        	<div class="col-sm-8 col-sm-offset-3">
                          		<input type="submit" class="form-control btn btn-primary col-sm-12" id="tourist-save" name="tourist-save" value="保存">
                        	</div>
                      	</div>
                	</form>
                </div>
                <!-- S 用户信息 -->
          	</div>
        </div>

        <!-- FOOTER PAGE -->
 		<jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->
        
        <!-- 插件脚本 -->
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <!-- 自定义脚本 -->
        <script src="<%=basePath %>main-js/tourist-personaldata.js"></script>
    </body>
</html>
