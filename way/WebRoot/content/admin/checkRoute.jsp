<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>

<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>在路上</title>
		<!-- bootstrap css -->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/Awesome/css/font-awesome.min.css">
		<!-- 自定义样式 -->
		<link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
		<link rel="stylesheet" href="<%=basePath%>main-css/adminstyle.css">
	</head>
	<body class="checkRoute">
	    <!-- header -->
		<jsp:include page="../header.jsp"></jsp:include>
	 	<!-- //header -->

		<main>
			<div class="main-top">
				<a id="goBack" onclick="history.go(-1)">返回</a>
			</div>
			<div class="container checkRoute-container containerMinHeight">
				<div class="row">
					<a class="checkRoute-title" href="javascript:void(0);">
		                <span>线路审核:</span>
		                <span class="poptip-arrow poptip-arrow-top">▼</span>
            		</a>
					<div class="col-lg-10">
						<div class="form-horizontal">
				  			<div class="form-group">
				    			<label for="roteName" class="col-lg-2 col-lg-offset-4 control-label describe-label">线路名称:</label>
				    			<div class="col-lg-4">
				     				<input type="text" class="form-control" id="roteName" value="${route.routeName}" readonly>
				    			</div>
				  			</div>
				  			<div class="form-group">
				    			<label for="routePrice" class="col-lg-2 col-lg-offset-4 control-labe describe-label">价格:</label>
				    			<div class="col-lg-4">
				     				<input type="text" class="form-control" id="routePrice" value="${route.price}" readonly>
				    			</div>
				  			</div>
				  			<div class="form-group">
				    			<label for="message" class="col-lg-2 col-lg-offset-4 control-labe describe-label">商家信息:</label>
				    			<div class="col-lg-4">
				    				<input type="text" class="form-control" value="${route.userName}" readonly>
				    			</div>
				  			</div>
				  			<div class="form-group">
				    			<label for="views" class="col-lg-2 col-lg-offset-4 control-label describe-label" >全部景点:</label>
				    			<div class="col-lg-4">
				     				<input type="text" class="form-control" id="views" value="${route.views}" readonly>
				    			</div>
				  			</div>
				  			<c:if test="${route.refuse!=null}">
								<div class="form-group">
					    			<label for="refuse" class="col-lg-2 col-lg-offset-4 control-label describe-label" >拒绝理由:</label>
					    			<div class="col-lg-4">
					    				<input type="text" class="form-control" value="${route.refuse}" readonly>
					    			</div>
					  			</div>
				  			</c:if>
							<div class="form-group">
								<label for="trip" class="col-lg-2 col-lg-offset-4 control-label describe-label" >线路行程:</label>
				  			</div>
							<c:forEach var="s" items="${route.schedules}">
					  			<div class="form-group">
				  					<div class="col-lg-2 col-lg-offset-4 control-label day-label">
				    					<span>第${s.scheduleTime}天：</span>
				    				</div>
				    				<div class="col-lg-4 day-content">
				    					<span>${s.scheduleContent}</span>
				    				</div>
					  			</div>
							</c:forEach>
							<c:if test="${sessionScope.user.role eq 2}">
								<c:if test="${route.state eq 0}">
								    <div class="col-lg-offset-6 col-lg-6">
								    	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#start">通&nbsp;&nbsp;&nbsp;&nbsp;过</button>
								
						                <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">不通过</button>
							  	    </div>
							    </c:if>
						    </c:if>
						    <c:if test="${sessionScope.user.role eq 1}">
						    	<c:if test="${route.state eq 1}">
						    	<div class="col-lg-offset-6 col-lg-6">
									<button type="button" class="btn btn-default" data-toggle="modal" data-target="#outline">下线</button>
								</div>
						    	</c:if>
						    	<c:if test="${route.state eq 2}">
						    	<div class="col-lg-offset-6 col-lg-6">
			                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#inline">上线</button>
			                    </div>
						    	</c:if>
						    </c:if>
						</div>
					</div>
				</div>
			</div>
		</main>

		<!-- 拒绝理由模态框 -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">拒绝理由</h4>
                    </div>
					<form action="<%=basePath%>routeController/applyRoute" method="post">
						<input type="hidden" name="routeId" value="${route.routeId}">
						<input type="hidden" name="state" value="3">
						<div class="modal-body">
						    <textarea name="refuse" id="refuse" rows="8" class="form-control" style="resize:none;"></textarea>
						</div>
						<div class="modal-footer">
							<p class="tip">请输入拒绝理由！</p>
						    <input class="btn btn-info" id="submitbtn" type="submit"  value="提交">
						</div>
					</form>
                </div>
            </div>                    
        </div>
        <!-- // 拒绝理由模态框 -->

        <!-- 通过 -->
        <div class="modal fade xs" id="start" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-center" id="myModalLabel2">你确定要通过吗?</h4>
                    </div>
                    <div class="modal-footer text-center">
                    	<form action="<%=basePath%>routeController/applyRoute" method="post">
                    		<input type="hidden" name="routeId" value="${route.routeId}">
							<input type="hidden" name="state" value="1">
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        	<input class="btn btn-primary" type="submit"  value="提交">
                    	</form>
                    </div>
                </div>
            </div>
        </div>

        <!-- 上线 -->
        <div class="modal fade xs" id="inline" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-center" id="myModalLabel2">你确定要上线吗?</h4>
                    </div>
                    <div class="modal-footer text-center">
                    	<form action="<%=basePath%>routeController/applyRoute" method="post">
                    		<input type="hidden" name="routeId" value="${route.routeId}">
							<input type="hidden" name="state" value="1">
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        	<input class="btn btn-primary" type="submit"  value="提交">
                    	</form>
                    </div>
                </div>
            </div>
        </div>

        <!-- 下线 -->
        <div class="modal fade xs" id="outline" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-center" id="myModalLabel2">你确定要下线吗?</h4>
                    </div>
                    <div class="modal-footer text-center">
                    	<form action="<%=basePath%>routeController/applyRoute" method="post">
                    		<input type="hidden" name="routeId" value="${route.routeId}">
							<input type="hidden" name="state" value="2">
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        	<input class="btn btn-parimary" type="submit"  value="提交">
                    	</form>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- FOOTER PAGE -->
 		<jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

        <!-- 插件脚本 -->
		<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
		<!-- 自定义脚本 -->
		<script src="<%=basePath%>main-js/checkRoute.js"></script>
	</body> 
</html>