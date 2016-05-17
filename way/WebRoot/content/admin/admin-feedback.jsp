<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String path = request.getContextPath();String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>

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
	<body class="admin-feedback">

		<!-- header -->
		<jsp:include page="../header.jsp"></jsp:include>
 		<!-- //header -->

		<!-- container -->
		<main>
			<div class="container containerMinHeight">
				<div class="row">
					<!-- 导航 -->
					<div class="col-lg-2">
						<jsp:include page="admin-nav.jsp"/>
					</div>
					<!-- //导航 -->

					<!-- 反馈面板 -->
					<div class="col-lg-10">
						<ul class="nav nav-pills" role="tablist" id="myTab">
							<li role="presentation" id ="noMessage">
								<a href="<%=basePath%>feedbackController/feedback?state=0">未反馈</a>
							</li>
							<li role="presentation" id ="message">
								<a href="<%=basePath%>feedbackController/feedback?state=1">已反馈</a>
							</li>
						</ul>
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" data-dataNull="operateWarpeer" id="home">
								<table class="table-responsive table table-bordered table-hover table-striped text-center" id="feekbackTable">
							    	<thead>
								    	<tr class="adimin-title">
							    			<th>编号</th>
							    			<th>提问者</th>
							    			<th>问题</th>
							    			<c:if test="${state eq 1}">
								    			<th>回复内容</th>
							    			</c:if>
							    			<th>提问时间</th>
							    			<c:if test="${state eq 1}">
							    				<th>回复时间</th>
							    			</c:if>
							    			<c:if test="${state eq 0}">
							    				<th>操作</th>
							    			</c:if>
							    		</tr>	
							    	</thead>

							    	<tbody>
							    		<c:forEach var="f" items="${page_list.data}">
								    		<tr data-dataNull="operate">
							    				<input type="hidden" id="reserveRole" value="${reserveRole}" >
							    				<td></td>
								    			<td>${f.userName }</td>
								    			<td id="feedbackContent">${f.feedbackContent}</td>
								    			<c:if test="${f.answerContent!=null}">
								    				<td>${f.answerContent}</td>
								    			</c:if>
								    			<td>${f.feedbackTime}</td>
								    			<c:if test="${f.answerTime!=null}">
								    				<td>${f.answerTime}</td>
								    			</c:if>
								    			<c:if test="${f.answerTime==null}">
								    				<td><a data-toggle="modal"  data-target="#edit" data-id="${f.feedbackId}" data-content = "${f.feedbackContent}">反馈</a></td>
								    			</c:if>
									    	</tr>
										</c:forEach>
							    	</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- //反馈面板 -->

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
								<form action="<%=basePath%>feedbackController/feedback" id="form">
									<input type="hidden" name="state" value="${state}">
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
		</main>
		<!-- //container -->

		<!-- FOOTER PAGE -->
 		<jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

		<!-- 反馈模态框 -->
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
                        <h4 class="modal-title">问题:<span id="a_feedbackContent"></span></h4>
                    </div>
                	<form action="<%=basePath%>feedbackController/updateFeedback" method="post">
			    		<input type="hidden" name="feedbackId" id="a_feedbackId" value="">
				 		<input type="hidden" name="state" value="${state }">
				 		<input type="hidden" name="pageCurrent" value="${page_list.currentPage}">
				 		<div class="madal-body">
				    		<textarea class="form-control" name="answerContent"  id="feedbackmes" rows="10"></textarea>
				    	</div>
				    	<div class="modal-footer">
				    		<p class="tip feedback-tip">请输入反馈信息!</p>
			    			<input type="submit" class="btn btn-info submitBtn" value="回复" id="submitBtn" disabled="disabled">
			    		</div>
					</form>
                </div>
            </div>
        </div>
        <!-- //反馈模态框 -->
        
        <!-- 插件脚本 -->
		<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
		<!-- 自定义脚本-->
		<script src="<%=basePath%>main-js/page.js"></script>
		<script src="<%=basePath%>main-js/dataNull.js"></script>
		<script src="<%=basePath%>main-js/admin-feedback.js"></script>
	</body>
</html>