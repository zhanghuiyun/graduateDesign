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
	    img.setAttribute('width','120');      
	    img.setAttribute('height','90');
	    prvbox.appendChild(img);
	}
}

function showIdentify(){

    //上传图片
    $('#identify-pic').hide();
    $('#prv-pic').on('click',function(){
        $('#identify-pic').click();
    });

    var $formItem = $("[data-indetify]");
    $formItem.hide();
    $(":radio").click(function(){
        var $radioBtn = $("input:checked");
        if ($radioBtn.val() == "旅行社" || $radioBtn.val() == "导游") {
          $formItem.show();
        }else{
           $formItem.hide();
        }
    });
}
showIdentify();

