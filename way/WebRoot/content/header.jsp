<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>      
<script src="<%=basePath%>js/jquery-2.2.0.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('#search').on('mouseover',function () {
            $(".form-search").css({
                'top': '100%',
                'opacity': '1',
                'visibility': 'visible',
                'z-index': '99',
                'transition': 'all 0.3s ease'
            });
        })

        $(".form-search").on('mouseout',function() {
            $(this).css({
                'opacity': '0',
                'visibility': 'hidden'
            });
        })

    });
</script>

<header id="header-page" >
    <div class="header-page__inner" >
        <div class="container" style="margin-top:0px;">
            <!-- S logo -->
            <div class="logo">
                <a href="index.html"><img src="<%=basePath%>images/logo (2).png" alt="logo"></a>
                <c:if test="${sessionScope.user!=null}">
                    <span class="username">欢迎：${sessionScope.user.userName}</span>
                </c:if>
            </div>
            <!-- E logo -->
 
            <!-- S 导航 -->
            <nav class="navigation awe-navigation">
                <ul class="menu-list">
                    <li class="menu-item-has-children">
                        <a href="<%=basePath%>routeController/index">首页</a>
                    </li>
                    <li class="menu-item-has-children">
                        <a href="<%=basePath%>viewController/findAllViews">景点</a>
                    </li>
                    <li class="menu-item-has-children">
                        <a href="<%=basePath%>content/user/information.jsp">个人中心</a>
                    </li>
                    <c:if test="${sessionScope.user==null}">
                        <li class="menu-item-has-children">
                            <a href="<%=basePath%>content/login.jsp">登录/注册</a>
                            <ul class="sub-menu">
                                <li><a href="<%=basePath%>content/login.jsp">登录</a></li>
                                <li><a href="<%=basePath%>content/register.jsp">注册</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user!=null}">
                        <li class="menu-item-has-children">
                            <a href="<%=basePath%>userController/logout">注销</a>
                        </li>
                    </c:if>
                    <li class="menu-item-has-children">
                        <a href="#">联系我们</a>
                    </li>
                </ul>
            </nav> 
            <!-- E 导航 -->

            <!-- S 搜索框 -->
            <div class="search-box">
                <span class="searchtoggle" id="searchtoggle"><i class="glyphicon glyphicon-search" id="search"></i></span>
                <form class="form-search" action="<%=basePath%>viewController/findViewsByKey" method="post" >
                    <div class="form-item">
                        <input type="text" name="key" placeholder="按enter键进行搜索">
                    </div>
                </form>
            </div>
            <!-- E 搜索框 -->
        </div>
    </div>
</header>