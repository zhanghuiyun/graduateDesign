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
        <title>我的预约</title>
        <!-- lib样式表 -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" href="<%=basePath%>main-css/order.css">
    </head>
    <body class="reserve">
        <!-- HEADER PAGE -->
        <jsp:include page="../header.jsp"></jsp:include>
        <!-- END / HEADER PAGE -->

        <div class="container containerMinHeight">
            <div class="row">
                <div class="col-md-2">
                    <!--引入导航-->
                    <c:if test="${sessionScope.user.role eq 0}">
                        <jsp:include page="../tourist/tourist-nav.jsp"></jsp:include>
                    </c:if>
                    <c:if test="${sessionScope.user.role eq 1}">
                        <jsp:include page="../guide/guide-nav.jsp"></jsp:include>
                    </c:if>
                    <c:if test="${sessionScope.user.role eq 2}">
                        <jsp:include page="../admin/admin-nav.jsp"></jsp:include>
                    </c:if>
                </div> 
                <div class="col-md-10">
                    <!-- 我的预约 -->
                    <c:if test="${reserveRole!=1}">
                        <ul class="nav nav-pills" data-id="all_title">
                            <li data_role="items" ><a href="<%=basePath%>reserveController/findReserve?state=6">全部预约 </a>
                            </li>
                            <li data_role="items" id="item2"><a href="<%=basePath%>reserveController/findReserve?state=0">待受理</a>
                            </li>
                            <li role="presentation" data_role="items" id="item3"><a href="<%=basePath%>reserveController/findReserve?state=1">预约成功</a>
                            </li>
                            <li data_role="items" id="item4"><a href="<%=basePath%>reserveController/findReserve?state=2">被拒绝</a>
                            </li>
                            <li data_role="items" id="item5"><a href="<%=basePath%>reserveController/findReserve?state=3">已取消</a>
                            </li>        
                            <li data_role="items" id="item6"><a href="<%=basePath%>reserveController/findReserve?state=4">已评价</a>
                            </li>
                            <li data_role="items" id="item7"><a href="<%=basePath%>reserveController/findReserve?state=5">已失信</a>
                            </li>
                        </ul>
                    </c:if>

                    <!-- 预约管理 -->   
                    <c:if test="${reserveRole==1}">
                        <input type="hidden" value="${reserveRole}" id="reserveRole">
                        <ul class="nav nav-pills" role="tablist" data-id="all_title">
                            <li role="presentation" data_role="items"><a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=6">全部预约</a></li>
                            <li role="presentation" data_role="items" ><a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=0">待受理</a></li>
                            <li role="presentation" data_role="items" ><a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=1">预约成功</a></li>
                            <li role="presentation" data_role="items" ><a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=2">已拒绝</a></li>
                            <li role="presentation" data_role="items" ><a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=3">已取消</a></li>
                            <li role="presentation" data_role="items" ><a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=4">已评价</a></li>               
                            <li role="presentation" data_role="items"><a href="<%=basePath%>reserveController/findReserve?reserveRole=1&state=5">已失信</a></li>
                        </ul>
                    </c:if>
                
                    <div class="tab-content" id="orderTableContent" data-dataNull="operateWarpeer">
                        <table class="table-responsive table table-bordered table-hover table-striped text-center" id="orderTable">
                            <thead>
                                <tr>
                                    <th colspan="2">订单信息</th>
                                    <th colspan="4">游客信息</th>
                                    <th rowspan="2" style="vertical-align: middle;">订单状态</th>
                                    <th rowspan="2" style="vertical-align: middle;">操作</th>
                                </tr>
                                <tr> 
                                    <th class="reserve-info">订单编号</th>
                                    <th class="reserve-info">预定时间</th>
                                    <th class="tourist-info">联系人</th>
                                    <th class="tourist-info">联系电话</th>
                                    <th class="tourist-info">出游时间</th>
                                    <th class="tourist-info">出游人数</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="r" items="${page_list.data}">
                                    <tr data-dataNull="operate">
                                        <td data-num="reserveID">${r.reserveNumber}</td>
                                        <td>${r.reserveTime}</td>
                                        <td>${r.linkman}</td>
                                        <td>${r.telephone}</td>
                                        <td data-num="starTime">${r.starTime}</td>
                                        <td>成人${r.adultNum}小孩${r.childNum}</td>
                                        <td>${r.state==0 ? '待受理':r.state==1 ? '预约成功':r.state==2 ? '被拒绝':r.state==3 ? '已取消':r.state==4 ? '已评价':'已失信'}
                                        </td>
                                        <!-- 我的预约 -->
                                        <c:if test="${reserveRole!=1}">
                                            <c:if test="${r.state eq 0}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#delete" data-reserveId="${r.reserveId}" class="btnStyle">删除
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state eq 1}">
                                                <td>
                                                    <button type="button" data-toggle="modal" data-target="#cancel" data-reserveId=" ${r.reserveId}" class="btnStyle">取消预约</button>
                                                    <button type="button" data-toggle="modal" data-target="#evaluate" data-reserveId="${r.reserveId}" class="btnStyle">评价
                                                    </button>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#delete" data-reserveId="${r.reserveId}" class="btnStyle">删除
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state eq 2}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#delete" data-reserveId="${r.reserveId}" class="btnStyle">删除
                                                    </button>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-toggle="modal"data-target="#g_reject" data-rejectReason="${r.refuse}">拒绝理由</button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state eq 3}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#delete" data-reserveId="${r.reserveId}" class="btnStyle">删除
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state eq 4}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#delete" data-reserveId="${r.reserveId}" class="btnStyle">删除
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state eq 5}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#delete" data-reserveId="${r.reserveId}" class="btnStyle">删除
                                                    </button>
                                                </td>
                                            </c:if>
                                        </c:if>

                                        <!-- 预约管理 -->   
                                        <c:if test="${reserveRole==1}">
                                            <c:if test="${r.state==0}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#yue" data-reserveId="${r.reserveId}" class="btnStyle">预约
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#jujue" data-reserveId="${r.reserveId}" class="btnStyle" data-start="${r.starTime}" >拒绝
                                                    </button>
                                               </td>
                                           </c:if>
                                            <c:if test="${r.state eq 2}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-toggle="modal"data-target="#g_reject" data-rejectReason="${r.refuse}">拒绝理由</button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state==1}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#shixin" data-reserveId="${r.reserveId}" data-start="${r.starTime}" class="btnStyle">失信
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state==4}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                    <button type="button" data-toggle="modal" data-target="#shixin" data-reserveId="${r.reserveId}" data-start="${r.starTime}" class="btnStyle">失信
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state eq 3}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                </td>
                                            </c:if>
                                            <c:if test="${r.state eq 5}">
                                                <td>
                                                    <button type="button" class="btnStyle" data-reserveId="${r.reserveId}" data-identify="orderDetail">查看详情
                                                    </button>
                                                </td>
                                            </c:if>
                                        </c:if>
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
                                    <form action="<%=basePath%>reserveController/findReserve" id="form">
                                        <input type="hidden" name="state" value="${state}">
                                        <input type="hidden" name="pageSize" value="${page_list.rowsPage}" onchange="Page.Jumping()">
                                        <input type="hidden" name="totalPage" value="${page_list.totalPage}">
                                        <c:if test="${reserveRole==1}">
                                            <input type="hidden" name="reserveRole" value="${reserveRole}">
                                        </c:if>
                                        第
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

                        <!-- S 订单评价 -->
                        <div class="modal fade" id="evaluate">
                            <div class="modal-dialog infoCheck">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" data-identify="remove">
                                            <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                        </button>
                                        <h3 class="modal-title text-center">订单评价</h3>
                                    </div>
                                    <!--S 提交给后端的评价表单 -->
                                    <form class="form-horizontal" role="form"  method="post">
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                  <input type="hidden" name="reserveId" id="ping-reserveId" />
                                                </div>
                                            </div>
                                            <!-- S 服务评价 -->
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">服务评价：</label>
                                                <div class="col-sm-9">
                                                    <div>
                                                        <div id="service-assess" class="assess"></div>
                                                        <input type="hidden" name="service" id="service-hint" data-group="input" />
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- E 服务评价 -->
                                            <!-- S 路线评价 -->
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">路线评价：</label>
                                                <div class="col-sm-9">
                                                    <div>
                                                        <div id="route-assess" class="assess"></div>
                                                        <input type="hidden" name="route_1" id="route-hint" data-group="input" />
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- E 路线评价 -->
                                            <!-- S 景点评价 -->
                                            <div class="form-group" id="viewAssess">
                                                <label class="col-sm-3 control-label">景点评价：</label>
                                            </div>   
                                            <!-- E 景点评价 -->
                                            <!--S 我的评价 -->
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label">我的评价：</label>
                                                <div class="col-sm-9"> 
                                                    <textarea class="form-control" name="content" id="assess" rows="6" data-group="input" /></textarea>
                                                </div>
                                            </div> 
                                            <!--E 我的评价 -->
                                        </div>
                                        <div class="modal-footer">
                                            <input type="button" class="btn btn-primary" data-identify="remove" id="assessBtn" value="提交">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="关闭" data-identify="remove">
                                        </div>
                                    </form>
                                    <!--E 提交给后端的评价表单 -->     
                                    <form id="assess_form" action="<%=basePath%>reserveController/findReserve" method="get"> 
                                        <input type="hidden" name="state" value="4">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- E 订单评价 -->

                        <!-- S 删除提示框 -->
                        <div class="modal fade" id="delete">
                            <div class="modal-dialog infoCheck">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                        </button>
                                        <h3 class="modal-title text-center">删除提示</h3>
                                    </div>
                                    <div class="modal-body text-center">
                                        <p>是否确认删除？</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form action="<%=basePath%>reserveController/deleteOrder" method="post">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <input type="hidden" name="reserveId" id="reserveID-delete">
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

                        <!-- S 预约提示框 -->
                        <div class="modal fade" id="yue">
                            <div class="modal-dialog infoCheck">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                        </button>
                                        <h3 class="modal-title text-center">预约提示</h3>
                                    </div>
                                    <div class="modal-body text-center">
                                        <p>是否确认预约？</p>
                                    </div>
                                    <div class="modal-footer">
                                        <form action="<%=basePath%>reserveController/operateOrder" method="post">
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <input type="hidden" name="reserveId" id="reserveID-yue">
                                                    <input type="hidden" name="state" value="1">
                                                    <input type="hidden" name="reserveRole" value="1">
                                                    <input type="hidden" name="currentPage" value="${page_list.currentPage}">
                                                </div>
                                            </div>
                                            <input type="submit" class="btn btn-primary" value="确定">
                                            <input type="button" class="btn btn-default" data-dismiss="modal" value="取消">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- E 预约提示框 -->

                        <!-- S 取消预约提示框 -->
                        <div class="modal fade" id="cancel">
                            <div class="modal-dialog infoCheck">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">
                                        <span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
                                        </button>
                                        <h3 class="modal-title text-center">取消预约提示</h3>
                                    </div>
                                    <div class="modal-body text-center">
                                        <p>确认取消预约？</p>
                                    </div>
                                    <form action="<%=basePath%>reserveController/operateOrder" method="post">
                                    <div class="modal-footer">
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <input type="hidden" name="reserveId" id="reserveID-cancel" value="">
                                                <input type="hidden" name="state" value="3">
                                                <input type="hidden" name="currentPage" value="${page_list.currentPage}">
                                                <input type="hidden" name="starTime" id="starTime-cancel">
                                            </div>
                                        </div>
                                        <input type="submit" class="btn btn-primary" value="确认">
                                        <input type="button"  class="btn btn-default" data-dismiss="modal" value="取消">
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- E 取消预约提示框 -->

                        <!--S 失信记录 -->
                        <div class="modal fade" id="shixin" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog infoCheck" role="document">
                                <form action="<%=basePath%>reserveController/operateOrder" method="post">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title text-center" id="myModalLabel">记录游客失约？</h4>
                                        </div>
                                        <div class="modal-body text-center">
                                            <p>确认记录该游客失约？</p>
                                            <input type="hidden" name="reserveId" id="reserveID-shixin" value="">
                                            <input type="hidden" name="state"  value="5">
                                            <input type="hidden" name="reserveRole" value="1">
                                            <input type="hidden" name="starTime" id="starTime-shixin">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                            <input type="submit" class="btn btn-primary" id="record-submit-yes" value="确认">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--E 失信记录 -->

                        <!--S 拒绝 -->
                        <div class="modal fade" id="jujue" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header text-center">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel">拒绝理由填写</h4>
                                    </div>
                                    <form action="<%=basePath%>reserveController/operateOrder" method="post">
                                        <div class="modal-body">
                                            <input type="hidden" name="reserveId" value="" id="reserveID-jujue">
                                            <input type="hidden" name="state" value="2">
                                            <input type="hidden" name="starTime" value="" id="starTime-jujue">
                                            <textarea name="refuse" class="form-control" id="refuse" rows="8"></textarea>
                                            <p id="refuseInfo"></p>
                                        </div>
                                        <div class="modal-footer">
                                            <input class="btn btn-primary" type="submit"  value="提交" id="refuseInfoBtn">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        </div>
                                    </form>
                                </div>
                            </div>                    
                        </div>
                        <!--E 拒绝 -->

                        <!-- S 拒绝理由查看模态框 -->
                        <div class="modal fade" id="g_reject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title text-center" id="myModalLabel">拒绝理由查看</h4>
                                    </div>
                                    <div class="modal-body text-center">
                                        <form>
                                            <textarea id="g_reject_reason" readonly class="form-control" rows="8"></textarea>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- E 拒绝理由查看模态框 -->
                    </div>    
                </div>
            </div>
        </div>

        <!-- FOOTER PAGE -->
        <jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

        <!-- 插件脚本 -->
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath%>js/jquery.raty.min.js"></script>
        <!-- 自定义js文件 -->
        <script src="<%=basePath%>main-js/page.js"></script>
        <script src="<%=basePath%>main-js/tourist-reserve.js"></script>
        <script src="<%=basePath%>main-js/dataNull.js"></script>
        <script type="text/javascript">  
            $(function(){
                var error = "<%=request.getAttribute("error")%>";   //错误
                if(error!="null"){
                    alert(error);
                }
                //侧边栏展开
                if ($("#reserveRole").val() != 1) {
                    $('#collapse1').addClass('in'); //侧边导航栏展开
                }else{
                    $('#collapse2').addClass('in'); //侧边导航栏展开
                }

                //拒绝理由查看框
                $("[data-target='#g_reject']").on("click", function(){
                    $('#g_reject_reason').val( $(this).attr("data-rejectReason"));
                });

                //标签栏样式
                var listArr =  $('[data-id="all_title"] > li');
                var i = <%=request.getAttribute("state")%>;
                $.each(listArr,function(index){
                    if(index != 0){
                        if (index == i+1){
                            $(this).addClass('active');
                        }
                    }else if(i == 6){
                        $(this).addClass('active');
                    }
                    
                });

                //表格操作按钮样式
                var tr = $('#orderTable tbody tr');
                $.each(tr,function(){
                    $(this).find('td:last').css('color','#428BCA');
                });

            });
        </script>
    </body>
</html>
