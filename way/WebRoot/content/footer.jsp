<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<footer>
    <div class="container">
        <div class="row">
            <div class="btm_nav_l">
                <ul>
                    <li><a href="/class695">关于我们</a></li>
                    <li><a href="/class696">联系我们</a></li>
                    <li><a href="/class697">加入我们</a></li>
                    <li><a href="/class698">发展历程</a></li>
                    <li><a href="/class699">旅游资质</a></li>
                    <li><a href="/class700">用户协议</a></li>
                    <li><a href="/class701">免责声明</a></li>
                </ul>
                <p>Copyright&nbsp;©&nbsp;2002-2016&nbsp;&nbsp;版权所有&nbsp;&nbsp;<a href="http://www.xm766.cn">厦门在路上旅游网</a>&nbsp;&nbsp;&nbsp;&nbsp;闽ICP备07502412号-8<br/></p>
            </div> 

            <div class="btm_nav_r">
                <img src="<%=basePath%>images/img/QR-code.jpg" width="85" height="85" />
                <span><i>0592-5668592</i><em>周一至周日：8:30-21:30</em></span>
            </div>

            <p class="a_tag">友情链接：<br/>
                <a href='http://lxs.cncn.com/83612' target='_blank'>厦门中国国旅</a>
                <a href='http://www.niuwan.com/' target='_blank'>牛丸旅游网</a> 
                <a href='http://www.naliniu.com' target='_blank'>南京周边游</a> 
                <a href='http://www.eptxw.com' target='_blank'>机票加盟</a> 
                <a href='http://www.qiaomian.com/' target='_blank'>自由行</a> 
                <a href='http://www.qunaly.com/' target='_blank'>青岛旅行社</a>
                <a href='http://www.bashang.net' target='_blank'>坝上草原旅游网</a>
                <a href='http://www.tootour.com' target='_blank'>深圳旅游公司</a>
                <a href='http://www.entu.com' target='_blank'>厦门出境游</a> 
                <a href='http://www.yjldp.com' target='_blank'>长岛渔家乐</a> 
                <a href='http://www.lijiang-tour.cn' target='_blank'>宜昌九畹溪漂流</a> 
                <a href='http://xiamen.daoxila.com/' target='_blank'>厦门结婚网</a> 
                <a href='http://36.la' target='_blank'>合肥旅行社</a> 
                <a href='http://www.haotour.com.cn' target='_blank'>广东省内游</a> 
                <a href='http://www.xakanghui.com' target='_blank'>西安旅行社</a>
            </p> 
        </div>
    </div>
</footer>