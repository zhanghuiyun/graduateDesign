<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    	<title>注册</title>
        <!-- 引入插件样式 -->
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrapValidator.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>main-css/accountInfomation.css">
    </head>
    <body class="resign">
        <!-- 页眉 -->
    	<jsp:include page="header.jsp"></jsp:include>

    	<div class="container containerMinHeight">
            <form class="form-horizontal" id="resignForm" method="post" action="<%=basePath%>register" id="resignForm" enctype="multipart/form-data">
                <div class="row">   
                    <div class="col-lg-6 col-lg-offset-3 border">
                        <!-- S 用户类型 -->
                        <div class="form-group" id="userType">
                           <label for="role" class="col-lg-3 control-label role">用户类型：</label>
                            <label class="col-lg-2 control-label">
                                <input type="radio" name="role" id="optionsRadios1" value="0" checked>游客
                            </label>
                            <label class="col-lg-2 control-label">
                                <input type="radio" name="role" id="optionsRadios2" value="1">导游
                            </label>
                            <label class="col-lg-2 control-label">
                                <input type="radio" name="role" id="optionsRadios3" value="2">
                                旅行社
                            </label>
                        </div>
                        <!-- E 用户类型 -->

                        <!-- S 账号 -->
                        <div class="form-group">
                            <label for="account" class="col-lg-3 control-label">账号：</label>
                            <div class="col-lg-8">
                            <input type="text" class="form-control" id="account" placeholder="6-30个字符,字母数字以及下划线"  name="userName" autocomplete="off">${error_userName}
                            <span id="message"></span>
                            </div>
                        </div>
                        <!-- E 账号 -->

                        <!-- S 密码 -->
                        <div class="form-group">
                            <label for="password" class="col-lg-3 control-label">密码：</label>
                            <div class="col-lg-8">
                            <input type="password" class="form-control" id="password" placeholder="6-30个字符,字母数字" name="password" autocomplete="off">
                            </div>
                        </div>
                        <!-- E 密码 -->

                        <!-- S  确认密码-->
                        <div class="form-group">
                            <label for="rePassword" class="col-lg-3 control-label">确认密码：</label>
                            <div class="col-lg-8">
                            <input type="password" class="form-control" id="rePassword" placeholder="请输入确认密码" name="rePassword" autocomplete="off">
                            </div>
                        </div>
                        <!-- E  确认密码-->

                        <!-- S  联系电话-->
                        <div class="form-group">
                            <label for="link-phone" class="col-lg-3 control-label">联系电话：</label>
                            <div class="col-lg-8">
                            <input type="text" class="form-control" id="link-phone" placeholder="11位" name="telephone" autocomplete="off">
                            </div>
                        </div>
                        <!-- E  联系电话-->

                        <!-- S  邮箱-->
                        <div class="form-group">
                            <label for="email" class="col-lg-3 control-label">邮箱：</label>
                            <div class="col-lg-8">
                            <input type="text" class="form-control" id="email" placeholder="请输入邮箱" name="mail" autocomplete="off">
                            </div>
                        </div>
                        <!-- E  邮箱-->

                        <!-- S  真实姓名-->
                        <div class="form-group" data-indetify="a">
                            <label for="rel-nmae" class="col-lg-3 control-label">真实姓名：</label>
                            <div class="col-lg-8">
                            <input type="text" class="form-control" id="rel-nmae" placeholder="请输入真实姓名" name="realName" autocomplete="off">
                            </div>
                        </div>
                        <!-- E 真实姓名 -->

                        <!-- S  证件号码-->
                        <div class="form-group" data-indetify="a">
                            <label for="identify-num" class="col-lg-3 control-label">证件号码：</label>
                            <div class="col-lg-8">
                            <input type="text" class="form-control" id="identify-num" placeholder="" name="idNumber" autocomplete="off">
                            </div>
                        </div>
                        <!-- E  证件号码-->

                        <!-- S  证件图片-->
                        <div class="form-group" data-indetify="a">
                            <label for="identify-pic" class="col-lg-3 control-label">证件图片：</label>
                            <div class="col-lg-8">
                                <input id="identify-pic" type="file" onchange="previewImage(this, 'prv-pic')" multiple="multiple" name="imgefile">
                                <div id="prv-pic"><span>添加图片<span></div>
                            </div>
                        </div>
                        <!-- E  证件图片-->

                        <!-- S 验证码 -->
                        <div class="form-group">
                        	<label class="col-lg-3 control-label">验证码：</label>
                        	<div class="col-lg-3">
                        		<input type="text" name="code" value="" class="form-control">
                            </div>
    		        		<img id="checkImg" class="captchaImage" src="<%=basePath%>checkImg" onclick="change()" title="点击更换验证码">
                            <span style="display:inline-block;padding-left:5px;"><a href="##" onclick="change()">看不清？</a></p>
                            <span>${checkcode_error}</span>
                        </div>
                        <!-- E 验证码 -->

                        <div class="form-group">
                            <div class="col-lg-8 col-lg-offset-3" >
                                <input type="submit" class="form-control btn-primary" id="validateBtn">
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        
        <!-- FOOTER PAGE -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

        <!-- 引入插件脚本 -->
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/lib/bootstrapValidator/bootstrapValidator.js"></script>
        <!-- 自定义脚本 -->
        <script type="text/javascript" src="<%=basePath%>main-js/resign.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#resignForm').bootstrapValidator({
                    message: 'This value is not valid',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        userName: {
                            trigger : 'keyup',
                            validators: {
                                notEmpty: {
                                   message: '账号不能为空' ,
                                },
                                stringLength: {
                                    min: 6,
                                    max: 30,
                                    message: '账号长度为6-30个字符之间'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z0-9_\.]+$/,
                                    message: '账号只能包含字母以及数字'
                                },
                                remote: {
        	                        url: '<%=basePath%>userController/checkUsername',
        	                        type: 'post',
        	                        dataType: 'json',
        	                        data: {
        	                            type: 'userName'
        	                       	 },
                           			message: '账号已存在',
            					},
            				},
                        },
                        password: {
                            trigger : 'keyup',
                            validators: {
        	                    notEmpty: {
        	                        message: '密码不能为空'
        	                    },
        	                    stringLength: {
                                    min: 6,
                                    max: 30,
                                    message: '密码长度为6-30个字符之间'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z0-9\.]+$/,
                                    message: '密码只能包含字母以及数字'
                                },
                                identical: {
                                    field: 'rePassword',
                                    message: '密码不一致'
                                }
                            }
                        },
                        rePassword: {
                            trigger : 'keyup',
                            validators: {
                                notEmpty: {
                                    message: '请输入密码'
                                },
                                identical: {
                                    field: 'password',
                                    message: '密码不一致'
                                }
                            }
                        },
                        telephone: {
                            trigger : 'keyup',
                        	validators:{
                        		notEmpty: {
                                    message: '请输入联系方式'
                                },
                                regexp: {
                                    regexp: /^0?1[3|4|5|8][0-9]\d{8}$/,
                                    message: '请输入正确的电话号码格式'
                                }
                        	}
                        },
                        mail: {
                            trigger : 'keyup',
                        	validators:{
                        		notEmpty: {
                                    message: '请输入邮箱'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z0-9]+[a-zA-Z0-9_.-]+[a-zA-Z0-9_-]+@[a-zA-Z0-9]+.+[a-z]{2,4}$/,
                                    message: '请输入正确的邮箱格式'
                                }
                        	}
                        },
                        realName:{
                            trigger : 'keyup',
                        	validators:{
                        		notEmpty: {
                                    message: '请输入真实姓名'
                                },
                                regexp: {
                                    regexp: /^[\u4e00-\u9fa5]{2,}$/,
                                    message: '请输入正确的姓名'
                                }
                        	}
                        },
                        code : {
                            trigger : 'keyup',
                        	validators:{
                                notEmpty: {
                                    message: '请输入验证码'
                                },
                                remote: {
        	                        url: '<%=basePath%>checkCode',
        	                        type: 'post',
        	                        dataType: 'json',
        	                        data: {
        	                            type: 'code',
        	                       	 },
                           			message: '验证码不正确',
        						},
                                
                        	},
        		        },
                        idNumber:{
                            trigger : 'keyup',
                            validators:{
                                notEmpty:{
                                    message: '请输入证件号码'
                                },
                                regexp: {
                                    regexp: /^D\d{10}$/,
                                    message: '请输入正确格式的导游证件号'
                                }
                            }
                        },
                        imgefile:{
                            trigger : 'keyup',
                            validators:{
                                notEmpty:{
                                    message: '请选择图片'
                                },
                                file: {
                                    
                                    type: 'image/jpeg,image/png',
                                   
                                    message: 'The selected file is not valid'
                                }
                            }
                        }
                    }
                });
            }); 
            //更改验证码
            function change(){
        		var img1 = document.getElementById("checkImg");
        		img1.src="<%=basePath%>checkImg?_=" + (new Date()).getTime();
        	}
        	
        	//验证用户名是否存在
        	var xmlhttp;//定义Ajax的核心对象
        	function createXMLhttp() {
        		//	if(window.XmlHttpRequest){//如果是火狐的浏览器机制
        		xmlhttp = new XMLHttpRequest();
        		//	}else{//IE机制浏览器
        		//	xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
        		//	}
        	}
        	function checkUsername(username) {
        		createXMLhttp();//调用创建核心对象的方法
        		//设置提交到Servlet路径
        		xmlhttp.open("post", "../userController/checkUsername?userName=" + username);
        		//设置回调函数
        		xmlhttp.onreadystatechange = checkBack;//ajax核心对象状态发生改变的时候调用
        		//提交
        		xmlhttp.send(null);
        	}
        </script>
    </body>
</html>
