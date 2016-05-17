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
        <!-- 引入插件样式 -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/Awesome/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/jquery-ui.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>styles/style.css">
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" href="<%=basePath%>main-css/adminstyle.css">
    </head>
    <body>
        <!-- HEADER PAGE -->
		<jsp:include page="header.jsp"></jsp:include>
        <!-- END / HEADER PAGE -->

        <main class="views">
            <div class="container containerMinHeight" data-dataNull="operateWarpeer">
                <div class="row">
                    <img src="<%=basePath%>images/view.png" class="views-bgimg">
                    <c:forEach var="v" items="${page_list.data}">
                        <div class="item" data-dataNull="operate">
                            <div class="pic">
                                <a href="<%=basePath%>viewController/findViewDetail?viewId=${v.viewId}"><img src="" data-pic="${v.viewPicture}" width="219" height="155"></a>
                            </div>
                            <div class="price">
                                <span>￥</span>
                                <span>${v.viewGrade}</span>
                                <span>元</span>
                                <span class="myd">预约次数<em>${v.viewGrade}</em></span>
                            </div>
                            <div class="name">
                                <a href="<%=basePath%>viewController/findViewDetail?viewId=${v.viewId}">${v.viewName}游</a>
                            </div>
                        </div>
    			     </c:forEach>
                </div>
                <!-- 页码 --> 
                <table class="page viewsPage">
                    <tr>
                        <td>
                            <c:if test="${page_list.currentPage==1}">
                                <span class="disabled">首&nbsp;&nbsp;页</span>
                                <span class="disabled">上一页</span>
                            </c:if> 
                            <c:if test="${page_list.currentPage!=1}">
                                <span><a href="javascript:Page.gotoPage(1)">首&nbsp;页</a></span>
                                <span><a href="javascript:Page.gotoPage(${page_list.currentPage-1})">上一页</a></span>
                            </c:if> 
                            <c:if test="${page_list.currentPage==page_list.totalPage}">
                                <span class="disabled">下一页</span>
                                <span class="disabled">尾&nbsp;页</span> 
                            </c:if> 
                            <c:if test="${page_list.currentPage!=page_list.totalPage}">
                                <span><a href="javascript:Page.gotoPage(${page_list.currentPage+1})">下一页</a></span>
                                <span><a href="javascript:Page.gotoPage(${page_list.totalPage})">尾&nbsp;页</a></span>
                            </c:if>
                        </td>
                        <td>
                            <form action="<%=basePath%>viewController/findViewsByKey" id="form" method="post">
                                <input type="hidden" name="key" value="">
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
                <!-- //页码 -->
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
        <script src="<%=basePath%>main-js/page.js"></script>
        <script src="<%=basePath%>main-js/dataNull.js"></script>
         <script type="text/javascript">
            $(function(){
                $.each($('img[data-pic]'),function(){
                    var data = $(this).attr('data-pic');
                    var srcs = data.substring(1,data.length-1);
                    var src = srcs.split(",");
                    $(this).attr("src","<%=basePath%>headImg/"+src[0]);
                })

            });
        </script>
    </body>
</html>