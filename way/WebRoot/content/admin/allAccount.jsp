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
		<title>账户管理</title>
		<!-- bootstrap css -->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/Awesome/css/font-awesome.min.css">
		<!-- //bootstrap css -->
		<!-- 自定义样式 -->
		<link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
		<link rel="stylesheet" href="<%=basePath%>main-css/adminstyle.css">
	</head>

	<body class="allaccount">
	    <!-- header -->
	    <jsp:include page="../header.jsp"></jsp:include>
        <!-- // header -->

		<!-- container -->
		<main class="allaccount-main">
			<div class="container containerMinHeight">
				<div class="row">
					<!-- 导航 -->
					<div class="col-lg-2">
						<jsp:include page="admin-nav.jsp"/>
					</div>
					<!-- //导航 -->
                	<!-- 账户信息 -->
					<div class="col-lg-10">
						<ul class="nav nav-pills" role="tablist" id="myTab">
							<c:if test="${state != 2}">
								<li role="presentation" id ="message0" ><a href="<%=basePath%>userController/findAllUser?role=0">游客</a></li>
								<li role="presentation" id ="message1"><a href="<%=basePath%>userController/findAllUser?role=1">导游/旅行社</a></li>
							</c:if>
							<c:if test="${state == 2}">
								<li role="presentation" id ="message3" class="active"><a>待审批导游/旅行社</a></li>
							</c:if>
						</ul>
						<div class="tab-content" id="allAcountWrapper" data-dataNull="operateWarpeer">
							<table class="table-responsive table table-bordered table-hover table-striped text-center table-allAccount" id="allAcount">
								<thead>
								    <tr class="adimin-title">
								    	<th>用户名</th>
								    	<th>联系电话</th>
								    	<th>Email</th>
								    	<th>失约次数</th>
								    	<th>账户状态</th>
								    	<th>操作</th>
								    </tr>	
								</thead>
								<tbody>
						 		<c:forEach var="u" items="${page_list.data}">
								    <tr data-dataNull="operate">
								    	<th>${u.userName}</th>
								    	<th>${u.telephone}</th>
								    	<th>${u.mail}</th>
								    	<th>${u.afalse}</th>
								    	<th>
								    		<c:if test="${u.state eq 1}">
								    			<a data-toggle="modal" data-target="#forbid" data-userId="${u.userId}">禁用</a>
											</c:if>
											<c:if test="${u.state eq 0}">
												<a data-toggle="modal" data-target="#start" data-userId="${u.userId}">启用</a>
								    		</c:if>
							    			<c:if test="${u.state eq 2}">
												<a data-toggle="modal" data-target="#pass" data-userId="${u.userId}">通过</a>
												<a data-toggle="modal" data-target="#nopass" data-userId="${u.userId}" data-userName="${u.userName}">不通过</a>
							    			</c:if>
								    	</th>
								    	<th>
								    		<c:if test="${role eq 0}">
								    			<a data-toggle="modal" data-target="#touristdetail"  data-userId="${u.userId}">查看</a>
								    		</c:if>
								    		<c:if test="${role eq 1}">
								    			<a data-toggle="modal" data-target="#guidedetail"  data-userId="${u.userId}">查看</a>
								    		</c:if>
								    	</th>
								    </tr>
								</c:forEach>
								</tbody>
							</table>
						</div> 

						<!--  分页 -->
						<c:if test="${state!=2}">				
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
										<form action="<%=basePath%>userController/findAllUser" id="form">
										    <input type="hidden" name="role" value="${role}">
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
						</c:if> 
						<!--  // 分页 -->
					</div>
					<!-- // 账户信息 -->
			    </div>
			</div>
		</main>
		<!-- //container -->
		
		<!-- FOOTER PAGE -->
 		<jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

		<!-- 游客查看 -->
	    <div class="modal fade" id="touristdetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                   <h3 class="modal-title text-center" id="myModalLabel" >用户详情</h3>
	                </div>
               		<div class="modal-body">
            			<form class="form-horizontal" id="personalData" role="form">	
                  			<div class="form-group logo">
                    			<div class="col-sm-7">
                      				<img src="" id="logo" width="100" height="150">
                    			</div>
                  			</div>
                  			<div class="message">
	    						<div class="form-group">
	                    			<label for="account" class="col-sm-4 control-label">用户名:</label>
	                    			<div class="col-sm-7">
	                      				<input type="text" class="form-control  allaccount-input" id="username" disabled>
	                    			</div>
	                  			</div>
	                    		<div class="form-group">
	                    			<label for="relName" class="col-sm-4 control-label">邮箱:</label>
	                    			<div class="col-sm-7">
	                      				<input type="text" class="form-control allaccount-input" id="mail" disabled>
	                    			</div>
	                  			</div>
	                    		<div class="form-group">
	                    			<label for="identifyNum" class="col-sm-4 control-label">联系电话:</label>
	                    			<div class="col-sm-7">
	                      				<input type="number" class="form-control allaccount-input" id="telphone" disabled>
	                    			</div>
	                  			</div>
	                  		</div>
                    		<div class="form-group introduce">
                    			<div class="col-sm-8">
                      				<textarea class="form-control" id="intro" rows="3" disabled></textarea>
                    			</div>
                  			</div>
            			</form>
    				</div>
	            </div>
	        </div>
	    </div>
	    <!-- // 游客查看 -->

	    <!-- 导游旅行社查看 -->
    	<div class="modal fade" id="guidedetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                   <h3 class="modal-title text-center" id="myModalLabel" >用户详情</h3>
	                </div>
               		<div class="modal-body">
            			<form class="form-horizontal" id="personalData" role="form">	
                  			<div class="form-group logo">
                    			<div class="col-sm-7">
                      				<img src="" id="tlogo" width="100" height="150">
                    			</div>
                  			</div>
                  			<div class="message">
	    						<div class="form-group">
	                    			<label for="account" class="col-sm-4 control-label">用户名:</label>
	                    			<div class="col-sm-7">
	                      				<input type="text" class="form-control  allaccount-input" id="tusername" disabled>
	                    			</div>
	                  			</div>
	                    		<div class="form-group">
	                    			<label for="relName" class="col-sm-4 control-label">邮箱:</label>
	                    			<div class="col-sm-7">
	                      				<input type="text" class="form-control allaccount-input" id="tmail" disabled>
	                    			</div>
	                  			</div>
	                  			<div class="form-group">
	                    			<label for="identifyNum" class="col-sm-4 control-label">证件号:</label>
	                    			<div class="col-sm-7">
	                      				<input type="text" class="form-control allaccount-input" id="tidnumber" disabled>
	                    			</div>
	                  			</div>
	                    		<div class="form-group">
	                    			<label for="identifyNum" class="col-sm-4 control-label">联系电话:</label>
	                    			<div class="col-sm-7">
	                      				<input type="number" class="form-control allaccount-input" id="ttelphone" disabled>
	                    			</div>
	                  			</div>
	                  		</div>
                    		<div class="form-group introduce">
                    			<div class="col-sm-8">
                      				<textarea class="form-control" id="tintro" rows="3" disabled></textarea>
                    			</div>
                  			</div>
            			</form>
    				</div>
	            </div>
	        </div>
	    </div>
	    <!-- // 导游旅行社查看 -->

		<!-- 禁用模态窗 -->
        <div class="modal fade xs" id="forbid" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title text-center" id="myModalLabel1">你确定要禁用吗?</h4>
                    </div>
                    <div class="modal-footer text-center">
	                    <form action="<%=basePath%>userController/modifyUserState" method="post">
	                    	<input type="hidden" id="forbidId" name="userId"/>
	                    	<input type="hidden" name="role" value="${role}"/>
	                    	<input type="hidden" name="state" value="0"/>
	                    	<input type="hidden" name="pageCurrent" value="${page_list.currentPage}">
	                    	<input type="hidden" name="pageSize" value="${page_list.rowsPage}">
	                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	                        <input type="submit" class="btn btn-primary"  value="确定">
	                    </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- // 禁用模态窗 -->
		
        <!-- 启用模态窗口 -->
        <div class="modal fade xs" id="start" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-center" id="myModalLabel2">你确定要启用吗?</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-footer text-center">
                    	<form action="<%=basePath%>userController/modifyUserState" method="post">
	                    	<input type="hidden" id="startId" name="userId"/>
	                    	<input type="hidden" name="role" value="${role}"/>
	                    	<input type="hidden" name="state" value="1"/>
	                    	<input type="hidden" name="pageCurrent" value="${page_list.currentPage}">
	                    	<input type="hidden" name="pageSize" value="${page_list.rowsPage}">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <input type="submit" class="btn btn-primary"  value="确定">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- // 启用模态窗口 -->
        
        <!-- 通过模态窗口 -->
        <div class="modal fade xs" id="pass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
            <div class="modal-dialog  modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-center" id="myModalLabel3">你确定要通过吗?</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-footer text-center">
                    	<form action="<%=basePath%>userController/applyGuide" method="post">
	                    	<input type="hidden" id="passId" name="userId"/>
	                    	<input type="hidden" id="passId" name="state" value="1"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <input type="submit" class="btn btn-primary" value="确定">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- // 通过模态窗口 -->
        
        <!-- 不通过模态窗口 -->
        <div class="modal fade xs" id="nopass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel4" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title text-center" id="myModalLabel4">不通过原因</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <form action="<%=basePath%>userController/applyGuide" method="post">
	                    <div class="modal-body">
	                    	<textarea rows="15" cols="78" name="content" style="resize: none"></textarea>
	                    </div>
	                    <div class="modal-footer text-center">
	                    	<input type="hidden" id="nopassId" name="userId"/>
	                    	<input type="hidden" id="nopassName" name="userName"/>
	                    	<input type="hidden" name="state" value="3"/>
	                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	                        <input type="submit" class="btn btn-primary"  value="确定">
	                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- // 不通过模态窗口 -->
        
        <!-- 插件脚本 -->
		<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
		<!-- 自定义脚本 -->
		<script src="<%=basePath%>main-js/page.js"></script>
		<script src="<%=basePath%>main-js/allAccount.js"></script>
		<script src="<%=basePath%>main-js/dataNull.js"></script>
	</body>                                                                          
</html>