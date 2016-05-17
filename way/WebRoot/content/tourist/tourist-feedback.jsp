<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
    <head>
    	<meta charset="utf-8">
    	<title>反馈信息查看</title>
        <!-- 引入插件样式 -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>main-css/tourist.css">
    </head>

    <body class="touristFeedbackSearch">
    	<!-- 页眉 -->
		<jsp:include page="../header.jsp"></jsp:include>

        <!-- 内容 -->
    	<div class="container containerMinHeight" style="margin-bottom: 20px;">
			<div class="row">
			 	<!-- 侧边栏 -->
                <div class="col-md-2 col-md-offset-1 top_herder">
                	<jsp:include page="tourist-nav.jsp"></jsp:include>
                </div>
                <!-- 标签 -->
                <div class="col-md-8 top_herder">
            		<ul class="nav nav-pills" role="tablist">
            			<li role="presentation" id ="message" >
                            <a href="<%=basePath%>feedbackController/feedbackByUserId?state=1" >已回复</a>
                        </li>
                        <li role="presentation" id="noMessage">
                            <a href="<%=basePath%>feedbackController/feedbackByUserId?state=0">未回复</a>
                        </li>
            		</ul>
            		<!-- 反馈表格 -->
                	<table class="table table-bordered" id="feedBack">
                        <thead>
                        <tr> 
                            <th class="col-md-3">问题</th>
                            <c:if test="${page_list.data[0].answerContent!=null}">
                            	<th class="col-md-3" id="aa">回复</th>
                            </c:if>
                            <th class="col-md-2">提问时间</th>
                            <c:if test="${page_list.data[0].answerContent!=null}">
                            	<th class="col-md-2">回复时间</th>
                            </c:if>
                            <th class="col-md-2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="f" items="${page_list.data}">
                        	<tr>
                            	<td class="col-md-3">${f.feedbackContent}</td>
                       			<c:if test="${f.answerContent!=null}">
                           	 		<td class="col-md-3">${f.answerContent}</td>
                        	  	</c:if> 
                            	<td class="col-md-2">${f.feedbackTime}</td>
                            	<c:if test="${f.answerContent!=null}">
                            		<td class="col-md-2">${f.answerTime}</td>
                            	</c:if>
                            	<td class="col-md-2">
                            		<a href="" id="replied-delete" data-toggle="modal" data-target="#delete" data-feedbackId="${f.feedbackId}">删除</a>
                            	</td>
                        	</tr>
                        </c:forEach>
                        </tbody>
                	</table>
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
						            <span class="disabled">下一页</span>
                                    <span class="disabled">尾&nbsp;&nbsp;&nbsp;页</span> 
						       	</c:if> 
						        <c:if test="${page_list.currentPage!=page_list.totalPage}">
									<span><a href="javascript:Page.gotoPage(${page_list.currentPage+1})">下一页</a></span>
                                    <span><a href="javascript:Page.gotoPage(${page_list.totalPage})">尾&nbsp;&nbsp;&nbsp;页</a></span>
								</c:if>
							</td>
							<td>
								<form action="<%=basePath%>feedbackController/feedbackByUserId" id="form">
								    第
                                    <input type="hidden" name="state" value="${state }">
                                    <input type="hidden" name="totalPage" value="${page_list.totalPage}">
								    <select name="pageCurrent" id="pageCurrent" onchange="Page.Jumping()">
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
                </div>
          	</div>
        </div>

        <!-- 页脚 -->
        <jsp:include page="../footer.jsp"></jsp:include>

        <!-- S 删除提示框 -->
        <div class="modal fade" id="delete">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                        </button>
                        <h3 class="modal-title">删除提示</h3>
                    </div>
                    <div class="modal-body text-center">
                        <p>是否确认删除？</p>
                    </div>
                    <div class="modal-footer">
                        <form action="<%=basePath%>feedbackController/deleteFeedback" method="post">
                      	    <div class="form-group">
                                <div class="col-sm-12">
                                    <input type="hidden" name="feedbackId" id="feedbackId-delete">
                                    <input type="hidden" name="state" value="${state}">
                                    <input type="hidden" name="currentPage" value="${page_list.currentPage}">
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary" value="确认">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- E 删除提示框 --> 
        
        <!-- 插件脚本 -->
		<script src="<%=basePath%>js/bootstrap.min.js"></script>
        <!-- 自定义脚本 -->
        <script src="<%=basePath%>main-js/page.js"></script>
		<script type="text/javascript">
		 	$(document).ready(function(){
				var a = <%=request.getAttribute("state")%>
			    if(a=="0"){
			        $('#noMessage').addClass("active");
			    }else{
			    	$('#message').addClass("active");
			    }

			    $('#collapse3').addClass('in');

                $("[data-target='#delete']").on("click", function(){
                   $('#feedbackId-delete').val( $(this).attr("data-feedbackId"));
                });
			}); 
		</script>
    </body>
</html>
