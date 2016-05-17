$(function(){

    /*单价计算*/
    var totalAdult,  //成年人总价
        totalChild;  //儿童总价
    var price = $('#tourInforPrice').val();   //得到单价
    var childPrice = $("#childPrice").val(price*0.5); //儿童的单价是成年人的一半
    var adultPrice = $("#adultPrice").val(price);   
    var totalAdultPrice = 0;    //初始化成年人总价
    var totalChildPrice = 0;  //初始的儿童总价
    //成年人下拉框的变化事件
    $("#adult").on("change",function(){
        totalAdult = parseInt($(this).val());  //得到成年人个数
        $("#adultContent").val($(this).val());   //将个数添加到页面中
        totalAdultPrice = totalAdult * parseFloat(adultPrice.val());    //成年人总价计算
        $("#totalPrice").val(parseFloat(totalAdultPrice)+parseFloat(totalChildPrice));
        $("#shouldPayPrice").val(parseFloat(totalAdultPrice)+parseFloat(totalChildPrice));
    });  
    //儿童下拉框的变化事件
    $("#child").on("change",function(){ 
        totalChild = parseFloat($(this).val());   //得到儿童个数
        $("#childContent").val($(this).val());    //将个数添加到页面中
         totalChildPrice = totalChild * parseFloat(childPrice.val());  //儿童总价计算
        $("#totalPrice").val(parseFloat(totalAdultPrice)+parseFloat(totalChildPrice));
        $("#shouldPayPrice").val(parseFloat(totalAdultPrice)+parseFloat(totalChildPrice));
    });

    $("#totalPrice").val(parseFloat(totalAdultPrice)+parseFloat(totalChildPrice));
    $("#shouldPayPrice").val(parseFloat(totalAdultPrice)+parseFloat(totalChildPrice));

    var i = 0;
    var opt;

    //出游人信息填写
    $('#addtourstorsNum').on('click',function(){
        i++;
        var tour_wrapper = $('#tour_wrapper');
        var tour_wrapperItem=$('<div id="tour' + i +'" data-tour="information"></div>').appendTo(tour_wrapper);   //出游人信息框处理

        //分隔线
        var separWrapper = $('<div class="col-md-12 separate_border"></div>');
        var separ = $('<div class="col-md-6 text-center"></div>').appendTo(separWrapper);
        var span = $('<span class="col-md-12"></span>').appendTo(separ);
        separWrapper.appendTo(tour_wrapperItem);

        //姓名框添加
        var nameWrapper = $('<div class="col-md-12"></div>');
        var nameFormControl = $('<div class="form-group"></div>').appendTo(nameWrapper);
        var nameLabel = $('<label class="col-lg-2 control-label ">姓名：</label>').appendTo(nameFormControl);
        var nameInputWrapper = $('<div class="col-lg-4"></div>').appendTo(nameFormControl);
        var nameInput = $('<input type="text" class="form-control inputStyle" placeholder="请输入姓名" name="touristName" />').appendTo(nameInputWrapper);
        var p = $('<p class="info">请输入姓名</p>').appendTo(nameInputWrapper);
        var delWrapper = $('<div class="col-lg-4"></div>').appendTo(nameFormControl);
        var del = $('<span class="glyphicon glyphicon-remove remove_style"></span>').appendTo(delWrapper);
        nameWrapper.appendTo(tour_wrapperItem);

        //手机框添加
        var phoneWrapper = $('<div class="col-md-12"></div>');
        var phoneFormControl = $('<div class="form-group"></div>').appendTo(phoneWrapper);
        var phoneLabel = $('<label class="col-lg-2 control-label">手机：</label>').appendTo(phoneFormControl);
        var phoneInputWrapper = $('<div class="col-lg-4"></div>').appendTo(phoneFormControl);;
        var phoneInput = $('<input type="text" class="form-control inputStyle" placeholder="请输入手机号" name="touristTele"/>').appendTo(phoneInputWrapper);
        var p = $('<p class="info">请输入手机号</p>').appendTo(phoneInputWrapper);
        phoneWrapper.appendTo(tour_wrapperItem);

        //身份证号框
        var IDWrapper = $('<div class="col-md-12"></div>');
        var IDFormControl = $('<div class="form-group"></div>').appendTo(IDWrapper);
        var IDLabel = $('<label class="col-lg-2 control-label">身份证号：</label>').appendTo(IDFormControl);
        var IDInputWrapper = $('<div class="col-lg-4"></div>').appendTo(IDFormControl);
        var IDInput = $('<input type="text" class="form-control inputStyle" placeholder="请输入身份证号" name="touristIdNum"/>').appendTo(IDInputWrapper);
        var p = $(' <p class="info">请输入身份证号</p>').appendTo(IDInputWrapper);

        var svaeBtnWrapper = $('<div class="col-lg-2"></div>').appendTo(IDFormControl);
        var saveBtn = $('<input type="button" value="保存出游人" class="btn btn-info" data-btn="save">').appendTo(svaeBtnWrapper);
        var selectBtnWrapper = $('<div class="col-lg-2"></div>').appendTo(IDFormControl);
        var selectBtn = $('<input type="button" value="选择出游人" class="btn btn-info" data-btn="select">').appendTo(selectBtnWrapper);
        IDWrapper.appendTo(tour_wrapperItem);
        
        del.on('click',function(){   //点击删除图标的时候，将相应的出游人信息框进行删除
            tour_wrapperItem.remove();
        });
    });
    
    //保存出游人按钮
    $('#tour_wrapper').on('click','[data-btn="save"]',function(){
        var id = $(this).closest('[data-tour="information"]').attr('id');
        tourInfoAjax('#'+id+'');
        console.info('#'+id+'');
    });


    //选择出游人按钮
    $('#tour_wrapper').on('click','[data-btn="select"]',function(){
        opt = $(this).closest('[data-tour="information"]').find('input[type="text"]');
        $('#tourInfoModal').modal('show');
    });

    //选择模态框确认按钮
    $('#consure').on('click',function(){
        tourPersonInfo();
    });

    function tourPersonInfo(){
        var inputCheck = $('#tourInfoModal').find('input:checked');
        $.each(opt,function(){
            if($(this).attr('name') == 'touristName'){
                $(this).val(inputCheck.attr('value'));
            }else if($(this).attr('name') == 'touristTele'){
                $(this).val(inputCheck.attr('data-tele'));
            }else{
                $(this).val(inputCheck.attr('data-id'));
            }
        });
    }

    //模态框关闭事件
    $('#tourInfoModal').on('hidden.bs.modal', function (e) {
        $('#searchTourPerson').remove();
    });

    //出游人信息保存Ajax
    function tourInfoAjax(id){
        var param = {};
        var inputs = $(id).find('input[type="text"]');
        $.each(inputs,function(){
            param[$(this).attr("name")] = $(this).val();
        });
        $.ajax({
            type : "POST",
            url : "../reserveController/saveTourist",
            data : JSON.stringify(param),
            contentType : 'application/json;charset=utf-8',
            dataType : "json",
            success : function(data){
                if(data.result){
                   $('#tourInfoSaveModal').modal('show');
                   $('#tourInfoSaveModal').find('.modal-body').text(data.msg);
                }
            },
            error : function(){
                $('#tourInfoSaveModal').modal('show');
                $('#tourInfoSaveModal').find('.modal-body').text("保存失败!");
            }
        });
    }

    //模态框出现
    $('#tourInfoModal').on('shown.bs.modal', function (e) {
        selectTourPerson();
    });

    //选择出游人
    function  selectTourPerson(){
        var param = {};
        $.ajax({
            type : "GET",
            url : "../reserveController/getTourist",
            dataType : "json",
            success : function(data){
                //模态框生成出游人列表
                var model = $('#tourInfoModal').find('.modal-body');
                var table = $('<table id="searchTourPerson"></table>').appendTo(model);
                var col = 5;
                var lines = Math.ceil(data.length/col);   //共有多少行
                for(var j=0;j<lines;j++){     //每行创建一个tr以及相应个数的td
                    var tr = $('<tr></tr>').appendTo(table);    
                    for(var k=0;k<col;k++){    //每行最多5列，创建td
                        if(data[k+j*col] != undefined){   //当后台传入的数据存在的时候，执行下面操作
                            var td = $('<td></td>').appendTo(tr);
                            var label = $('<label></label>').appendTo(td);
                            var input = $('<input type="radio" name="tourPerson" value="" data-tele="" data-id="" />').appendTo(label);
                            input.val(data[k+j*col].touristName);   //将touristName赋值给input框
                            var span = $('<span></span>').appendTo(label);
                            span.text(data[k+j*col].touristName);    //将touristName赋值给span
                            input.attr("data-tele",data[k+j*col].touristTele);
                            input.attr("data-id",data[k+j*col].touristIdNum);
                        }         
                    }
                }
            }
        });
    }

    //日期框
    $('#goTime').datebox({
        width : 186,
        height : 34,
        editable : false,
        formatter : function(date){
            var y = date.getFullYear();
            var m = date.getMonth()+1;
            var d = date.getDate();
            return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);
        },
        panelWidth : 186,
        parser : function(s){
            if (!s) return new Date();
            var ss = (s.split('-'));
            var y = parseInt(ss[0],10);
            var m = parseInt(ss[1],10);
            var d = parseInt(ss[2],10);
            if (!isNaN(y) && !isNaN(m) && !isNaN(d)){
                return new Date(y,m-1,d);
            } else {
                return new Date();
            }
        }
    });

    /*只能够预定到从今天开始到今天之后的30天之内*/
    $('#goTime').datebox('calendar').calendar({
        validator: function(date){
            var now = new Date();
            var startTime = new Date(now.getFullYear(), now.getMonth(), now.getDate());
            var endTime = new Date(now.getFullYear(), now.getMonth(), now.getDate()+30);
            return startTime<=date && date<=endTime;
        }
    });
    
    //订单提交验证
    $('#submitBtn').on('click',function(){
        var hasNum,  //人数是否选择
            time;  //日期是否填写
        var goTime = $('#goTime').datebox('getValue'); // 获取日期输入框的值;
        var adult = $('#adult').val(); //获取成年人选择框的值
        var child = $('#child').val(); //获取小孩选择框的值
        if(adult == "0" && child == "0"){  //成年人选择框与小孩选择框验证
            hasNum = false;
        }else{
            hasNum = true;
        }
        if(goTime == ""){  //日期选择框验证
            time = false;
        }else{
            time = true;
        }
        if(hasNum && time){   //日期选择框验证与出游人数框同时验证
            document.getElementById('OrderDeterminationForm').submit();  //成功提交表单
        }else{
            $('#validMessage').modal('show').css('margin-top','80px');
        }
    });

    //出游人表单验证
    window.$my = {
        nameInput: $("#name"),
        telInput: $("#tel"),
        idInput: $("#id_card")
    }

    $(".div_distance").on("keyup","input",function(){
        var labelName = $(this).parent('div').siblings('label').text();
        var value = $(this).val();
        if(labelName==="姓名："){
            if(value===''){
                $(this).siblings('p').text("姓名不能为空").css('color','#CA1F1F');
            }else if(!/^[\u4e00-\u9fa5]{2,}$/.test(value)){
                $(this).siblings('p').text("请输入正确的姓名").css('color','#CA1F1F');
            }else{
                $(this).siblings('p').text("格式正确").css('color','transparent');
            }
        }
        if(labelName==="手机："){
            if(value===''){
                $(this).siblings('p').text("手机号不能为空").css('color','#CA1F1F');
            }else if(!/^(13[0-9]|14[0-9]|15[0-9]|18[0-9])\d{8}$/i.test(value)){
                $(this).siblings('p').text("手机格式不正确").css('color','#CA1F1F');
            }else {
                $(this).siblings('p').text("格式正确").css('color','transparent');
            }

        }
        if(labelName==="身份证号："){
            var reg=/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
            if(value===''){
                $(this).siblings('p').text("身份证号不能为空").css('color','#CA1F1F');
            }else if(!reg.test(value)){
                $(this).siblings('p').text("身份证号格式不正确").css('color','#CA1F1F');
            }else {
                $(this).siblings('p').text("格式正确").css('color','transparent');
            }
        }
    })
        
});

 