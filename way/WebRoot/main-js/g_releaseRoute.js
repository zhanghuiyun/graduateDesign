$(function(){
    var count = 1;
    //添加天数点击事件，添加天数
    $('#g_addDay').on('click',function(){
        count++;
        var container = $('<div class="form-group"></div>');
        var Wrapper = $('<div class="col-lg-5 col-lg-offset-3 routeDay"></div>').appendTo(container);
        var span1 = $('<span>第</span>').appendTo(Wrapper);
        var input = $('<input type="text" class="routeDay_input" value="" readonly data-day="day">').appendTo(Wrapper); 
        var span2 = $('<span>天</span>').appendTo(Wrapper);
        var textareaWrapper = $('<div class="col-lg-7 col-lg-offset-3" style="margin-top:5px;">').appendTo(container);
        var textarea = $('<textarea class="form-control schedule" placeholder="请输入行程安排"></textarea>').appendTo(textareaWrapper);
        var textareaTip = $('<p class="schedule-tip">请输入行程安排</p>').appendTo(textareaWrapper);
        var iconWrapper = $('<div class="col-lg-1" data_icon="icon"></div>').appendTo(container);
        var icon = $('<span class="glyphicon glyphicon-remove" ></span>').appendTo(iconWrapper);
        $('#routeArrange').append(container);
        //对天数框进行删除  
        icon.on('click',function(){
            icon.closest('.form-group').remove(); //将其所有的整个div盒子删除
            var inputs = $('[data-day="day"]');
            $.each(inputs,function(index){  //对天数进行排序
                $(this).val(index+1);
            });
        });
        var inputs = $('[data-day="day"]');  //对天数进行排序
        $.each(inputs,function(index){
            $(this).val(index+1);
        });
    });
    
    //选取景点操作
    $('[data-target="#addView"]').on('click',function(){
        $.ajax({
            type : "GET",
            url : "../../viewController/findViewNames",
            dataType : "json",
            success  : function(data){
            	console.info(data);
                //模态框生成景点列表
                var model = $('#searchViewModel');
                var table = $('<table id="searchView"></table>').appendTo(model);
                var col = 5;
                var lines = Math.ceil(data.length/col);   //共有多少行
                for(var j=0;j<lines;j++){     //每行创建一个tr以及相应个数的td
                    var tr = $('<tr></tr>').appendTo(table);    
                    for(var k=0;k<col;k++){    //每行最多5列，创建td
                        if(data[k+j*col] != undefined){   //当后台传入的数据存在的时候，执行下面操作
                            var td = $('<td></td>').appendTo(tr);
                            var label = $('<label class="viewPadding"></label>').appendTo(td);
                            var input = $('<input type="checkbox" name="view" value="" data-value=""/>').appendTo(label);
                            input.val(data[k+j*col].viewId);   //将viewId赋值给input框
                            var span = $('<span></span>').appendTo(label);
                            span.text(data[k+j*col].viewName);    //将viewName赋值给span
                            input.attr("data-value",data[k+j*col].viewName);  //将viewName赋值给自定义属性data-value
                        }         
                    }
                };
                //模态窗多选框取值到全部景点的input框中
                var chk_valueArr = [];  //存储选取到的viewId值
                var chk_viewName = [];   //存储选取到的viewName值
                $('#consure').on('click',function(){
                    if( $('#g_Allview').val() == ""){
                        $('input[name = "view" ]:checked').each(function(){
                            chk_valueArr.push($(this).val()); //取得多选框的viewId值存到数组中
                            chk_viewName.push($(this).attr("data-value"));   //取得多选框的viewName值存到数组中
                        });
                    }else{
                        chk_valueArr.length = 0 ;   //清空数组
                        $('input[name = "view" ]:checked').each(function(){
                            chk_valueArr.push($(this).val());  //取得多选框的viewId值存到数组中
                            chk_viewName.push($(this).attr("data-value"));  //取得多选框的viewName值存到数组中
                        });
                    }
                    $('#g_viewId').val(chk_valueArr);  //将checked的viewId值存到所有景点的input隐藏框中
                    $('#g_Allview').val(chk_viewName);  //将checked的viewName值存到所有景点的input框中
                    $('#consure').addClass("data-dismiss").attr("data-dismiss","modal");   //清除模态框
                });

                //相应操作的时候移除动态创建的景点列表
                $('#addView').on('hidden.bs.modal', function () {
                    table.remove();
                });
            }
        })
    });
    
    //发布路线按钮提交事件
    $('#validateBtn').on('click',function(){
        var param={},  //发布路线信息封装对象
            route={},  //路线名字，路线价格，推荐理由封装对象
            schedules =[]; 
            
        var routeInfo = $('[data-group="rountInfo"]');   //获取发布信息
        $.each(routeInfo,function(index,item){   
            route[$(this).attr('name')] = $(this).val();  //对象赋值  
        });
        route['views'] = $('#g_Allview').val();
        param.route=route;
        //路线相应景点封装
        var viewsId = $('#g_viewId').val().split(",");
        param[$('#g_viewId').attr("name")] = viewsId;
        //路线行程封装
        var routeArrange = $('#routeArrange .form-group');
        $.each(routeArrange,function(index,item){
            var routeArranges = {};  //路线行程封装对象
            var input = $(this).find('input');  
            var textarea = $(this).find('textarea'); 
            var textareaValue = textarea.val().replace(/\n/g,"<br/>"); //换行符替换
            routeArranges.scheduleTime = input.val();
            routeArranges.scheduleContent = textareaValue;
            schedules.push(routeArranges);
        })
        param.schedules = schedules;
        $.ajax({
            type : "POST",
            contentType : 'application/json;charset=utf-8',
            url : "../../routeController/publishRoute",
            dataType : "json",
            data : JSON.stringify(param),
            success  : function(data){
            	if(data.result=='success'){
            		alert(data.msg);
                    document.getElementById("release_form").submit(); //成功后页面跳转
            	}
            }
        });
    });    
})