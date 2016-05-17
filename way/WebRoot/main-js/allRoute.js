$(function(){
    //侧边栏展开
    var role = $('#role').val();
    if (role == 1) {
        $('#collapse4').addClass('in');
    }else{
        $('#collapse2').addClass('in');
    }

    //表格标签栏
    var i = $('input[name="state"]').val();
    var tab = $('#myTab li');
    $.each(tab,function(index){
        if (index == i) {
            $(this).addClass('active');
        }
    });

    //表格编号
    var tr=$('#allroute tbody tr');
    var pageCurrent = parseInt($('#pageCurrent').val());
    $.each(tr,function(index){
        var sum = (index+1) + (pageCurrent -1)*8;
        $(this).find('td:eq(0)').text(sum);
    });
});