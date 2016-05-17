<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>在路上</title>
		<!-- bootstrap css -->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/Awesome/css/font-awesome.min.css">
		<!-- //bootstrap css -->
		<!-- 自定义样式 -->
		<link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
		<link rel="stylesheet" href="<%=basePath%>main-css/adminstyle.css">
	</head>
	<body>
		<!-- HEADER PAGE -->
		<jsp:include page="../header.jsp"></jsp:include>
    	<!-- END / HEADER PAGE -->

		<!-- container -->
		<main class="allroute-main">
			<div class="container containerMinHeight">
				<div class="row">
				    <input type="hidden" value="${sessionScope.user.role}" id="role">
                    <div class="col-lg-2">	
	                    <c:if test="${sessionScope.user.role eq 1}">
							<jsp:include page="../guide/guide-nav.jsp"></jsp:include>
						</c:if>
	                    <c:if test="${sessionScope.user.role eq 2}">
							<jsp:include page="../admin/admin-nav.jsp"></jsp:include>
						</c:if>
                    </div>	
					<div class="col-lg-10">
						<ul class="nav nav-pills" role="tablist" id="myTab">
							<li role="presentation" id="item1">
								<a href="<%=basePath%>routeController/findRoutes?state=0">待审核</a>
							</li>
							<li role="presentation" id="item2">
								<c:if test="${sessionScope.user.role eq 2}">
									<a href="<%=basePath%>routeController/findRoutes?state=1">已审核</a>
								</c:if>
								<c:if test="${sessionScope.user.role eq 1}">
									<a href="<%=basePath%>routeController/findRoutes?state=1">在线上</a>
								</c:if>
							</li>
							<li role="presentation" id="item3">
								<a href="<%=basePath%>routeController/findRoutes?state=2">已下线</a>
							</li>
							<li role="presentation" id="item4">
								<a href="<%=basePath%>routeController/findRoutes?state=3">已拒绝</a>
							</li>
						</ul>
						<div class="tab-content" id="allrouteWrapper" data-dataNull="operateWarpeer">
						  	<div class="table-responsive">
								<table class="table table-bordered table-hover table-striped text-center table-condensed" id="allroute">
							    	<thead>
							    		<tr class="adimin-title">
							    			<th>线路编号</th>
							    			<th>线路名称</th>
							    			<th>提交时间</th>
							    			<th>商家信息</th>
							    			<th>价格</th>
							    			<th>操作</th>
							    		</tr>	
							    	</thead>
								    <tbody>
								    	<c:forEach var="r" items="${page_list.data}">
								    		<tr data-dataNull="operate">
								    			<td></td>
								    			<td>${r.routeName}</td>
								    			<td>${r.time}</td>
								    			<td>${r.userName}</td>
								    			<td>${r.price}</td>
								    			<c:if test="${state==0}">
									    		<td>
													<c:if test="${sessionScope.user.role eq 2}">
									    				<a href="<%=basePath%>routeController/findRouteByRouteId?routeId=${r.routeId}" data-toggle="modal">
									    				审核</a>
								    				</c:if>
									    			<c:if test="${sessionScope.user.role eq 1}">
									    				<a href="<%=basePath%>routeController/findRouteByRouteId?routeId=${r.routeId}" data-toggle="modal">
									    				查看</a>
									    			</c:if>
									    			</td>
								    			</c:if>
								    			<c:if test="${state!=0}">
									    			<td><a href="<%=basePath%>routeController/findRouteByRouteId?routeId=${r.routeId}" data-toggle="modal">
									    			查看</a></td>
								    			</c:if>
								    		</tr>
										</c:forEach>
								    </tbody>
								</table>

								<!-- 页码 -->
								<table class="page">
									<tr>
										<td>
											<c:if test="${page_list.currentPage==1}">
    											<span class="disabled">首&nbsp;&nbsp;&nbsp;页</span>
    											<span class="disabled">上一页</span>
    										</c:if> 
		    								<c:if test="${page_list.currentPage!=1}">
												<span><a href="javascript:Page.gotoPage(1)">首&nbsp;&nbsp;&nbsp;页</a></span>
												<span><a href="javascript:Page.gotoPage(${page_list.currentPage-1})">上一页</a></span>
											</c:if> 
											<c:if test="${page_list.currentPage==page_list.totalPage}">
		       									<span class="disabled">下一页</span>
		       									<span class="disabled">尾&nbsp;&nbsp;&nbsp;页</span> 
		       								</c:if> 
		       								<c:if test="${page_list.currentPage!=page_list.totalPage}">
												<span><a href="javascript:Page.gotoPage(${page_list.currentPage+1})">下一页</a></span>
												<span><a href="javascript:Page.gotoPage(${page_list.totalPage})">尾&nbsp;&nbsp;&nbsp;页</a></span>
											</c:if>
										</td>
										<td>
											<form action="<%=basePath%>routeController/findRoutes" id="form">
												<input type="hidden" name="state" value="${state}">
												<input type="hidden" name="pageSize" value="${page_list.rowsPage}" onchange="Page.Jumping()">
												<input type="hidden" name="totalPage" value="${page_list.totalPage}">
												第<select name="pageCurrent" id="pageCurrent" onchange="Page.Jumping()">
												<c:forEach begin="1" end="${page_list.totalPage}" var="i">
													<c:if test="${page_list.currentPage==i}">
														<option selected value="${i}">${i}</option>
													</c:if>
													<c:if test="${page_list.currentPage!=i}">
														<option value="${i}">${i}</option>
													</c:if>
												</c:forEach>
												</select>页
											</form>
										</td>
									</tr>
								</table>
								<!-- //页码 -->
						  	</div>
						</div>
					</div>
				</div>	
			</div>
		</main>
		<!-- //container -->

		<!-- FOOTER PAGE -->
 		<jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->
        
        <!-- 插件脚本 -->
		<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
		<!-- 自定义脚本 -->
		<script src="<%=basePath%>main-js/page.js"></script>
		<script src="<%=basePath%>main-js/allRoute.js"></script>
		<script src="<%=basePath%>main-js/dataNull.js"></script>
	</body>                                                                         
</html>