$(function(){
	//线路评价用户头像背景随机
	var img = $('.img');
	$.each(img,function(){
		var random = Math.round(Math.random()*140+1);
		var red = 50+random,
		    green = 100+random,
		    blue = 80+random;
		var d = 'rgba(';
	    var e = ',0.4)';
		var ragb = d + red + ',' + green + ',' + blue +e;
		$(this).css('backgroundColor',ragb);
	});
});

//图片数组
function toArray(){
	var a = "[14564797660830.png, 14564797660861.png]";
	var b = a.substring(1, a.length-1);
	var c = b.split(",");
		a.join(",");
}