$(function(){
	//侧边导航栏展开
	if ($("#reserveRole").val() != 2) {
        $('#collapse3').addClass('in');
    }

    //上传图片
    $('.photo-btn').on('click',function(){
		$('#identify-pic').click();
	});

	
	// 修改景点验证
    window.$my = {
        inputs: $("input[type='text']:not([name='key']"),
        text: $("textarea"),
        button: $("#validateBtn"),
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
        	tip.text("信息不能为空");
        }else if(value.length > 30) {
        	tip.text("字符不能超过30个");
        }else if(value.length>0 && value.length < 30) {
        	tip.text("格式正确");
        }

        check();
    })

    $("#photo-btn").on('click',function(){
    	$(this).next('p').text('格式正确');
    	check();
    });

    $my.text.on("keyup",function(){
    	var value = $(this).val();
        var tip = $(this).next("p");
        if(value.length === 0) {
        	tip.text("信息不能为空");
        }else if(value.length > 30) {
        	tip.text("字符不能超过30个");
        }else if(value.length>0 && value.length < 30) {
        	tip.text("格式正确");
        }
        check();
    });

    $('#validateBtn').on('click',function(){
    	var value = $('#identify-pic').val();
    	if(value){
    		$("#publish-form").submit();
    	}else{
    		alert("请上传图片!");
    	}
    })

});