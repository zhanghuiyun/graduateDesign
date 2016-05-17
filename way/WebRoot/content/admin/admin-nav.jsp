<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">我的预约</a></h4>
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

    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">线路审核</a></h4>
        </div>
        <div id="collapse2" class="panel-collapse collapse">
            <ul  class="nav nav-tabs nav-stacked">
                <li>
                    <a href="<%=basePath%>routeController/findRoutes?state=0">待审核</a>
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
    
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse7">我的账户</a>
            </h4>
        </div>
        <div id="collapse7" class="panel-collapse collapse">
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
    
    
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">景点管理</a>
            </h4>
        </div>
        <div id="collapse3" class="panel-collapse collapse">
        	<ul  class="nav nav-tabs nav-stacked">
                <li>
                    <a href="<%=basePath%>viewController/findViews">景点信息</a>
                </li>
                <li>
                    <a href="<%=basePath%>content/admin/publish-view.jsp">发布景点</a>
                </li>
            </ul>	
        </div>
    </div>
    
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse4">账户管理</a>
            </h4>
        </div>
        <div id="collapse4" class="panel-collapse collapse">
            <ul  class="nav nav-tabs nav-stacked">
                <li>
                    <a href="<%=basePath%>userController/findAllUser?role=0">用户</a>
                </li>
                <li>
                    <a href="<%=basePath%>userController/findAllUser?role=1">导游/旅行社</a>
                </li>
                <li>
                    <a href="<%=basePath%>userController/findApplyGuide">待审批导游/旅行社</a>
                </li>
            </ul>
        </div>
    </div>
    
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#collapse5">用户反馈</a>
            </h4>
        </div>
        <div id="collapse5" class="panel-collapse collapse">
            <ul  class="nav nav-tabs nav-stacked">
                <li>
                    <a href="<%=basePath%>feedbackController/feedback?state=0">已审核</a>
                </li>
                <li>
                    <a href="<%=basePath%>feedbackController/feedback?state=1">待审核</a>
                </li>
            </ul>
        </div>
    </div>
</div>
