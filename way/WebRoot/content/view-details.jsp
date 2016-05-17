<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <title>景点详情</title>
        <!-- 引入插件样式-->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/Awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/jquery-ui.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/style.css">
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" href="<%=basePath%>main-css/adminstyle.css">
        <!-- // 自定义样式 -->
    </head>
    <body class="view-details">
        <!-- HEADER PAGE -->
        <jsp:include page="header.jsp"></jsp:include>
        <!-- END / HEADER PAGE -->

        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-8 view_details_left">
                        <h2>${view.viewName}</h2>
                        <!-- 轮播图 -->   
                        <input id="viewPicture" type="hidden" value="${view.viewPicture}">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            </ol>
                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" role="listbox">
                                <div class="item active">
                                    <img class="data-img" data-pic="data-img" src="" width="100%" style="max-height:360px;" title="景点图片">
                                 </div>

                                <div class="item">
                                    <img class="data-img" data-pic="data-img" src="" width="100%" style="max-height:360px;" title="景点图片">
                                </div>
                            </div>
                             <!-- Controls -->
                            <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                        <!--// 轮播图 -->
        
                        <!--相关线路 -->
                        <div class="tabs">
                            <ul>
                                <li>
                                    <a href="#tabs-1">相关线路</a>
                                </li>
                            </ul>
                            <div>
                                <div id="reviews" data-dataNull="operateWarpeer">
                                    <table class="table table-bordered table-hover table-striped text-center table-condensed">
                                        <thead>
                                            <tr class="adimin-title">
                                                <th>编号</th>
                                                <th>价格</th>
                                                <th>商家</th>
                                                <th>沿途地点</th>
                                                <th>分数</th>
                                                <th>操作</th>
                                               
                                            </tr>   
                                        </thead>

                                        <tbody >
                                            <% int a = 1; %>
                                            <c:forEach var="r" items="${list}">
                                                <tr data-dataNull="operate">
                                                    <td><%=a++%></td>
                                                    <td>￥${r.price}</td>
                                                    <td>${r.userName}</td>
                                                    <td>${r.views}</td>
                                                    <td>${r.grade}</td>
                                                    <td>
                                                        <a href="<%=basePath%>routeController/findRouteDetal?routeId=${r.routeId}" data-toggle="modal">查看详情</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- // 相关线路 -->

                        <!-- 旅游小贴士 -->
                        <div class="tabs">
                            <ul>
                                <li>
                                    <a href="#tabs-2">旅游小贴士</a>
                                </li>
                            </ul>

                            <div class="content2">
                                <p>1.在青山绿水间旅游要学会走路。掌握“走路经”者玩得轻松、愉快又安全;反之则劳累、紧张，甚至受伤。</p>
                                <p>2.要走不要跳三步并做二步走或蹦蹦跳跳会加重膝踝负担，容易劳累或受伤。</p>
                                <p>3.要匀不要急匀速行走最省体力，而且有利于保持良好心态;急一阵歇一阵的走路方式最累人。</p>
                                <p>4.快去慢返上午出游的路可走得稍快，傍晚返程则要慢些走，以免疲劳的关节、肌腱受伤。</p>
                                <p>5.走阶不走坡上下山时尽量走石阶，少走斜坡。这样较符合力学和生理要求，安全又省力。</p>
                                <p>6.走硬不走软在水泥、沥青、石板等硬地上行走比在草地、河滩、湿地等软地面行走更省劲和安全。</p>
                            </div>
                        </div>
                        <!-- //旅游小贴士 -->
                    </div>
 
                    <!-- 景点详细信息 -->
                    <div class="col-md-4 view_details_message">
                        <h3 class="t_txt">景点信息</h3>
                        <div class="content1">
                            <table>
                                <tbody>
                                    <tr>
                                        <h4>景点地址：<span>${view.viewAddress}</span></h4>
                                    </tr>
                                    <tr>
                                        <h4>景点分数：<span>${view.viewGrade}</span></h4>
                                    </tr>
                                    <tr>
                                        <h4>旅游项目推荐：</h4>
                                        <p>${view.viewRecommend}</p>
                                    </tr>
                                    <tr>
                                        <h4>沿途景点推荐：</h4>
                                        <p>${view.viewRemark}</p>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <img src="<%=basePath%>/images/img/erweima2.jpg">   
                    </div>
                    <!-- //景点详细信息 -->
                </div>
            </div>
        </main>

        <!-- FOOTER PAGE -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

        <!-- 插件脚本 -->
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <script src="<%=basePath%>js/jquery-ui.js"></script>
        <script src="<%=basePath%>js/scripts.js"></script>
        <!-- 自定义脚本 -->
        <script src="<%=basePath%>main-js/dataNull.js"></script>
        <script type="text/javascript">
            var i = 0;
            $.each($('img[data-pic]'),function(){
                var data = $('#viewPicture').val();
                var srcs = data.substring(1,data.length-1);
                var src = srcs.split(",");
                $(this).attr("src","<%=basePath%>headImg/"+src[i].trim());
                i++;
            })

            $('img[data-img]').each(function(){
                var data =  $(this).attr("data-src")
                var srcs = data.substring(1,data.length-1);
                var src = srcs.split(",");
                $(this).attr("src","<%=basePath%>headImg/"+src[0]);
            })
        </script>
    </body>
</html>