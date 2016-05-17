$(function() {
	// 标签栏样式
	var a = $('input[name="role"]').val();
	if(a=="0"){
    	$('#message0').addClass("active");
	}else{
		$('#message1').addClass("active");
	}

	// 导航标签展开
	if ($("#reserveRole").val() != 2) {
        $('#collapse4').addClass('in'); //侧边导航栏展开
    }

    // 点击禁用按钮，传入当前用户ID
    $("[data-target='#forbid']").on("click", function(){
	  	$('#forbidId').val( $(this).attr("data-userId"));
	});
	  
	// 点击启用按钮，传入当前用户ID
  	$("[data-target='#start']").on("click", function(){
  		$('#startId').val( $(this).attr("data-userId")); 
  	});

  	// 点击通过按钮，传入当前用户ID
   	$("[data-target='#pass']").on("click", function(){
  		$('#passId').val( $(this).attr("data-userId")); 
 	});
	 
	// 点击不通过按钮，传入当前用户ID
    $("[data-target='#nopass']").on("click", function(){
  		$('#nopassId').val( $(this).attr("data-userId")); 
  		$('#nopassName').val( $(this).attr("data-userName"));
  	});

    // 点击游客详情，发送ajax向后端请求数据
	$("[data-target='#touristdetail']").on("click", function(){
		$.ajax({
			type : "POST",
			url : "../userController/findByUserId",
			data: {userId : $(this).attr("data-userId")},
			dataType: "json",
			success: function(data, textStatus){
				$("#username").val(data.userName);
				$("#logo").attr("src","../headImg/"+data.img);
				$("#mail").val(data.mail);
				$("#telphone").val(data.telephone);
				$("#intro").text(data.introduce);
			}
		});
	});

	 // 点击导游旅行社详情，发送ajax向后端请求数据
	$("[data-target='#guidedetail']").on("click", function(){
		$.ajax({
			type : "POST",
			url : "../userController/findByUserId",
			data: {userId : $(this).attr("data-userId")},
			dataType: "json",
			success: function(data, textStatus){
				console.log(data.idNumber);
				$("#tusername").val(data.userName);
				$("#tlogo").attr("src","../headImg/"+data.picture);
				$("#tidnumber").val(data.idNumber);
				$("#tmail").val(data.mail);
				$("#ttelphone").val(data.telephone);
				$("#tintro").text(data.introduce);
			}
		});
	});
});