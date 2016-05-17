
$(function() {
    $.fn.raty.defaults.path = '../images';
    var id = {};
    /*服务评价*/
    $('#service-assess').raty({
        cancel    : false,
        target    : '#service-hint',
        targetType: 'number',
        targetKeep: true
    });
    /*线路评价*/
    $('#route-assess').raty({
        cancel    : false,
        target    : '#route-hint',
        targetType: 'number',
        targetKeep: true
    });
    /*点击模态框的时候，动态生成多个景点评价*/
    $("[data-target='#evaluate']").on('click',function(){
        var routeInfo = {},//路线、服务评分，评价描述
            viewArr = [],  //景点数组
            viewGradeArr = [],  //景点分数
            view_grade= []; //景点Id以及分数
        var reserveId = $(this).attr('data-reserveId');
        $('#ping-reserveId').val(reserveId);
        $.ajax({
            type : "GET",
            url : "../viewController/findViewByReserveId",
            data : {reserveId:reserveId},
            dataType : "json",
            success : function(data){
                $.each(data,function(i,item){
                    /*创建装星星的容器*/
                    var viewAssessWrapper = $('<div class="form-group" id="form'+i+'"></div>');
                    var div = $('<div class="col-lg-12"></div>').appendTo(viewAssessWrapper);
                    var ViewName = $('<label class="col-sm-4 control-label"></label>').appendTo(div);
                    var starWrapper = $('<div class="col-sm-8"></div>').appendTo(div);
                    var star = $('<div class="assess" id="div' + i +'"></div>').appendTo(starWrapper);
                    var viewGrade = $('<input type="hidden" id="input'+ i + '">').appendTo(star);
                    var viewId = $('<input type="hidden" id="viewId'+ i + '">').appendTo(star);
                    $('#viewAssess').append(viewAssessWrapper);
                    /*设置label值*/
                    ViewName.text(data[i].viewName);
                    viewId.val(data[i].viewId);
                    /*对不同景点添加星星评价*/
                    $('#div'+i).raty({
                        cancel    : false,
                        target    : '#input'+ i,
                        targetType: 'number',
                        targetKeep: true
                    });
                    $('[data-identify="remove"]').on('click',function(){
                        viewAssessWrapper.remove();
                    });
                    //获取路线中的相关景点ID
                    var viewId = data[i].viewId;
                    viewArr.push(viewId);
                });
               
            }
        });
        $('#assessBtn').on('click',function(){
            //获取相应景点的分数
            var viewGrades = $('#viewAssess input[name="score"]');
            $.each(viewGrades,function(index,item){
                var param ={};//景点Id以及分数
                var viewGrade = $(this).val();  
                param.viewGrade= viewGrade; //景点分数
                param.viewId = viewArr[index];   //景点ID
                view_grade.push(param);
            });
            routeInfo.view = view_grade;  //传给后台的景点信息对象封装
            var assess = {};
            var inputs = $('[data-group="input"]');  
            $.each(inputs,function(index,item){
                assess[$(this).attr('name')] = $(this).val();    //景点服务评价、路线评价以及评价信息填写
            });
            routeInfo.assess = assess; 
            routeInfo.reserveId = $('#ping-reserveId').val();  //订单ID
            $.ajax({
                type : "POST",
                dataType : "json",
                contentType : 'application/json;charset=utf-8',
                url : "../reserveController/evaluate",
                data : JSON.stringify(routeInfo),
                success : function(data){
                   if(data.result){
                       alert(data.msg);
                       document.getElementById("assess_form").submit();  //页面跳转
                   }
                }
            });
          
        });
    });
    
    /*取消预约模态框 传id*/
    $("[data-target='#cancel']").on("click", function(){
        $('#reserveID-cancel').val( $(this).attr("data-reserveId"));
        $('#starTime-cancel').val( $(this).parent().siblings('[data-num="starTime"]').text()); 
    });
    /*删除订单模态框 传id*/   
    $("[data-target='#delete']").on("click", function(){
       $('#reserveID-delete').val( $(this).attr("data-reserveId"));
    });
    /*确认预约模态框 传id*/
    $("[data-target='#yue']").on("click", function(){
       $('#reserveID-yue').val( $(this).attr("data-reserveId"));
    });
    /*拒绝接单模态框 传id*/
    $("[data-target='#jujue']").on("click", function(){
       $('#reserveID-jujue').val( $(this).attr("data-reserveId"));
       $('#starTime-jujue').val( $(this).attr("data-start"));
    });
    /*失信记录模态框 传id*/
    $("[data-target='#shixin']").on("click", function(){
       $('#reserveID-shixin').val( $(this).attr("data-reserveId"));
       $('#starTime-shixin').val( $(this).attr("data-start"));
    });

    /*失信记录模态框 传id*/
    $("[data-target='#shixin']").on("click", function(){
       $('#reserveID-shixin').val( $(this).attr("data-reserveId"));
       $('#starTime-shixin').val( $(this).attr("data-start"));
    });
    /*预约详情模态框*/
    $('[data-identify="orderDetail"]').on('click',function(){
        var reserveId = $(this).attr("data-reserveId");
        location.href="../content/user/orderDetail.jsp?reserveId="+reserveId;
    });

    //拒绝理由模态框验证
    $('#jujue').on('shown.bs.modal', function (e) {
        $('#refuse').focus();
        $('#refuseInfoBtn').attr('disabled',true);
        refuse();
        //文本域失去焦点的时候
        $('#refuse').on('keyup',function(){
            refuse();
        });
    })

    function refuse(){
        var textarea = $('#refuse').val().trim();
        var length = textarea.length;
        if(length >= 200 || length == 0){
            $('#refuseInfo').html("文本域的长度应为1-200哦！").css('color','#CA1F1F');
            $('#refuseInfoBtn').attr('disabled',true);
        }else{
            $('#refuseInfo').html("");
            $('#refuseInfoBtn').attr('disabled',false);
        }
    }

    window.$my = {
        button: $("#reservebtn"),
        sum: 0
    }

    // 验证
    $(".form-horizontal").on("click","img[alt][title]",function(){
        var value = $(this).parent().siblings('input').val();
        if(value){
            $(this).parent().siblings('p').text("已评价");
        }
        check();
    })

    $('textarea').on("keyup",function(){
        var value = $(this).val();
        var tip = $(this).siblings('p');
        if(value.length===0){
            tip.text("评价不能为空").css('color','#CA1F1F');
        }else if(value.length>100){
            tip.text("评价不能为空").css('color','#CA1F1F');
        }else{
            tip.text("已评价");
        }
        check();
    });

    function check(){
        var p = $("p.tip");
        p.text(function(index,html){
            if(html==="已评价"){
                $my.sum++;
            }
        })

        if($my.sum === p.length){
            $my.button.removeAttr("disabled");
            $my.sum = 0;
        }else{
            $my.button.attr("disabled",true); 
            $my.sum = 0;
        }
    }

});