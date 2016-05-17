<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="utf-8">
	    <!-- TITLE -->
	    <title>欢迎来到“在路上”</title>
	</head>
    <body> 
    	<form action="">
    		<input id="gowhere" type="text" value="${gowhere}">
    	</form>
	    <script type="text/javascript">
	    	var gowhere = document.getElementById("gowhere").value;
	    	if(gowhere == 'reserve'){
				window.location.href = "<%=basePath%>reserveController/findReserve?state=0";
	    	}else if(gowhere == 'view'){
	    		window.location.href = "<%=basePath%>viewController/findViews";
	    	}else if(gowhere == 'feedback'){
	    		window.location.href = "<%=basePath%>feedbackController/feedbackByUserId";
	    	}
	    	else{
	    		window.onload = function(){
		    		window.location.href = "<%=basePath%>routeController/index";
		    	}
	    	}
	    </script>
    </body>
</html>