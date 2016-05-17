<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>线路详情查看</title>
        <!-- 引入插件样式 -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>main-css/order.css">
    </head>
    <body class="routeDetail">
        <!-- HEADER PAGE -->
    	<jsp:include page="header.jsp"></jsp:include>
        <!-- END / HEADER PAGE -->

        <div class="container containerMinHeight">
            <div class="row">
                <div class="col-lg-7 wrapper">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner" role="listbox">
                        <!-- 幻灯片 -->
                            <div class="item active">
                                <img src="<%=basePath%>images/pic1.jpg" data-slide="data-slide"  alt="景点图片" width="100%" style="max-height:360px;">
                             </div>
                            <div class="item">
                                <img src="<%=basePath%>images/pic1.jpg" data-slide="data-slide"  alt="景点图片" width="100%" style="max-height:360px;">
                            </div>
                        </div>

                        <!-- S 上一张下一张 -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                        <!-- E 上一张下一张 -->
                    </div>

                    <div id="tab" class="top">
                        <!-- S 标签栏 -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li>
                                <a href="<%=basePath%>routeController/findRouteDetal?key=0&routeId=${route.routeId}">全部评价</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>routeController/findRouteDetal?key=1&routeId=${route.routeId}">好评</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>routeController/findRouteDetal?key=2&routeId=${route.routeId}">中评</a>
                            </li>
                            <li>
                                <a href="<%=basePath%>routeController/findRouteDetal?key=3&routeId=${route.routeId}">差评</a>
                            </li>
                        </ul>
                        <!-- E 标签栏 -->
                    </div>

                    <div class="active" id="assessContentWrapper" data-dataNull="operateWarpeer">
                        <c:forEach var="a" items="${page_list.data}">
                            <div class="col-lg-12 border-bottom" id="assessContent" data-dataNull="operate">
                                <div class="col-lg-4">
                                    <div class="img"></div>
                                    <div class="assessor">
                                        <!-- <p class="userFontStyle">用户名</p> -->
                                        <p class="userFontStyle"><span>路线评分：</span>${a.route_1}分</p>
                                        <p class="timeFontStyle">${a.assessTime}</p>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <p>${a.content}</p>
                                </div>
                            </div>
                        </c:forEach>

                        <div class="col-lg-12 top">
                            <!-- 分页 -->
                            <table class="page">
                                <tr>
                                    <td class="page-td">
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
                                        <form action="<%=basePath%>routeController/findRouteDetal" id="form">
                                            <input type="hidden" name="routeId" value="${route.routeId}">
                                            <input type="hidden" name="key" id="key" value="${key}">
                                            <input type="hidden" name="totalPage" value="${page_list.totalPage}">
                                            第
                                            <select name="pageCurrent" id="pageCurrent" onchange="Jumping()">
                                                <c:forEach begin="1" end="${page_list.totalPage}" var="i">
                                                    <c:if test="${page_list.currentPage==i}">
                                                        <option selected value="${i}">${i}</option>
                                                    </c:if>
                                                    <c:if test="${page_list.currentPage!=i}">
                                                        <option value="${i}">${i}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                            页
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                        
                    <div class="top" >
                        <!-- S 标签栏 -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active" id="routeIntroduceId">
                                <a href="#r_routeIntroduce" aria-controls="r_routeIntroduce" role="tab" data-toggle="tab">路线介绍</a>
                            </li>
                            <li role="presentation" id="viewIntroduceId">
                                <a href="#r_viewIntroduce" aria-controls="r_viewIntroduce" role="tab" data-toggle="tab">景点介绍</a>
                            </li>
                        </ul> 
                        <!-- E 标签栏 -->
                    </div>

                    <div class="tab-content col-lg-12" id="tab-content">
                        <!-- S 路线详情 -->
                        <div role="tabpanel" class="tab-pane active" id="r_routeIntroduce">
                            <!--S 景点安排 -->
                            <div class="col-lg-12 top">
                                <label>相关景点：</label>
                            </div>
                            <div class="col-lg-12 padding-top" data-mark="" data-value="">
                                <p id="allView">${route.views}</p>
                            </div>
                            <!--E 景点安排 -->
                            <!--S 天数安排 -->
                            <c:forEach var="s" items="${route.schedules}">
                                <div class="col-lg-12 padding-top">
                                     <label>第${s.scheduleTime }天</label>
                                </div>
                                <div class="col-lg-12 padding-top">
                                    <p>${s.scheduleContent }
                                    </p>
                                </div>
                            </c:forEach> 
                            <!--E 天数安排 -->
                        </div>
                        <!-- E 路线详情 -->

                        <!-- S 景点详情 -->
                        <div role="tabpanel" class="tab-pane" id="r_viewIntroduce" data-mark="view" data-value=" ">
                            <c:forEach var="v" items="${views}">
                                <div class="col-lg-12 viewWrapper">
                                    <form>
                                        <input type="hidden" name="" value="${v.viewPicture}" data-value="imgUrl" />
                                    </form>
                                    <div class="col-lg-4 imgFloat">
                                        <img src="" data-img="img" class="imgView" data-src="${v.viewPicture}" style="width:225px;height:140px;">
                                    </div>
                                    <div class="col-lg-8 infoFloat">
                                        <input type="hidden" name="viewId" value="${v.viewId}">
                                        <div class="col-lg-8 infoDetail">
                                            <p class="viewName">${v.viewName}</p>
                                            <!-- <p class="viewRemark">${v.viewRemark}</p> -->
                                            <p class="score">分数：${v.viewGrade}</p>
                                            <p class="address">地址：${v.viewAddress}</p>
                                        </div>
                                        <div class="col-lg-4 detailBtn">
                                            <a href="<%=basePath%>viewController/findViewDetail?viewId=${v.viewId}" 
                                              class="btnPosition">查看详情</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                 <div class="col-lg-4 col-lg-offset-1 routeWrapper">
                    <!-- S 线路信息描述 -->
                    <!-- 路线名称 -->
                    <div class="col-lg-12 padding-top">
                        <label class="control-label col-lg-4 text-right">线路名称：</label>
                        <div class="col-lg-8">
                            <p>${route.routeName}</p>
                        </div>
                    </div>
                    <!-- 线路推荐理由 -->
                    <div class="col-lg-12 padding-top">
                        <label for="routeDetailReason" class="col-lg-4 control-label text-right">推荐理由：</label>
                        <div class="col-lg-8" >
                            <p id="routeDetailReason">${route.reason}</p>
                        </div>
                    </div>
                    <!-- 价格 -->
                    <form action="<%=basePath%>routeController/findRouteToReserve" method="post">
                        <input type="hidden" name="routeId" value="${route.routeId}">
                        <div class="col-lg-12 padding-top">
                            <label class="col-lg-4 control-label text-right">价格：</label>
                            <div class="col-lg-8">
                                <label>￥</label>
                                <span>${route.price}</span>
                            </div>
                        </div>
                        <!-- E 线路信息描述 -->

                        <!-- S 商家信息描述 -->
                        <!-- 商家名称 -->
                        <div class="col-lg-12 padding-top">
                            <label class="col-lg-4 control-label text-right">商家名称：</label>
                            <div class="col-lg-8">
                                <p>${route.userName}</p>
                            </div>
                        </div>
                        <!-- 商家简介 -->
                        <div class="col-lg-12 padding-top">
                            <label for="introduce" class="col-lg-4 control-label text-right">商家简介：</label>
                            <div class="col-lg-8" >
                                <p id="introduce">${route.user.introduce }</p>
                            </div>
                        </div>
                        <!-- 联系人 -->
                        <div class="col-lg-12 padding-top">
                            <label for="r_linkName" class="col-lg-4 control-label text-right">联系人：</label>
                            <div class="col-lg-8">
                                <p id="r_linkName">${route.user.realName}</p>
                            </div>
                        </div>
                        <!-- 联系电话 -->
                        <div class="col-lg-12 padding-top">
                            <label for="r_linkNum" class="col-lg-4 control-label text-right">联系电话：</label>
                            <div class="col-lg-8">
                                <p id="r_linkNum">${route.user.telephone}</p>
                            </div>
                        </div>
                        <!-- 联系邮箱 -->
                        <div class="col-lg-12 padding-top">
                            <label for="r_linkAddress" class="col-lg-4 control-label text-right">联系邮箱：</label>
                            <div class="col-lg-8">
                                <p id="r_linkAddress">${route.user.mail}</p>
                            </div>
                        </div>
                        <!-- E 商家信息描述 -->
                        <div class="col-lg-12 padding-top btnBottom">
                            <input type="submit" class="btn btn-primary col-lg-4 col-lg-offset-4" value="立即预定">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- FOOTER PAGE -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->  
        
        <!-- 引入插件脚本 -->
        <script src="<%=basePath%>js/jquery-2.2.0.min.js"></script>
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <!-- 自定义脚本 -->
        <script src="<%=basePath%>main-js/page.js"></script>
        <script type="text/javascript" src="<%=basePath%>main-js/routeDetail.js"></script>
        <script src="<%=basePath%>main-js/dataNull.js"></script>
        <script type="text/javascript">
            $(function(){
                //线路评价页面的标签
                var key = $('#key').val();
                var tab = $('#tab li');
                $.each(tab,function(index){
                    if (index == parseInt(key)) {
                        $(this).addClass('active');
                    }
                });

                //景点详情图片
                var value = $('[data-value="imgUrl"]');  //得到img的url
                var img = $('[data-img="img"]');  //得到img标签的集合
              
                var valueArr=[];
                $.each(value,function(){
                    var values = $(this).val();
                    var value1 = values.substring(1,(values.length)-1);  //将字符串切割
                    valueArr.push(value1.split(","));  //将集合转化为数组
                });
                for(var i=0,j=valueArr.length;i<j;i++){
                    var a = valueArr[i];    
                    img.eq(i).attr('src','<%=basePath%>headImg/'+a[0]);   
                }

                var imgSlide = $('img[data-slide]'); //得到幻灯片标签的集合

                for(var i = 0,j = imgSlide.length; i<j; i++){
                    imgSlide.eq(i).attr("src",img.eq(i).attr("src")); 
                }
            });
        </script>
    </body>
</html>         