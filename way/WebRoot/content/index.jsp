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

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <meta name="apple-mobile-web-app-capable" content="yes">
    	    
    	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/font-awesome.min.css"> 
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/awe-booking-font.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/jquery-ui.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/owl.carousel.css">
        
        <!-- MAIN STYLE -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/style.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath%>css/demo.css">

        <!-- REVOLUTION DEMO -->
        <link rel="stylesheet" type="text/css" href="<%=basePath%>revslider-demo/css/settings.css">
        
        <link id="colorreplace" rel="stylesheet" type="text/css" href="<%=basePath%>css/colors/blue.css">
        <link rel="stylesheet" href="<%=basePath%>main-css/sameStyle.css">
    </head>
    <body> 
        <!-- PAGE WRAP -->
        <div id="page-wrap">
            <!-- HEADER PAGE -->
    		<jsp:include page="header.jsp"></jsp:include>
    		<!-- END / HEADER PAGE -->
        
            <!-- HERO SECTION -->
            <section class="hero-section">
                <div id="slider-revolution">
                    <ul>
                        <li data-slotamount="7" data-masterspeed="500" data-title="onWay">
                            <img src="<%=basePath%>images/bg/1.jpg" data-bgposition="left center" data-duration="14000" data-bgpositionend="right center" alt="">

                            <div class="tp-caption sfb fadeout slider-caption-sub slider-caption-sub-1" data-x="500" data-y="230" data-speed="700" data-start="1500" data-easing="easeOutBack">
                              Last minute deal
                            </div>

                            <div class="tp-caption sfb fadeout slider-caption slider-caption-1" data-x="center" data-y="280" data-speed="700" data-easing="easeOutBack"  data-start="2000">On the way with me</div>
                        </li> 

                        <li data-slotamount="7" data-masterspeed="500" data-title="onWay">
                            <img src="<%=basePath%>images/bg/2.jpg" data-bgposition="left center" data-duration="14000" data-bgpositionend="right center" alt="">

                            <div class="tp-caption  sft fadeout slider-caption-sub slider-caption-sub-2" data-x="center" data-y="220" data-speed="700" data-start="1500" data-easing="easeOutBack">
                              Check out the top weekly destination
                            </div>

                            <div class="tp-caption sft fadeout slider-caption slider-caption-2" data-x="center" data-y="260" data-speed="700" data-easing="easeOutBack"  data-start="2000">
                                Travel with us
                            </div>
                        </li>

                        <li data-slotamount="7" data-masterspeed="500" data-title="onWay">
                            <img src="<%=basePath%>images/bg/3.jpg" data-bgposition="left center" data-duration="14000" data-bgpositionend="right center" alt="">

                            <div class="tp-caption lfl fadeout slider-caption slider-caption-3" data-x="center" data-y="260" data-speed="700" data-easing="easeOutBack"  data-start="1500">
                                OnWay
                            </div>
                            
                            <div href="#" class="tp-caption lfr fadeout slider-caption-sub slider-caption-sub-3" data-x="center" data-y="365" data-easing="easeOutBack" data-speed="700" data-start="2000">Take you to every corner of the world</div>
                        </li> 
                    </ul>
                </div>
            </section>
            <!-- END / HERO SECTION -->

            <!-- MASONRY -->
            <section class="masonry-section-demo">
                <div class="container">
                    <div class="destination-grid-content">
                        <div class="section-title">
                            <h3 style="font-family: "Microsoft Yahei ";">赏心悦目，开心一游</h3>
                        </div>
                        <div class="row">
                            <div class="awe-masonry">
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[0].viewId}">
                                        <div class="image-wrap image-cover">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[0].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="#">${indexBean.rankViewList[0].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门${indexBean.rankViewList[0].viewName}</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[0].viewGrade}</span>
                                        分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[1].viewId}">
                                        <div class="image-wrap image-cover">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[1].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[1].viewId}">
                                        ${indexBean.rankViewList[1].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[1].viewGrade}</span>
                                         分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[2].viewId}">
                                        <div class="image-wrap image-cover" id="imgBox">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[2].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="#">${indexBean.rankViewList[2].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[2].viewGrade}</span>
                                         分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[3].viewId}">
                                        <div class="image-wrap image-cover">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[3].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="#">${indexBean.rankViewList[3].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[3].viewGrade}</span>
                                        分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[4].viewId}">
                                        <div class="image-wrap image-cover">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[4].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="#">${indexBean.rankViewList[4].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[4].viewGrade}</span>
                                         分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[5].viewId}">
                                        <div class="image-wrap image-cover">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[5].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="#">${indexBean.rankViewList[5].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[5].viewGrade}</span>
                                         分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[6].viewId}">
                                        <div class="image-wrap image-cover">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[6].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="#">${indexBean.rankViewList[6].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[6].viewGrade}</span>
                                         分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[7].viewId}">
                                        <div class="image-wrap image-cover">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[7].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="#">${indexBean.rankViewList[7].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[7].viewGrade}</span>
                                        分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                                <!-- GALLERY ITEM -->
                                <div class="awe-masonry__item">
                                    <a href="<%=basePath%>viewController/findViewDetail?viewId=${indexBean.rankViewList[8].viewId}">
                                        <div class="image-wrap image-cover">
                                            <img src="" alt="" data-img = "${indexBean.rankViewList[8].viewPicture}">
                                        </div>
                                    </a>
                                    <div class="item-title">
                                        <h2><a href="#">${indexBean.rankViewList[8].viewName}</a></h2>
                                        <div class="item-cat">
                                            <ul>
                                                <li><a href="#">厦门</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="item-available">
                                        <span class="count">${indexBean.rankViewList[8].viewGrade}</span>
                                        分数
                                    </div>
                                </div>
                                <!-- END / GALLERY ITEM -->
                            </div>
                        </div>
                        <div class="more-destination">
                            <a href="<%=basePath%>viewController/findAllViews">查看更多景点</a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END / MASONRY -->


            <section class="sale-flights-section-demo">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="sale-flights-tabs tabs">
                                <ul>
                                    <li><a href="#sale-flights-tabs-1">热门路线</a></li>
                                    <li><a href="#sale-flights-tabs-2">热门景点</a></li>
                                </ul>
                                
                                <div class="sale-flights-tabs__content tabs__content">
                                <!-- S 热门路线 -->
                                
                                    <div id="sale-flights-tabs-1">
                                        <!-- ITEM -->
                                        <c:forEach var="mr" items="${indexBean.mostRouteList}">
    	                                    <div class="trip-item" style="position:relative;">
    	                                        <div class="item-media">
    	                                            <img src="<%=basePath%>images/bg/14.jpg" alt="" style="position:relative;">
    	                                        </div>
    	                                        <div class="item-body">
    	                                            <div class="item-title">
    	                                                <h2>
    	                                                    <a href="<%=basePath%>routeController/findRouteDetal?routeId=${mr.routeId}">${mr.routeName}</a>
    	                                                </h2>
    	                                            </div>
    	                                            <div class="item-list">
    	                                                <ul>
    	                                                    <li>${mr.views}</li>
    	                                                    <li>${mr.day}</li>
    	                                                </ul>
    	                                            </div>
    	                                            <div class="item-footer">
    	                                                <div class="item-rate">
    	                                                    <span>分数：${mr.grade}</span>
    	                                                </div>
    	                                                <div class="item-icon">
    	                                                    <i class="awe-icon awe-icon-car"></i>
    	                                                    <i class="awe-icon awe-icon-food"></i>
    	                                                    <i class="awe-icon awe-icon-level"></i>
    	                                                    <i class="awe-icon awe-icon-wifi"></i>
    	                                                </div>
    	                                            </div>
    	                                        </div>
    	                                        <div class="item-price-more">
    	                                            <div class="price">
    	                                                Adult ticket
    	                                                <ins>
    	                                                    <span class="amount">￥${mr.price}</span>
    	                                                </ins>
    	                                                <del>
    	                                                    <span class="amount">￥300</span>
    	                                                </del>
    	                                        
    	                                            </div>
    	                                            <a href="<%=basePath%>routeController/findRouteDetal?routeId=${mr.routeId}" class="awe-btn">
    	                                            查看详情</a>
    	                                        </div>
    	                                    </div>
                                        </c:forEach>
                                        <!-- END / ITEM -->
                                     
                                    </div>
                                    <!-- S 热门路线 -->

                                    <!-- S 热门景点 -->
                                    <div id="sale-flights-tabs-2">
                                    <c:forEach var="mv" items="${indexBean.mostViewList}">
                                        <div class="trip-item">
                                            <div class="item-media">
                                                <div class="image-cover">
                                                    <img src="" alt="" data-view="${mv.viewPicture}" style="width:225px;height:170px;">
                                                </div>
                                            </div>
                                            <div class="item-body">
                                                <div class="item-title">
                                                    <h2>
                                                        <a href="<%=basePath%>viewController/findViewDetail?viewId=${mv.viewId}" id="">
                                                        ${mv.viewName}</a>
                                                    </h2>
                                                </div>
                                                <div class="item-list">
                                                    <ul>
                                                        <li>${mv.viewAddress}</li>
                                                    </ul>
                                                </div>
                                                <div class="item-footer">
                                                    <div class="item-rate">
                                                        <span>分数：${mv.viewGrade}</span>
                                                    </div>
                                                    <div class="item-icon">
                                                        <i class="awe-icon awe-icon-car"></i>
                                                        <i class="awe-icon awe-icon-food"></i>
                                                        <i class="awe-icon awe-icon-level"></i>
                                                        <i class="awe-icon awe-icon-wifi"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item-price-more">
                                                <a href="<%=basePath%>viewController/findViewDetail?viewId=${mv.viewId}"
                                                 class="awe-btn">查看详情</a>
                                            </div>
                                        </div>
    									</c:forEach>
                                       
                                    </div>
                                    <!-- E 热门景点 -->
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="awe-services">
                                <h2>商家最优榜</h2>
                                <ul class="awe-services__list">
                                    <li>
                                        <a href="#">
                                            <i class="awe-icon awe-icon-check"></i>
                                            <i class="awe-icon awe-icon-arrow-right"></i>
                                            可爱哟
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="awe-icon awe-icon-check"></i>
                                            <i class="awe-icon awe-icon-arrow-right"></i>
                                            商家名称
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="awe-icon awe-icon-check"></i>
                                            <i class="awe-icon awe-icon-arrow-right"></i>
                                            商家名称
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="awe-icon awe-icon-check"></i>
                                            <i class="awe-icon awe-icon-arrow-right"></i>
                                            商家名称
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="awe-icon awe-icon-check"></i>
                                            <i class="awe-icon awe-icon-arrow-right"></i>
                                            商家名称
                                        </a>
                                    </li>
                                </ul>
                                <div class="video-wrapper embed-responsive embed-responsive-16by9">
                                    <iframe class="embed-responsive-item" src="<%=basePath%>/vedio/xiamen.mp4"></iframe>
                                </div>
                            </div>
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
        <script type='text/javascript' src="<%=basePath%>js/lib/jquery-ui.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/lib/masonry.pkgd.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/lib/jquery.parallax-1.1.3.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/lib/jquery.owl.carousel.js"></script>
        <!-- REVOLUTION DEMO -->
        <script type="text/javascript" src="<%=basePath%>revslider-demo/js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>revslider-demo/js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>js/scripts.js"></script>
        <script type="text/javascript">
            if($('#slider-revolution').length) {
                $('#slider-revolution').show().revolution({
                    ottedOverlay:"none",
                    delay:10000,
                    startwidth:1600,
                    startheight:650,
                    hideThumbs:200,

                    thumbWidth:100,
                    thumbHeight:50,
                    thumbAmount:5,
                    
                                            
                    simplifyAll:"off",

                    navigationType:"none",
                    navigationArrows:"solo",
                    navigationStyle:"preview4",

                    touchenabled:"on",
                    onHoverStop:"on",
                    nextSlideOnWindowFocus:"off",

                    swipe_threshold: 0.7,
                    swipe_min_touches: 1,
                    drag_block_vertical: false,
                    
                    parallax:"mouse",
                    parallaxBgFreeze:"on",
                    parallaxLevels:[7,4,3,2,5,4,3,2,1,0],
                                            
                                            
                    keyboardNavigation:"off",

                    navigationHAlign:"center",
                    navigationVAlign:"bottom",
                    navigationHOffset:0,
                    navigationVOffset:20,

                    soloArrowLeftHalign:"left",
                    soloArrowLeftValign:"center",
                    soloArrowLeftHOffset:20,
                    soloArrowLeftVOffset:0,

                    soloArrowRightHalign:"right",
                    soloArrowRightValign:"center",
                    soloArrowRightHOffset:20,
                    soloArrowRightVOffset:0,

                    shadow:0,
                    fullWidth:"on",
                    fullScreen:"off",

                    spinner:"spinner2",
                                            
                    stopLoop:"off",
                    stopAfterLoops:-1,
                    stopAtSlide:-1,

                    shuffle:"off",

                    autoHeight:"off",
                    forceFullWidth:"off",
                    
                    
                    
                    hideThumbsOnMobile:"off",
                    hideNavDelayOnMobile:1500,
                    hideBulletsOnMobile:"off",
                    hideArrowsOnMobile:"off",
                    hideThumbsUnderResolution:0,

                    hideSliderAtLimit:0,
                    hideCaptionAtLimit:0,
                    hideAllCaptionAtLilmit:0,
                    startWithSlide:0
                });
            }
        </script>
        <script type="text/javascript">
            $('img[data-img]').each(function() {
                var data = $(this).attr("data-img");
                var srcs = data.substring(1,data.length-1);
                var src = srcs.split(",");
                $(this).attr("src","<%=basePath%>headImg/"+src[0]);
            })

            $('img[data-view]').each(function() {
                var viewData = $(this).attr("data-view");
                var viewsrc = viewData.substring(1,viewData.length-1);
                var srcs = viewsrc.split(',');
                $(this).attr("src","<%=basePath%>headImg/"+srcs[0]);
            });     
        </script>
    </body>
</html>