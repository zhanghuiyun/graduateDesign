<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>反馈</title>
        <!-- 引入插件样式 -->
        <link rel="stylesheet" href="<%=basePath%>css/lib/bootstrap.min.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" href="<%=basePath%>main-css/tourist.css">
    </head>

    <body class="touristFeedback">
        <div id="wrapper">
        	<!-- 页眉 -->
    	    <jsp:include page="../header.jsp"></jsp:include>

        	<div class="container containerMinHeight">
    			<div class="row">
                    <!-- S 侧边栏导航 -->
                    <div class="col-md-2 col-lg-offset-2 top touristFeedback-nav">
                        <jsp:include page="tourist-nav.jsp"></jsp:include>
                    </div>
                    <!-- E 侧边栏导航 -->

                    <!-- S 反馈 -->
                    <div class="col-md-5 top">
                    	<form action="<%=basePath%>feedbackController/dealFeedback" method="post" 
                    	id="feedbackSubmit" class="form-horizontal" role="form">
    						<div class="form-group">
                            	<label for="problem-detail" class="col-sm-3 control-label">问题描述:</label>
                            	<div class="col-sm-9">
                              		<textarea class="form-control" id="problem-detail" name="feedbackContent" rows="6"></textarea>
                                    <p id="errorInfo" ></p>
                            	</div>
                          	</div>
                            <!-- 提交按钮 -->
                            <div class="form-group">
                            	<div class="col-sm-9 col-sm-offset-3">
                              		<input type="submit" class="form-control btn btn-primary" id="submit" name="submit" value="提交">
                            	</div>
                        	</div>
                    	</form>
                    </div>
                    <!-- E 反馈 -->
              	</div>
            </div>
        </div>
        
        <!-- 插件脚本 -->
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(function(){
                /*设置遮罩*/
                function wrapper(){
                    var height = $(document).height();
                    $('#wrapper').css('height',height).css("backgroundColor","rgba(16,16,16,0.55)").css("zIndex","111");
                    $('#collapse3').addClass('in'); //侧边导航栏展开
                };
                wrapper();   //页面初始化遮罩
                //浏览器窗口发生变化的时候
                window.onresize = function(){
                    wrapper();
                }
                 /*验证*/

                //文本域失去焦点的时候
                $('#problem-detail').on('keyup',function(){
                    var textarea = $('#problem-detail').val().trim();
                    var length = textarea.length;
                    if(length >= 200 || length == 0){
                        $('#errorInfo').html("文本域的长度应为1-200哦！");
                        $('#submit').attr('disabled',true);
                    }else{
                        $('#submit').attr('disabled',false);
                        $('#errorInfo').html("输入格式正确");
                    }
                })
                //文本域获取焦点的时候
                $('#problem-detail').on('focus',function(){
                    $('#errorInfo').html("");
                    $('#submit').attr('disabled',true);
                });
            });
        </script>
    </body>
</html>

