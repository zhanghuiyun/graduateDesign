$(function(){
	// 表格编号
  	var tr=$('#home table tbody tr');
  	var pageCurrent = parseInt($('#pageCurrent').val());
  	$.each(tr,function(index){
  		var sum = (index+1) + (pageCurrent -1)*8;
  		$(this).find('td:eq(0)').text(sum);
  	});
    
  	// 导航标签展开
	if ($("#reserveRole").val() != 2) {
    	$('#collapse5').addClass('in'); 
    }

    // 标签栏样式
	var a = $('input[name="state"]').val();
	if(a=="0"){
    	$('#noMessage').addClass("active");
	}else{
		$('#message').addClass("active");
	}

	// 反馈信息模态框验证
	window.$my = {
		tip: $('.tip'),
		text: $('#feedbackmes'),
		btn:  $('#submitBtn')
	}
	
	$my.text.on('keyup',function(){
		var refuse = $(this).val();
		if(refuse.length === 0){
	    	$my.tip.text("拒绝理由不能为空");
	    	$my.btn.attr("disabled",true);
	    }else if(refuse.length > 100) {
	    	$my.tip.text("长度不能超过100个字符");
	    	$my.btn.attr("disabled",true);
	    }else if(refuse.length >0 && refuse.length<100) {
	    	$my.tip.text("格式正确！");
	    	$my.btn.removeAttr("disabled");
	    }
	}); 

	//启动模态框按钮事件
	$("[data-target='#edit']").on("click", function(){
		var id = $(this).attr('data-id');
		var content = $(this).attr('data-content');
		$('#a_feedbackId').val(id); 
		$('#a_feedbackContent').text(content); 
	});
})
		
