$(function(){
	//获取验证对象
  	window.$my = {
        routeName: $("#g_routeName"),
        routePrice: $("#g_routePrice"),
        viewbtn: $("#consure"),
        recommendReason: $("#g_recommendReason"),
        routeSchedule: $("#routeArrange"),
        routeNameTip: $("#routeNameInfo"),
        routePriceTip: $("#routePriceInfo"),
        g_Allview_tip: $("#g_Allview_tip"),
        recommendReasonTip: $("#recommendReasonInfo"),
        button: $("#validateBtn"),
        sum: 0

    }
    function check(){
        var p = $("p",".route");
        p.text(function(index,html){
            if(html==="格式正确"){
                $my.sum++;
            }
        })

        if($my.sum === p.length){
            $my.button.removeAttr("disabled");
            $my.sum = 0;
        }else{
            $my.button.attr("disabled",true); 
            $my.sum = 0;
        }
    }

    $my.routeName.on("keyup",function(){
        var value = $(this).val();
        if(value===''){
            $my.routeNameTip.text("线路名称不能为空").css('color','#CA1F1F');
        }else if(value.length>30){
            $my.tip.text("线路名称不能超过30个字符").css('color','#CA1F1F');
        }else{
            $my.routeNameTip.text("格式正确").css('color','transparent');
        }
        check();
    });

    $my.routePrice.on("keyup",function(){
        var value = $(this).val();
        var reg = new RegExp("^[0-9]*$");
        if(value===''){
            $my.routePriceTip.text("价格不能为空").css('color','#CA1F1F');
        }else if(!reg.test(value)){
            $my.routePriceTip.text("必须输入数字").css('color','#CA1F1F');
        }else{
             $my.routePriceTip.text("格式正确").css('color','transparent');
        }
        check();
    })

    $my.viewbtn.on("click",function(){
        var checkbox = $("#searchView").find("input[type='checkbox']:checked");
        if(checkbox.length===0){
            $my.g_Allview_tip.text("请选择景点").css('color','#CA1F1F');
        }else{
             $my.g_Allview_tip.text("格式正确").css('color','transparent');
        }
        check();
    })


    $my.recommendReason.on("keyup",function(){
        var value = $(this).val();
        if(value===''){
            $my.recommendReasonTip.text("推荐理由不能为空").css('color','#CA1F1F');
        }else if(value.length>100){
            $my.recommendReasonTip.text("推荐理由不能超过100个字符").css('color','#CA1F1F');
        }else{
            $my.recommendReasonTip.text("格式正确").css('color','transparent');
        }
        check();
    })

    $my.routeSchedule.on("keyup",".schedule",function(){
        var value = $(this).val();
        var tip = $(this).next("p");
        if(value===''){
            tip.text("推荐理由不能为空").css('color','#CA1F1F');
        }else if(value.length>100){
            tip.text("推荐理由不能超过100个字符").css('color','#CA1F1F');
        }else{
            tip.text("格式正确").css('color','transparent');
        }
        check();
    })

    

});
