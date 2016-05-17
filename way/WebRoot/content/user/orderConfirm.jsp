<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
    	<title>订单确认</title>
        <!-- 引入插件样式 -->
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/easyui.css">
        <!-- 自定义样式 -->
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>main-css/order.css">
    </head>
    <body class="orderConfrim">
        <!-- HEADER PAGE -->
    	<jsp:include page="../header.jsp"></jsp:include>
        <!-- END / HEADER PAGE -->

        <div class="container">
        <!-- S  订单信息-->
        	<div class="row">
                <form class="form-horizontal" method="post" action="<%=basePath%>reserveController/order" id="OrderDeterminationForm">
                <!-- S  出游信息-->
                    <div class="col-lg-7 travelInfor">
            			<div class="col-md-12 icon_top">
            				<span class="glyphicon glyphicon-list-alt icon"></span>
            				<span class="icon_explain">出游信息</span>
            			</div>
            			<div class="col-md-12">
            				<div class="form-group">
            					<label class="col-lg-2 control-label">线路名称：</label>
            					<div class="col-lg-8">
                                    <input type="text" class="inputBorder lineHeight"  value="${route.routeName}" name="routeName" readonly style="width:500px;" />
                                    <input value="${route.routeId}" name="routeId" type="hidden"/>
                                    <input  value="${route.userName}" name="userName" type="hidden"/>
            					</div>
            			    </div>
            			</div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-lg-2 control-label">单价：</label>
                                <div class="col-lg-8">
                                    <label class="control-label">￥</label>
                                    <input class="inputBorder" id="tourInforPrice" value="${route.price}" name="price" readonly />
                                    <label class="control-label labelStyle">(单位：元  //  儿童半价)</label>
                                </div>
                            </div>
                        </div>
            			 <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-lg-2 control-label">出发日期：</label>
                                <div class="col-lg-8 lineHeight" id="data">
                                   <input  type="text" class="easyui-datebox " id="goTime" name="starTime" value="">
                                </div>
                            </div>
                        </div>
            			<div class="col-md-12">
            				<div class="form-group">
            					<label class="col-lg-2 control-label">旅游天数：</label>
                                <div class="col-lg-8">
                                   <!--  <input type="text" class="totalPrice"  size="5" value="${param.day}" readonly> -->
                                    <input type="text" class="inputBorder lineHeight"  size="5" value="3" readonly>
                                </div>
            			    </div>
            			</div>
            			<div class="col-md-12">
            				<div class="form-group">
            					<label class="col-lg-2 control-label">人数：</label>
                                <div class="col-lg-2">
                					<label class="control-label labelStyle">
                                        <select id="adult" name="adultNum">
                                            <option value="0">0</option>
            								<option value="1">1</option>
            								<option value="2">2</option>
            								<option value="3">3</option>
            								<option value="4">4</option>
            								<option value="5">5</option>
            						    </select>
              						</label>
                                </div>
          						<label class="col-lg-2 control-label labelStyle">
          							成人
          						</label>
            			    </div>
            			</div>
            			<div class="col-md-12">
            				<div class="form-group">
                                <div class="col-lg-2 col-lg-offset-2">
            					<label class="control-label labelStyle">
                                    <select id="child" name="childNum">
                                        <option value="0">0</option>
        								<option value="1">1</option>
        								<option value="2">2</option>
        								<option value="3">3</option>
        								<option value="4">4</option>
        								<option value="5">5</option>
        						    </select>
          						</label>
                                </div>
          						<label class="col-lg-2 control-label labelStyle">
          							小孩
          						</label>
            			    </div>
            			</div>
            			<div class="col-md-12">
            				<div class="form-group">
            					<label class="col-lg-2 control-label">联系人：</label>
            					<div class="col-lg-4">
        				      	    <input type="text" class="form-control inputStyle" id="linkName"  name="linkman" value="${sessionScope.user.userName}" readonly> 
        				    	</div>
            			    </div>
            			</div>
            			<div class="col-md-12">
            				<div class="form-group">
            					<label class="col-lg-2 control-label">联系方式：</label>
            					<div class="col-lg-4">
        				      	    <input type="text" class="form-control inputStyle" id="linkNum"  name="telephone" value="${sessionScope.user.telephone}" readonly>
        				    	</div>
            			    </div>
            			</div>
            			<div class="col-md-12">
            				<div class="form-group">
            					<label class="col-lg-2 control-label">邮箱：</label>
            					<div class="col-lg-4">
        				      	    <input type="text" class="form-control inputStyle" id="linkEmail"  name="mail" value="${sessionScope.user.mail}" readonly>
        				    	</div>
            			    </div>
            			</div>
                    </div>
                    <!-- E  出游信息-->

                    <!-- S  费用明细-->
                    <div class="col-md-3 col-md-offset-1 travelInfor">
                        <div class="col-md-12">
                            <div class="form-group icon_top">
                                <span class="glyphicon glyphicon-book icon text-right"></span>
                                <span  class="icon_explain">费用明细</span>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-lg-5 control-label">成人:</label>
                                <div class="col-lg-7">
                                    <input type="text"  id="adultContent" value="0" class="personSum" readonly />
                                    <label class="control-label">*</label>
                                    <input type="text" id="adultPrice" value="" class="price" readonly />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-lg-5 control-label">儿童:</label>
                                <div class="col-lg-7">
                                    <input class="personSum" id="childContent" value="0" readonly />
                                    <label class="control-label">*</label>
                                    <input class="price" id="childPrice" type="text" readonly />
                                </div>
                            </div>
                        </div> 
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-lg-5 control-label">总计:</label>
                                <div class="col-lg-7">
                                    <label class="control-label">￥</label>
                                    <input class="inputBorder lineHeight money" id="totalPrice" value="" type="text" readonly />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="col-lg-5 control-label">实付金额:</label>
                                <div class="col-lg-7">
                                    <label class="control-label">￥</label>
                                    <input type="text" class="inputBorder lineHeight money" id="shouldPayPrice" value="" readonly />
                                </div>
                            </div>
                        </div> 
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="col-md-7 col-md-offset-3 text-center">
                                    <input type="button" class="btn btn-primary col-md-12" value="提交订单" id="submitBtn">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- E  费用明细-->

                    <!-- S 出游人信息 --> 
                    <div class="col-lg-7 travelInfor div_distance">
                        <div class="col-md-12 icon_top">
                            <span class="glyphicon glyphicon-edit icon text-right "></span>
                            <span class="icon_explain">出游人信息</span>
                        </div>
                        <div id="tour_wrapper">
                            <div id="tour0" data-tour="information">
                                <!-- 姓名 -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">姓名：</label>
                                        <div class="col-lg-4">
                                            <input type="text" class="form-control inputStyle" id="name" placeholder="请输入姓名" name="touristName" />
                                            <p id="name_tip">请输入姓名</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- 手机 -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">手机：</label>
                                        <div class="col-lg-4">
                                            <input type="text" class="form-control inputStyle" id="tel" placeholder="请输入手机号" name="touristTele" />
                                            <p id="tel_tip">请输入手机号</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- 身份证号 -->
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">身份证号：</label>
                                        <div class="col-lg-4">
                                            <input type="text" class="form-control inputStyle" id="id-card" placeholder="请输入身份证号" name="touristIdNum">
                                            <p id="id_card_tip">请输入身份证号</p>
                                        </div>
                                        <div class="col-lg-2">
                                            <input type="button" value="保存出游人" class="btn btn-info" data-btn="save">
                                        </div>
                                        <div class="col-lg-2">
                                            <input type="button" value="选择出游人"  class="btn btn-info" data-btn="select">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12" style="margin-top:15px;">
                            <div class="form-group">
                                <div class="col-md-4 col-md-offset-2">
                                    <input type="button" class="btn btn-primary col-md-12" id="addtourstorsNum" value="添加联系人" />
                                </div>
                            </div>
                        </div>
                    </div>   
                    <!-- E 出游人信息 -->
        	    </form>
            </div>
            <!-- E  订单信息-->

            <!--S 下单须知  -->
            <div class="row">
                <div class="col-lg-7 travelInfor div_distance div_distance_bottom">
                    <div class="col-md-12 icon_top">
                        <span class="glyphicon glyphicon-warning-sign icon text-right"></span>
                        <span class="icon_explain">预定须知</span>
                    </div>
                    <div class="col-md-12">
                        <p class="col-lg-12 p_distance">1、正常阴雨天气不影响正常出游，如遇不可抗逆因素导致不能出游我司会提前与您联系；</p>
                    </div>
                    <div class="col-md-12">
                        <p class="col-lg-12 p_distance">2、病患者、孕妇及行动不便者预订提示：为了确保旅游顺利出行，防止旅途中发生人身意外伤害事故，请旅游者在出行前做一次必要的身体检查；</p>
                    </div>
                    <div class="col-md-12">
                        <p class="col-lg-12 p_distance">3、病患者、孕妇及行动不便者预订提示：为了确保旅游顺利出行，防止旅途中发生人身意外伤害事故，请旅游者在出行前做一次必要的身体检查</p>
                    </div>
                </div>
            </div>
            <!--E 下单须知  -->
        </div>
        
        <!-- S 下单按钮点击时，验证失败提示框 -->
        <div class="modal fade" id="validMessage">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title text-center">提交失败</h4>
                    </div>
                    <div class="modal-body text-center">
                        <p>请将订单信息填写完善，出游人数以及出游日期是必填的哦！！</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- E 下单按钮点击时，验证失败提示框 -->

        <!-- FOOTER PAGE -->
        <jsp:include page="../footer.jsp"></jsp:include>
        <!-- END / FOOTER PAGE -->
        
        <!-- 出游人信息提示框 -->
        <div class="modal fade" id="tourInfoModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title text-center">出游人信息</h4>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="consure">确认</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 出游人信息提示框 -->
        <div class="modal fade" id="tourInfoSaveModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title text-center">出游人信息保存</h4>
                    </div>
                    <div class="modal-body text-center">
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" id="consure">确认</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 插件脚本 -->
        <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/lib/jquery.easyui.min.js"></script>
        <!-- 自定义脚本 -->
        <script type="text/javascript" src="<%=basePath%>main-js/orderConfirm.js"></script>
    </body>
</html>
