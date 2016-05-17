<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        
        <!-- TITLE -->
        <title>登入</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">

        <!-- GOOGLE FONT -->
        <link href='http://fonts.useso.com/css?family=Open+Sans:700,600,400,300' rel='stylesheet' type='text/css'>
        <link href='http://fonts.useso.com/css?family=Oswald:400' rel='stylesheet' type='text/css'>
        <link href='http://fonts.useso.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'>

        <!-- CSS LIBRARY -->
        <link rel="stylesheet" type="text/css" href="<%=basePath %>css/lib/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>css/lib/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>css/lib/awe-booking-font.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>css/lib/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>css/lib/jquery-ui.css">

        <!-- MAIN STYLE -->
        <link rel="stylesheet" type="text/css" href="<%=basePath %>css/style.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>css/demo.css">
        
        <!-- CSS COLOR -->
        <link id="colorreplace" rel="stylesheet" type="text/css" href="<%=basePath %>css/colors/blue.css">
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
        <![endif]-->
    </head>

    <!--[if IE 7]> <body class="ie7 lt-ie8 lt-ie9 lt-ie10"> <![endif]-->
    <!--[if IE 8]> <body class="ie8 lt-ie9 lt-ie10"> <![endif]-->
    <!--[if IE 9]> <body class="ie9 lt-ie10"> <![endif]-->
    <!--[if (gt IE 9)|!(IE)]><!--> <body> <!--<![endif]-->



        <!-- PAGE WRAP -->
        <div id="page-wrap">

            <!-- PRELOADER -->
            <div class="preloader"></div>
            <!-- END / PRELOADER -->

            <!-- HEADER PAGE -->
    		<jsp:include page="header.jsp"></jsp:include>
            <!-- END / HEADER PAGE -->
            
             <section class="awe-parallax login-page-demo">
                <div class="awe-overlay"></div>
                <div class="container">
                    <div class="login-register-page__content">
                        <div class="content-title">
                            <span>Welcome back</span>
                            <h2>EXPLORER!${requestScope.error}</h2>
                        </div>
                        
                        <form  method="post">
                        	<input type="hidden" name="url" value="${param.url}">
                            <div class="form-item">
                                <label>用户名:</label>
                                <input type="text" name="userName" id="userName" placeholder="请输入用户名" autofocus="autofocus" required>
                            </div>
                            <div class="form-item">
                                <label>密码:</label>
                                <input type="password" name="password" id="password" placeholder="请输入密码" required>
                            </div>
                            <a href="<%=basePath%>content/forgetPassword.jsp" class="forgot-password">忘记密码？</a>
                            <div class="form-actions">
                                <div id="warning" class="alert alert-warning alert-dismissible" role="alert" style="width: 290px; display: none;">
                                    <strong id="msg"></strong>！
                                </div>
                                <input type="button" id="login" value="登录">
                            </div>
                        </form>
                        <div class="login-register-link">
                            你是会员吗? <a href="<%=basePath%>content/register.jsp">请点击我注册哦</a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- FOOTER PAGE -->
    		<jsp:include page="footer.jsp"></jsp:include>
            <!-- END / FOOTER PAGE -->
        </div>
        <!-- END / PAGE WRAP -->

        <!-- LOAD JQUERY -->
        <script type="text/javascript" src="<%=basePath %>js/lib/masonry.pkgd.min.js"></script>
        <script type="text/javascript" src="<%=basePath %>js/lib/jquery.parallax-1.1.3.js"></script>
        <script type="text/javascript" src="<%=basePath %>js/lib/jquery.owl.carousel.js"></script>
        <script type="text/javascript" src="<%=basePath %>js/lib/theia-sticky-sidebar.js"></script>
        <script type='text/javascript' src="<%=basePath %>js/lib/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=basePath %>js/scripts.js"></script>
        <script type="text/javascript">
            $("#login").on("click",function() {
                var userName = $("#userName").val();
                var password = $("#password").val();
                
                $.ajax({
                type : "POST",
                url : "<%=basePath%>userController/login",
                data : {userName:userName,password:password},
                dataType : "json",
                success : function(data){
                    if(data.result=="success"){
                    	window.location.href = "<%=basePath%>routeController/index";
                    }else{
                    	$("#warning").css("display","block");
                        $("#msg").text(data.msg);
                    }
                }
            });
            })

            $("#userName").on("focus",function(){
                $("#warning").css("display","none");
            });
        </script>
    </body>
</html>
