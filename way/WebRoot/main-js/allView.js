$(function() {
	// 表格编号
	var tr=$('#allView tbody tr');
  	var pageCurrent = parseInt($('#pageCurrent').val());
  	$.each(tr,function(index){
  		var sum = (index+1) + (pageCurrent -1)*8;
  		$(this).find('td:eq(0)').text(sum);
  	})

  	// 发送ajax请求景点信息
  	$('[data-target="#edit"]').on('click',function(){
		var dataId = $(this).attr("data-id");
		$('#viewId').val(dataId);
		$.ajax({
			type: "POST",
			url: "../viewController/findViewByViewId",
			dataType: "json",
			data: {"viewId" : dataId},
			success: function(data){
				$('#viewname').val(data.viewName);
				$('#viewattr').val(data.viewAddress);
				$('#viewdesc').val(data.viewRemark);
				$('#intro').val(data.viewRecommend);
			}
		});
	});

	//侧边导航栏展开
	if ($("#reserveRole").val() != 2) {
    	$('#collapse3').addClass('in'); 
	}

	// 修改景点验证
    window.$my = {
        inputs: $("input[type='text']:not([name='key']"),
        text: $("textarea"),
        button: $("#change"),
        sum: 0
    }

    function check(){
        var p = $(".tip");
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

    $my.inputs.on("keyup",function(){
        var value = $(this).val();
        var tip = $(this).next("p");
        if(value.length === 0) {
        	tip.text("信息不能为空").css('color','red');
        }else if(value.length > 200) {
        	tip.text("字符不能超过200个").css('color','red');
        }else if(value.length>0 && value.length < 200) {
        	tip.text("格式正确").css('color','transparent');
        }

		check();
    })

    $my.text.on("keyup",function(){
    	var value = $(this).val();
        var tip = $(this).next("p");
        if(value.length === 0) {
        	tip.text("信息不能为空").css('color','red');
        }else if(value.length > 200) {
        	tip.text("字符不能超过200个").css('color','red');
        }else if(value.length>0 && value.length < 200) {
        	tip.text("格式正确").css('color','transparent');
        }
        check();
    });
});