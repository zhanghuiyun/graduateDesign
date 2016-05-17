<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>更改密码</title>
        <!-- 引入插件样式 -->
        <link rel="stylesheet" href="<%=basePath%>css/lib/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrapValidator.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>main-css/password.css">
    </head>
    <body>
        <!-- HEADER PAGE -->
        <jsp:include page="../header.jsp"></jsp:include>
        <!-- END / HEADER PAGE -->

        <div class="container content_wrapper containerMinHeight">
            <div class="row">
                <!-- S 侧边导航栏 -->
                <form><input type="hidden" value="${sessionScope.user.role}" id="role"></form>
                <div class="col-md-2 col-md-offset-1" style="margin-top:30px;">
                    <c:if test="${sessionScope.user.role eq 0}">
                        <jsp:include page="../tourist/tourist-nav.jsp"></jsp:include>
                    </c:if>
                    <c:if test="${sessionScope.user.role eq 1}">
                        <jsp:include page="../guide/guide-nav.jsp"></jsp:include>
                    </c:if>
                    <c:if test="${sessionScope.user.role eq 2}">
                        <jsp:include page="../admin/admin-nav.jsp"></jsp:include>
                    </c:if>
                </div>
                <!-- E 侧边导航栏 -->

                <!-- S 重置密码 -->
                <div class="col-md-5 col-md-offset-1 border" style="margin-top:30px;">
                    <form id="pwdChange" class="form-horizontal" role="form" action="" method="post">
                        <div class="form-group col-lg-12 top" style="margin-top:10px;">
                            <label for="tourist-oldpwd" class="col-sm-3 control-label col-sm-offset-1">旧密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" id="tourist-oldpwd" name="password" autofocus/>
                                <p id="oldtip">请输入密码</p>
                            </div>
                        </div>
                        <div class="form-group col-lg-12 ">
                            <label for="tourist-newpwd" class="col-sm-3 control-label col-sm-offset-1">新密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" id="tourist-newpwd" name="touristNewpwd">
                                <p id="newtip">请输入新密码</p>
                            </div>
                        </div>
                        <div class="form-group col-lg-12 ">
                            <label for="tourist-confirmnewpwd" class="col-sm-3 control-label col-sm-offset-1">确认新密码</label>
                            <div class="col-sm-7">
                                <input type="password" class="form-control" id="tourist-confirmnewpwd" name="newPassword">
                                <p id="confirmtips">确认新密码</p>
                            </div>
                        </div>
                        <div class="form-group col-lg-12 top">
                            <div class="col-sm-7 col-sm-offset-4">
                                <input type="button" class="btn btn-primary col-sm-12" id="tourist-change" name="tourist-change" value="修改" disabled="true" />
                            </div>
                        </div>
                        <input type="button" class="btn" data-toggle="modal" data-target="#info" id="modelBtn" />
                    </form>
                </div>
                <!-- E 重置密码 -->
            </div>
        </div>

        <!-- FOOTER PAGE -->
        <jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->

        <!-- S 修改提示框 -->
        <div class="modal fade" id="info" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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

        <!-- 插件脚本 -->
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/lib/bootstrapValidator/bootstrapValidator.js"></script>
        <script type="text/javascript">
            $(function(){
                //侧边栏展开
                var role = $('#role').val();
                if (role == 0) {
                    $('#collapse2').addClass('in');
                }else if(role == 1){
                    $('#collapse3').addClass('in');
                }else{
                    $('#collapse7').addClass('in');
                }
            });
            $(document).ready(function(){
                $('#modelBtn').hide();
                //表单验证
                window.$my = {
                    oldInput: $("#tourist-oldpwd"),
                    newInput: $("#tourist-newpwd"),
                    confirm: $("#tourist-confirmnewpwd"),
                    oldtip: $("#oldtip"),
                    newtip: $("#newtip"),
                    tip: $("#confirmtips"),
                    newpassword: ''
                }
                
                $my.oldInput.on("keyup",function(){
                    var value = $(this).val();
                    if(value===''){
                        $my.oldtip.text("旧密码不能为空").css('color','#CA1F1F');
                    }else{
                        $my.oldtip.text("格式正确").css('color','transparent');
                    }
                    if($my.oldtip.text()!=="格式正确"){
                        $("#tourist-change").attr("disabled",true);
                    }

                })

                $my.newInput.on("keyup",function(){
                    var value = $(this).val();
                    $my.newpassword = value;
                    var telreg =  /^[a-zA-Z0-9\.]+$/;
                    if(value===''){
                        $my.newtip.text("旧密码不能为空").css('color','#CA1F1F');
                    }else if(value.length<6||value.length>30){
                        $my.newtip.text("密码长度为6-30个字符之间").css('color','#CA1F1F');
                    }else if(!telreg.test(value)){
                        $my.newtip.text("用户名只能包含字母以及数字").css('color','#CA1F1F');
                    }else if(value.length>=6&&value.length<=30&&telreg.test(value)){
                        $my.newtip.text("格式正确").css('color','transparent');
                    }
                    if($my.newtip.text()!=="格式正确"){
                        $("#tourist-change").attr("disabled",true);
                    }
                })

                $my.confirm.on("keyup",function(){
                    var value = $(this).val();
                    var telreg =  /^[a-zA-Z0-9\.]+$/;
                    if(value===''){
                        $my.tip.text("旧密码不能为空").css('color','#CA1F1F');
                    }else if(value.length<6||value.length>30){
                        $my.tip.text("密码长度为6-30个字符之间").css('color','#CA1F1F');
                    }else if(!telreg.test(value)){
                        $my.tip.text("用户名只能包含字母以及数字").css('color','#CA1F1F');
                    }else if(value !== $my.newpassword){
                        $my.tip.text("密码不吻合").css('color','#CA1F1F');
                    }
                    else if(value.length>=6&&value.length<=30&&telreg.test(value)&&value === $my.newpassword){
                        $my.tip.text("格式正确").css('color','transparent');
                        (function(){
                            if($my.oldtip.text()===$my.newtip.text()&&$my.newtip.text()===$my.tip.text()){
                                $("#tourist-change").removeAttr("disabled");
                            }else if($my.oldtip.text()!==$my.newtip.text()||$my.newtip.text()!==$my.tip.text()||$my.oldtip!==$tip.text()){
                                alert("你好");
                            }
                        })();
                    }
                    if($my.tip.text()!=="格式正确"){
                        $("#tourist-change").attr("disabled",true);
                    }
                });

                //提交表单
                $('#tourist-change').on('click',function(){
                    //获取表单input的value值
                    var oldPassword = $('#tourist-oldpwd').val();
                    var newPassword = $('#tourist-newpwd').val();
                    $.ajax({
                        type : "POST",
                        url : "<%=basePath%>userController/modifyPassword",
                        data: {
                            password : oldPassword,
                            newPassword : newPassword
                        },
                        dataType: "json",
                        success: function(data){
                            if (data.status == "error") {  //修改失败
                                $('#modelBtn').click();
                                $('#modal-body').html("修改失败，旧密码错误！");
                            }else{
                                $('#modelBtn').click();   //修改成功
                                $('#modal-body').html("修改成功！");
                            }
                        }
                    });
                });

                //模态框掩藏事件，表单清空
                $('#info').on('hidden.bs.modal', function (e) {
                    //表单清空
                    $('#pwdChange input[type=password]').val(''); 
                    $('#tourist-oldpwd').focus();
                    location.reload(true);                          
                });
                
            });
        </script>
    </body>
</html>
