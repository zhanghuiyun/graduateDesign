<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <div class="panel-group" id="accordion">
        <!-- S 我的预约 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="panel-title">我的预约</a>
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

        <!-- S 预约管理 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="panel-title">预约管理</a>
            </div>
            <div id="collapse2" class="panel-collapse collapse">
                <ul  class="nav nav-tabs nav-stacked">
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=6">全部订单</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=0">待受理</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=1">预约成功</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=2">已拒绝</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=3">已取消</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=4">已评价</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=5">已失信</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- E 预约管理 -->

        <!-- S 个人中心 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3" class="panel-title">个人中心</a>
            </div>
            <div id="collapse3" class="panel-collapse collapse">
                <ul  class="nav nav-tabs nav-stacked">
                    <li>
                        <a href="<%=basePath%>content/user/information.jsp">个人资料</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>content/user/changePassword.jsp">修改密码</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- E 个人中心 -->

        <!-- S 路线查看 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4" class="panel-title">路线查看</a>
            </div>
            <div id="collapse4" class="panel-collapse collapse">
                <ul  class="nav nav-tabs nav-stacked">
                    <li>
                        <a id="tourist-personaldata" href="<%=basePath%>routeController/findRoutes?state=0">待审核</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>routeController/findRoutes?state=1">已审核</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>routeController/findRoutes?state=2">已下线</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>routeController/findRoutes?state=3">已拒绝</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- E 路线查看 -->

        <!-- S 发布路线 -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <a href="<%=basePath%>content/guide/g_releaseRoute.jsp" class="panel-title">发布路线</a>
            </div>
        </div>
        <!-- E 发布路线 -->  
    </div>
