<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>发布路线</title>
        <!-- 插件样式 -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>main-css/order.css">
    </head>

    <body class="releaseRoute">
        <!-- 页眉-->
        <jsp:include page="../header.jsp"></jsp:include>

        <!-- 内容 -->
        <div class="container containerMinHeight">
            <div class="row"> 
                <div class="col-md-2 col-md-offset-1" style="margin-top:30px;">
                    <!--S 左侧导航栏 -->
                    <jsp:include page="guide-nav.jsp"></jsp:include>
                </div>
                <!-- S 发布路线表单 -->
                <div class="col-md-6 border col-md-offset-1 route">
                    <form class="form-horizontal">
                        <!-- 路线名称 -->
                        <div class="form-group top">
                            <label for="g_routeName" class="col-lg-2 col-lg-offset-1 control-label">线路名称:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="g_routeName" name="routeName" data-group="rountInfo" placeholder="请填写线路名称格"/>
                                <p id="routeNameInfo">请填写线路名称</p>
                            </div>
                        </div>
                        <!-- 价格 -->
                        <div class="form-group">
                            <label for="g_routePrice" class="col-lg-2 col-lg-offset-1 control-label">价格:</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="g_routePrice" name="price" data-group="rountInfo" placeholder="请输入价格"/>
                                <p id="routePriceInfo">请输入价格</p>
                            </div>
                        </div>
                        <!-- 推荐理由 -->
                        <div class="form-group">
                            <label for="g_recommendReason" class="col-lg-2 col-lg-offset-1 control-label">推荐理由</label>
                            <div class="col-lg-7">
                                <textarea class="form-control" id="g_recommendReason" name="reason" data-group="rountInfo" placeholder="请输入线路推荐理由"></textarea>
                                <p id="recommendReasonInfo">请输入线路推荐理由</p>
                            </div>
                        </div>
                        <!-- 全部景点 -->
                        <div class="form-group">
                            <label for="g_Allview" class="col-lg-2 col-lg-offset-1 control-label">全部景点</label>
                            <div class="col-lg-7">
                                <input type="text" class="form-control" id="g_Allview" readonly placeholder="请选择景点"/>
                                <input type="hidden" class="form-control" id="g_viewId" name="viewId"/>
                                <p id="g_Allview_tip">请选择景点</p>
                            </div>
                            <div class="col-lg-2">
                                <!-- 选择景点按钮 -->
                                <input type="button" class="btn form-control btnStyle" value="添加" data-toggle="modal" data-target="#addView">
                            </div>
                        </div>
                        <!-- 路线安排 -->
                        <div id="routeArrange">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-lg-2 col-lg-offset-1 control-label">线路安排</label>
                                <!--行程天数-->
                                <div class="col-lg-5 routeDay">
                                    <span>第</span>
                                    <input type="text" class="routeDay_input" value="1" data-day="day" readonly >
                                    <span >天</span>
                                </div>
                                <!--添加行程按钮 -->
                                <div class="col-lg-2 col-lg-offset-2">
                                    <input type="button" class="btn form-control btnStyle" value="添加" id="g_addDay" >
                                </div>
                                <!--行程安排 -->
                                <div class="col-lg-7 col-lg-offset-3" style="margin-top:5px;">
                                    <textarea class="form-control schedule" placeholder="请输入行程安排"></textarea>
                                    <p class="schedule-tip">请输入行程安排</p>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-7 col-lg-offset-3">
                                <input type="button" class="form-control btn-primary col-lg-12" id="validateBtn" value="发布" disabled>
                            </div>
                        </div>
                    </form>
                    <form id="release_form" action="<%=basePath%>routeController/findRoutes" method="get"> 
                        <input type="hidden" name="state" value="0">
                    </form>
                </div>
                <!-- E 发布路线表单 -->
            </div>
        </div>

        <!-- 页脚 -->
        <jsp:include page="../footer.jsp"></jsp:include>

        <!-- 添加景点的模态框 -->
        <div class="modal fade" id="addView" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <!-- 模态框页头 -->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">景点选择</h4>
                    </div>
                    <!-- 模态框内容 -->
                    <div class="modal-body" id="searchViewModel"></div>
                    <!-- 模态框页脚 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="consure">确定</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 插件脚本 -->
        <script type="text/javascript" src="../../js/lib/bootstrap.min.js"></script>
        <!-- 自定义脚本 -->
        <script type="text/javascript" src="../../main-js/g_releaseRoute.js"></script>
        <script type="text/javascript" src="../../main-js/releaseRouteValid.js"></script>
    </body>
</html>