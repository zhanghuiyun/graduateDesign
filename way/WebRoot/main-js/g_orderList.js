$(function(){

	/*订单详情模态窗*/
    $('[data-target="#g_orderDetail"]').on('click',function(){
        var routeOrderId = $(this).attr("data-value");
        $.ajax({
            type : "POST",
            url : " ",
            data : {reserveId:routeOrderId},
            dataType :"json",
            success : function(data,textStatus){
            	$('#modal-orderTime').html(data.reserveTime);
            	$('#modal-staus').html(data.state);
            	$('#modal-routeName').html(data.routeName);
            	$('#modal-playTime').html(data.starTime);
            	$('#modal-personNum').html(data.adultNum + data.childNum);
            	$('#modal-price').html(data.price);
            	$('#modal-totalPrice').html(data.total);
            	$('#modal-linkName').html(data.linkman);
            	$('#modal-linkPhone').html(data.telephone);
            	$('#modal-rejectReason').html(data.refuse);
            }
        });
    });
    
    /*拒绝理由查看模态窗*/
     $('[data-target="#g_reject"]').on('click',function(){
        var routeRejectReason = $(this).attr("data-value");
        $.ajax({
            type : "POST",
            url : " ",
            data : {reserveId:routeRejectReason},
            dataType :"json",
            success : function(data,textStatus){
            	$('#g_reject_reason').html(data.refuse);
            }
        });
    });

    /*接单操作模态窗*/
     $('[data-target="#g_acceptOrder"]').on('click',function(){
        var routeAccept = $(this).attr("data-value");
        $.ajax({
            type : "POST",
            url : " ",
            data : {reserveId:routeAccept},
            dataType :"json",
            success : function(data,textStatus){
                $('#accept-submit-yes').addClass("data-dismiss").attr("data-dismiss","modal"); 
            }
        });
    });


     /*拒绝接单模态框*/
    $('[data-target="#g_rejectMod"]').on('click',function(){
        var routeReject = $(this).attr("data-value");
        var rejectReasonWrite = $('#g_reject_reason').text();
        $.ajax({
            type : "POST",
            url : " ",
            data : {
                reserveId:routeReject,
                refuse : rejectReasonWrite
            },
            dataType :"json",
            success : function(data,textStatus){
                $('#accept-submit-yes').addClass("data-dismiss").attr("data-dismiss","modal"); 
            }
        });
    });

    /*对失信的订单消息进行记录模态框*/
    $('[data-target="#g_codeOrder"]').on('click',function(){
        var recordRouteId = $(this).attr("data-value");
        $.ajax({
            type : "POST",
            url : " ",
            data : {reserveId:recordRouteId},
            dataType :"json",
            success : function(data,textStatus){
                $('#record-submit-yes').addClass("data-dismiss").attr("data-dismiss","modal"); 
            }
        });
    });
})