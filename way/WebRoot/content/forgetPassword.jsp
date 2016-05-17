<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    	<title>忘记密码</title>
        <!-- 引入插件样式 -->
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrapValidator.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>main-css/password.css">
    </head>
    <body>
        <!-- 引入页眉 -->
        <jsp:include page="header.jsp"></jsp:include>

        <div class="container">
        	<div class="row">
        		<div class="col-lg-12 text-center email-font">
        			<p>"在路上"旅游网，请输入对应信息找回密码</p>
        		</div>
        	</div>
        </div>
        <div class="container containerMinHeight">
    	    <form action="" method="post" id="emailForm">
    	        <div class="row">
    	            <div class="col-lg-4 col-lg-offset-4 border top" style="margin-bottom:80px;">
        			    <div class="form-group col-lg-12 top">
        			        <label for="username" class="col-lg-4 control-label">用户名：</label>
        			    	<div class="col-lg-8">
        			      	    <input type="text" class="form-control" id="username" name="userName" autofocus />
        			    	</div>
        			  	</div>
                        <div class="form-group col-lg-12">
                            <label for="mail" class="col-lg-4 control-label">邮箱：</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" id="mail" name="mail">
                            </div>
                        </div>
                        <div class="form-group col-lg-12">
                            <div class="col-lg-8 col-lg-offset-4" >
                                <input type="button" class="form-control btn-primary col-lg-12" id="validateBtn" value="提交">
                            </div>
                        </div>
                        <input type="button" class="btn" data-toggle="modal" data-target="#changePassInfo" id="modelBtn" />
    		        </div> 
    	        </div>
    	    </form>
        </div>

        <!-- S 修改提示框 -->
        <div class="modal fade" id="changePassInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title text-center" id="myModalLabel">提示框</h4>
                    </div>
                    <div class="modal-body text-center" id="modal-body"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- E 修改提示框 -->

		<!-- FOOTER PAGE -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE --> 
        
        <!-- 引入插件脚本 -->
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/lib/bootstrapValidator/bootstrapValidator.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $('#modelBtn').hide();
                hasFocus();
                function hasFocus(){   //页面初始化的时候，对是否可以提交进行操作
                    if(document.hasFocus()){ 
                        $('#validateBtn').attr('disabled',true);
                    }
                }
                //表单验证
                $('#emailForm').bootstrapValidator({
                    submitButtons: '#validateBtn',
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
                                    message: '用户名不能为空'
                                },
                                stringLength: {
                                    min: 6,
                                    max: 30,
                                    message: '用户名长度为6-30个字符之间'
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z0-9_\.]+$/,
                                    message: '用户名只能包含字母数字以及下划线'
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
                        }
                    }
                });
                //提交表单
                $('#validateBtn').on('click',function(){
                    var username = $('#username').val();
                    var mail = $('#mail').val();
                    $.ajax({
                        type : "POST",
                        url : "<%=basePath%>userController/getPasswordByMail",
                        data: {
                            userName : username,
                            mail : mail
                        },
                        dataType: "json",
                        success : function(data){
                            if (data.status == "error") {
                                $('#modelBtn').click();
                                $('#modal-body').html("用户名与邮箱不匹配");
                            }else{
                                $('#modelBtn').click();
                                $('#modal-body').html("修改密码的密码已经发送到你的邮箱");
                            }
                        }
                    });
                });
                //模态框关闭事件，表单清空
                $('#changePassInfo').on('hidden.bs.modal', function (e) {
                    $('#emailForm input[type=text]').val(''); 
                    $('#emailForm').data('bootstrapValidator').resetForm();
                    $('#username').focus();
                    hasFocus();
                })
            });
        </script>
    </body>
</html>