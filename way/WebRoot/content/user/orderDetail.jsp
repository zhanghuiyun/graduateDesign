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
	    <title>订单详情</title>
	    <!-- lib样式表 -->
	    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
	    <!-- 自定义样式 -->
	    <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
	    <link rel="stylesheet" href="<%=basePath%>main-css/order.css">
    </head>
    <body class="orderDetail">
    	<!-- HEADER PAGE -->
		<jsp:include page="../header.jsp"></jsp:include>
	    <!-- END / HEADER PAGE -->

	    <div class="container containerMinHeight">
	    	<div class="row">
	    	    <div class="col-lg-8 col-lg-offset-2 border" >
	    	    	<!-- 路线名称 -->
	    	    	<div class="col-lg-7 separet">
		    	        <div class="col-lg-12 margin-top">
		    	        	<label class="col-lg-4">路线名称：</label>
		    	    		<span class="col-lg-8" id="route-name"></span>
		    	        </div>
		    	        <!-- 商家名称 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">商家名称：</label>
		    	    		<span class="col-lg-8" id="business-name"></span>
		    	        </div>
		    	        <!-- 路线单价 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">路线单价：</label>
		    	    		<span class="col-lg-8" id="price"></span>
		    	        </div>
		    	        <!-- 出游人数 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">出游人数：</label>
		    	    		<div class="col-lg-8">
		    	    			<p class="changeLine">成人数：<span id="adultNum"></span></p>
		    	    			<p class="changeLine">儿童数：<span id="childNum"></span></p>
		    	    		</div>
		    	        </div>
		    	        <!-- 路线总价 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">路线总价：</label>
		    	    		<span class="col-lg-8" id="total"></span>
		    	        </div>
		    	        <!-- 出游时间 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">出游时间：</label>
		    	    		<span class="col-lg-8" id="travel-time"></span>
		    	        </div>
		    	        <!-- 预约时间 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">预约时间：</label>
		    	    		<span class="col-lg-8" id="reserve-time"></span>
		    	        </div>
		    	        <!-- 预约状态 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">预约状态：</label>
		    	    		<span class="col-lg-8" id="reserve-state"></span>
		    	        </div>
		    	        <!-- 拒绝理由 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">拒绝理由：</label>
		    	    		<span class="col-lg-8" id="refuse-reason"></span>
		    	        </div>
		    	        <!-- 联系人 -->
		    	        <div class="col-lg-12">
		    	        	<label class="col-lg-4">联系人：</label>
		    	    		<span class="col-lg-8" id="man"></span>
		    	        </div>
		    	        <!-- 联系电话 -->
		    	        <div class="col-lg-12 margin-bottom">
		    	        	<label class="col-lg-4">联系电话：</label>
		    	    		<span class="col-lg-8" id="tel"></span>
		    	        </div>
	    	        </div>
	    	        <!-- 出游人信息 -->
	    	        <div class="col-lg-5" id="infoWrapper"></div>
	    	    </div>
	    	</div>
	    </div>
	    
	    <!-- FOOTER PAGE -->
        <jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

        <!-- 插件脚本 -->
		<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			/*取地址栏参数*/
		    (function($) {
		        $.getUrlParam = function(name) {
					var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
					var r = window.location.search.substr(1).match(reg);
					if (r != null)
						return unescape(r[2]);
					return null;
				};
				
				$.ajax({  //对订单详情页进行复制操作
					type : "POST",
					url : "<%=basePath%>reserveController/findReserveById",
					data: {reserveId : $.getUrlParam('reserveId')},
					dataType: "json",
					success: function(data, textStatus){
						$("#reserve-time").html(data.reserveTime);
						$("#route-name").html(data.routeName);
						$("#business-name").html(data.guideName);
						$("#travel-time").html(data.starTime);
						$("#adultNum").html( data.adultNum );
						$("#childNum").html( data.childNum );
						$("#price").html(data.price);
						$("#total").html(data.total);
						$("#man").html(data.linkman);
						$("#tel").html(data.telephone);
						$("#refuse-reason").html(data.refuse);
						switch(data.state){
							case "0":
								$("#reserve-state").html("待受理");
								break;
							case "1":
								$("#reserve-state").html("预约成功");
								break;
							case "2":
								$("#reserve-state").html("被拒绝");
								break;
							case "3":
								$("#reserve-state").html("已取消");
								break;
							case "4":
								$("#reserve-state").html("已评价");
								break;
							case "5":
								$("#reserve-state").html("已失信");
								break;
						}
					}
				});
				
				//出游人信息详情
				$.ajax({  
					type : "POST",
					url : "<%=basePath%>reserveController/findTouristByReserveId",
					data: {reserveId : $.getUrlParam('reserveId')},
					dataType: "json",
					success: function(data, textStatus){
						for(var i=0,j=data.length;i<j;i++){
							var wrapper = $('#infoWrapper');
							var name = $('<div class="col-lg-12 margin-top"></div>');
							var nameLabel = $('<label class="col-lg-5">姓名：</label>').appendTo(name);
							var nameSpan = $('<span class="col-lg-7" id=""></span>').appendTo(name);
							name.appendTo(wrapper);

							var tele = $('<div class="col-lg-12"></div>');
							var teleLabel = $('<label class="col-lg-5">联系方式：</label>').appendTo(tele);
							var teleSpan = $('<span class="col-lg-7" id=""></span>').appendTo(tele);
							tele.appendTo(wrapper);

							var id = $('<div class="col-lg-12"></div>');
							var idLabel = $('<label class="col-lg-5">身份证号：</label>').appendTo(id);
							var idSpan = $('<span class="col-lg-7" id=""></span>').appendTo(id);
							id.appendTo(wrapper);

							var line = $('<div class="col-lg-12 text-center"></div>');
							var lineSpan = $('<span>----------------------------------------</span>').appendTo(line);
							line.appendTo(wrapper);

							nameSpan.text(data[i].touristName);
							teleSpan.text(data[i].touristTele);
							idSpan.text(data[i].touristIdNum);
						}
					}
				});
			})(jQuery);
		</script>
    </body>
</html>