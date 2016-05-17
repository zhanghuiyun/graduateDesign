<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <div class="panel-group text-center" id="accordion">
        <!-- S 我的预约 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="panel-title">我的预约</a></h4>
            </div>
            <div id="collapse1" class="panel-collapse collapse">
                <ul  class="nav nav-tabs nav-stacked">
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?state=6">全部预约</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?state=0">待受理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?state=1">预约成功</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?state=2">被拒绝</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?state=3">已取消</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?state=4">已评价</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?state=5">已失信</a>
                    </li>
            	</ul>
            </div>
        </div>
        <!-- E 我的预约 -->

        <!-- S 个人中心 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">个人中心</a></h4>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
                <ul  class="nav nav-tabs nav-stacked">
                    <li>
                        <a role="menuitem" tabindex="-1" href="<%=basePath%>content/user/information.jsp" id="tourist-personaldata">个人资料</a>
                    </li>
                    <li> 
                        <a role="menuitem" tabindex="-1" href="<%=basePath%>content/user/changePassword.jsp">修改密码</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- E 个人中心 -->

        <!-- S 我的反馈 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3">我的反馈</a></h4>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
                <ul  class="nav nav-tabs nav-stacked">
                    <li>
                        <a role="menuitem" tabindex="-1" href="<%=basePath%>content/tourist/tourist-submitfeedback.jsp" id="tourist-personaldata">提交反馈</a>
                    </li>
                    <li> 
                        <a role="menuitem" tabindex="-1" href="<%=basePath%>feedbackController/feedbackByUserId?state=1">查看反馈</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- E 我的反馈 -->           
    </div>

                