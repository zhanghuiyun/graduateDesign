<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>景点管理</title>
		<!-- bootstrap css -->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/Awesome/css/font-awesome.min.css">
		<!-- //bootstrap css -->
		<link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
		<link rel="stylesheet" href="<%=basePath%>main-css/adminstyle.css">
	</head>
	<body class="allview">
		<!-- header -->
		<jsp:include page="../header.jsp"></jsp:include>
    	<!-- //header -->

		<!-- container -->
		<main class="allview-main containerMinHeight">
			<div class="container">
				<!-- 侧边导航 -->
				<div class="col-lg-2">
					<jsp:include page="admin-nav.jsp"/>
				</div>
                	
				<div class="col-lg-10" id="allViewWrapper" data-dataNull="operateWarpeer">	
					<table class="table table-bordered table-hover table-striped text-center table-condensed" id="allView">
						<thead>
							<tr class="adimin-title">
						 		<th>景点编号</th>
						 		<th>景点名称</th>
						 		<th>景点地址</th>
						 		<th>分数</th>
						 		<th>操作</th>
							</tr>	
						</thead>
						<tbody >
							<c:forEach var="v" items="${page_list.data}">
							    <tr data-dataNull="operate">
								    <td></td>
							    	<td>${v.viewName}</td>
								    <td>${v.viewAddress}</td>
								    <td>${v.viewGrade}</td>
								    <td>
								    	<a data-toggle="modal" data-target="#edit" data-id="${v.viewId}">修改</a>
								    </td>
							    </tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 分页 -->
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
					       		<span class="disabled">下一页</span>  <span class="disabled">尾&nbsp;&nbsp;&nbsp;页</span> 
					       	</c:if> 
					       	<c:if test="${page_list.currentPage!=page_list.totalPage}">
								<span><a href="javascript:Page.gotoPage(${page_list.currentPage+1})">下一页</a></span>
								<span><a href="javascript:Page.gotoPage(${page_list.totalPage})">尾&nbsp;&nbsp;&nbsp;页</a></span>
							</c:if>
						</td>
						<td>
							<form action="<%=basePath%>viewController/findViews" id="form">
								<input type="hidden" name="state" value="${state}">
								<input type="hidden" value="${reserveRole}" id="reserveRole">
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
				<!-- //分页 -->
			</div>
		</main>
		<!-- //container -->
	
		<!-- 启用模态窗口 -->
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        	<span aria-hidden="true">&times;</span>
                        </button>
                       <h3 class="modal-title text-center" id="myModalLabel" >修改景点</h3>
                    </div>
                   	<div class="modal-body">
                		<form action="<%=basePath%>viewController/updateView" method="post" class="form-horizontal" id="personalData">	
                			<input type="hidden" name="viewId" id="viewId">
							<div class="form-group">
                        		<label for="account" class="col-sm-3 control-label">景点名称</label>
                        		<div class="col-sm-7">
                          			<input type="text" class="form-control" id="viewname" name="viewName">
                          			<p class="tip allview-tip">格式正确</p>
                        		</div>
                      		</div>
                        	<div class="form-group">
                        		<label for="relName" class="col-sm-3 control-label">景点地址</label>
                        		<div class="col-sm-7">
                          			<input type="text" class="form-control" id="viewattr" name="viewAddress">
                          			<p class="tip allview-tip">格式正确</p>
                        		</div>
                      		</div>
                        	<div class="form-group">
                        		<label for="identifyNum" class="col-sm-3 control-label">景点描述</label>
                        		<div class="col-sm-7">
                          			<textarea type="text" class="form-control" id="viewdesc" name="viewRemark" rows="4"></textarea>
                          			<p class="tip allview-tip">格式正确</p>
                        		</div>
                      		</div>
                        	<div class="form-group">
                        		<label for="intro" class="col-sm-3 control-label">旅游项目推荐</label>
                        		<div class="col-sm-7">
                          			<textarea class="form-control" id="intro" name="viewRecommend" rows="7"></textarea>
                          			<p class="tip allview-tip">格式正确</p>
                        		</div>
                      		</div>
                      		<input id="change"  class="btn btn-info" type="submit" value="修改" disabled="disabled" />
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
		<script src="<%=basePath%>main-js/page.js"></script>
		<script src="<%=basePath%>main-js/allView.js"></script>
		<script src="<%=basePath%>main-js/dataNull.js"></script>
	</body>
</html>