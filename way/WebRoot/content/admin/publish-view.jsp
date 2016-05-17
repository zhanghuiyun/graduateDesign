<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="utf-8" />
		<title>在路上</title>
		<!-- bootstrap css -->
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>bootstrap/Awesome/css/font-awesome.min.css">
		<!-- //bootstrap css -->
		<!-- 自定义样式 -->
		<link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
		<link rel="stylesheet" href="<%=basePath%>main-css/adminstyle.css">
	</head>
	<body class="publish-view">
	    <!-- HEADER PAGE -->
		<jsp:include page="../header.jsp"></jsp:include>
 		<!-- END / HEADER PAGE -->
  
		<main>
			<div class="container containerMinHeight">
				<div class="row">
					<div class="col-lg-2">
						<jsp:include page="admin-nav.jsp"/>
					</div>
					<div class="col-lg-8 col-lg-offset-1 wrapper">
						<form action="<%=basePath%>viewController/morefileuplaod" class="form-horizontal" method="post" enctype="multipart/form-data" id="publish-form">
						    <input type="hidden" value="${reserveRole}" id="reserveRole">
							<div class="form-group">
								<label for="inputEmail3" class="col-lg-2 col-lg-offset-2 control-label">景点名称</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="inputEmail3" name="viewName">
									<p class="tip publish-view-tip"></p>
								</div>	
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-lg-2 col-lg-offset-2 control-label">景点地址</label>
								<div class="col-lg-6">
									<input type="text" class="form-control" id="inputEmail3" name="viewAddress">
									<p class="tip publish-view-tip"></p>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-lg-2 col-lg-offset-2 control-label">景点描述</label>
								<div class="col-lg-6">
									<textarea class="form-control" id="exampleInputEmail1" name="viewRemark"></textarea>
									<p class="tip publish-view-tip"></p>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-lg-2 col-lg-offset-2 control-label">旅游项目推荐</label>
								<div class="col-lg-6">
									<textarea class="form-control" id="exampleInputEmail1" name="viewRecommend"></textarea>
									<p class="tip publish-view-tip"></p>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-lg-2 col-lg-offset-2 control-label">发布图片</label>
								<div class="col-lg-6">
									<div id="prv-pic"><img class="photo-btn" id="photo-btn" src="<%=basePath%>images/img/upload.png" width = "123"></div>
									<!-- <input name="file" type="file" multiple /> -->
									<input class="file-btn" id="identify-pic" type="file" onchange="previewImage(this, 'prv-pic')" multiple="multiple" name="file">
								</div>
							</div>
							<div class="col-lg-2 col-lg-offset-7">
								<input type="button" class="form-control btn-primary validatebtn" id="validateBtn" disabled="disabled" value="提交">
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>

		<!-- FOOTER PAGE -->
 		<jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

        <!-- 插件脚本 -->
		<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>	
		<!-- 自定义脚本 -->
		<script src="<%=basePath%>main-js/publish-view.js"></script>
		<script type="text/javascript">
			//上传图片
			function previewImage(file, prvid) {
					var tip = "上传的图片格式是 jpg 或 png 或 gif!"; // 设定提示信息
					var filters = {
					    "jpeg"  : "/9j/4",
					    "gif"   : "R0lGOD",
					    "png"   : "iVBORw"
					}
			    	var prvbox = document.getElementById(prvid);
			    	prvbox.innerHTML = "";
			    	if (window.FileReader) { // html5方案
			                for (var i=0, f; f = file.files[i]; i++) {
			           			var fr = new FileReader();
			            		fr.onload = function(e) {
			                		var src = e.target.result;
			                		if (!validateImg(src)) {
			                    	alert(tip)
			                		} else {
			                    		showPrvImg(src);
			                		}
			           				}
			            	fr.readAsDataURL(f);
			        		}
			    	} else { // 降级处理
			       			if ( !/\.jpg$|\.png$|\.gif$/i.test(file.value) ) {
			            		alert(tip);
			        		} else {
			            		showPrvImg(file.value);
			        		}
			    }
			    function validateImg(data) {
				    var pos = data.indexOf(",") + 1;
				    for (var e in filters) {
				        if (data.indexOf(filters[e]) === pos) {
				            return e;
				        }
				    }
			        	return null;
			    }
				function showPrvImg(src) {
				    var img = document.createElement("img"); 
				    img.src = src;  
				    img.className = ('upload-img');      
				    prvbox.appendChild(img);
				}
			}
		</script>
	</body>                                                                           
</html>