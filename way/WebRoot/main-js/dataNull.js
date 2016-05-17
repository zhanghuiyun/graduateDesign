 $(function(){
    //数据为空处理
    var operate = $('[data-dataNull="operate"]');
    console.info(operate);
    var length = operate.length;
    console.info(length);
    if (length == 0) {
        var operateWarpeer = $('[data-dataNull="operateWarpeer"]');
        var div = $('<div class="text-center"></div>');
        var p_img = $('<p><img src="../images/none.png"></p>').appendTo(div);
        var p_info =$('<p>暂时没有数据</p>').appendTo(div);
        div.appendTo(operateWarpeer);
    }
 });