$(function () {
	// 反馈信息模态框验证
	window.$my = {
		tip: $('.tip'),
		text: $('#refuse'),
		btn:  $('#submitbtn')
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
});