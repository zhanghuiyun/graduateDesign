//上传图片
function previewImage(file, prvid) {
		var tip = "上传的图片格式是 jpg 或 png 或 gif!"; // 设定提示信息
		var filters = {
		    "jpeg"  : "/9j/4",
		    "gif"   : "R0lGOD",
		    "png"   : "iVBORw"
		}
    	var prvbox = document.getElementById(prvid);
    	prvbox.innerHTML = "";
    	if (window.FileReader) { // html5方案
                for (var i=0, f; f = file.files[i]; i++) {
           			var fr = new FileReader();
            		fr.onload = function(e) {
                		var src = e.target.result;
                		if (!validateImg(src)) {
                    	alert(tip)
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
	    var img = document.createElement("img"); 
	    img.src = src;  
	    img.setAttribute('width','100');      
	    img.setAttribute('height','70');
	    prvbox.appendChild(img);
	}
}
$(function(){
    //图片上传
    $('#prv-pic').on('click',function(){
        $('#identify-pic').click();
    });
});

//单选框点击事件
function showIdentify(){
    var $formItem = $("[data-indetify]"); //得到要显示的表单列表
    $formItem.hide();  //将含有data-indetify属性的表单项掩藏
    $(":radio").click(function(){
        var $radioBtn = $("input:checked");   //得到点击对象
        var radioValue = $radioBtn.val();
        if (radioValue == "1" || radioValue == "2"){
            $formItem.show();   //显示
            if(radioValue == "1"){
                $('#identify-num').attr('placeholder','请输入导游证件号，以D开头');
                $('#resignForm')
                    .bootstrapValidator('updateOption', 'idNumber', 'regexp', 'regexp',  /^D\d{10}$/)
                    .bootstrapValidator('updateMessage', 'idNumber', 'regexp', '请输入正确格式的导游证件号');
            }else{
                $('#identify-num').attr('placeholder','请输入旅行社证件号，13位');
                $('#resignForm')
                    .bootstrapValidator('updateOption', 'idNumber', 'regexp', 'regexp',  /^\d{13}$/)
                    .bootstrapValidator('updateMessage', 'idNumber', 'regexp', '请输入正确格式的旅行社营业许可证号');
          }
        }else{
            $formItem.hide();  //掩藏
        }
    });
}
showIdentify();

//表单重置
$(function(){
    //单选按钮点击事件
    $('#userType input[type=radio]').on('click',function(){
        //表单清空
        $('#resignForm input[type=text]').val(''); 
        $('#resignForm input[type=password]').val('');  
        $('#resignForm input[type=file]').val('');   
        //单选按钮选中
        $(this).siblings().attr('checked',false).attr('checked', true);
        //验证信息清空
        $('#resignForm').data('bootstrapValidator').resetForm();
        $('#prv-pic img').remove();
        $('<span>添加图片<span>').appendTo($('#prv-pic'));
    });
});



