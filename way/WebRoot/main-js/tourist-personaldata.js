$(function(){
    //侧边栏展开
    var role = $('#role').val();
    if (role == 0) {
        $('#collapse2').addClass('in');
    }else if(role == 1){
        $('#collapse3').addClass('in');
    }else{
        $('#collapse7').addClass('in');
    }
    
    /*上传头像*/
    $('#tourist-upload').hide();
        $('#tourist-picture').on('click',function(){
            $('#tourist-upload').click();
    });
        
    //电话号码验证
    //电话号码验证框失去焦点的时候
    $('#tourist-telphone').on('keyup',function(){
        var tele = $('#tourist-telphone').val().trim();
        var length = tele.length;
        if(length != 0){
            var regexp = /^0?1[3|4|5|8][0-9]\d{8}$/;
            if(!regexp.test(tele)){
                $('#teleInfo').html("请输入正确的电话号码格式！");
            }
        }else{
            $('#teleInfo').html("电话号码不能为空哦!");
        }
        disable();
    })
    
    //电话号码验证框获取焦点的时候
    $('#tourist-telphone').on('keydown',function(){
        $('#teleInfo').html("");
    });

    //自我简介验证框
    //文本域失去焦点的时候
    $('#tourist-introduction').on('keyup',function(){
        var textarea = $('#tourist-introduction').val().trim();
        var length = textarea.length;
        if(length >= 200 || length == 0){
            $('#introduceInfo').html("文本域的长度应为1-200哦！");
        }
        disable();
    });

    //文本域获取焦点的时候
    $('#tourist-introduction').on('keydown',function(){
        $('#introduceInfo').html("");
    });

    //保存按钮disable？
    function disable(){
        var telephone = $('#teleInfo').html();
        var introduction = $('#introduceInfo').html();
        if (telephone == "" && introduction=="") {
            $('#tourist-save').attr('disabled',false);
        }else{
            $('#tourist-save').attr('disabled',true);
        }
    }
});
function previewImage(file) {
	var tip = "上传的图片格式是 jpg 或 png 或 gif!"; // 设定提示信息
	var filters = {
		"jpeg"  : "/9j/4",
		"gif"   : "R0lGOD",
		"png"   : "iVBORw"
	}
	if (window.FileReader) { // html5方案
		for (var i = 0, f; f = file.files[i]; i++) {
			var fr = new FileReader();
			fr.onload = function(e) {
				var src = e.target.result;
				if (!validateImg(src)) {
					alert(tip);
				} else {
					showPrvImg(src);
					
				}
			}
		fr.readAsDataURL(f);
		}
	} else { // 降级处理
			if ( !/\.jpg$|\.png$|\.gif$/i.test(file.value) ) {
				alert(tip);
			} else {
				showPrvImg(file.value);
			}
	}
	function validateImg(data) {
		var pos = data.indexOf(",") + 1;
		for (var e in filters) {
			if (data.indexOf(filters[e]) === pos) {
				return e;
			}
		}
		return null;
	}
	function showPrvImg(src) {
		var img = document.getElementById("tourist-picture");
		img.src = src;
	}
}