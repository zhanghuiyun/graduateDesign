//分页显示掩藏
var value = $('[name="totalPage"]').val();
if(value == '1' || value == "0") {
    $('.page').hide();
}

// 分页功能对象
var  Page = {
	// 设置页码
	setPageNum: function() {
		document.getElementById("pageCurrent").value = 1;
		document.getElementById("form").submit();
	},

	// 表单提交
	Jumping: function() {
		document.getElementById("form").submit();
	},

	// 跳转到对应页
	gotoPage: function(pagenum) {
		document.getElementById("pageCurrent").value = pagenum;
		document.getElementById("form").submit();
	}
}