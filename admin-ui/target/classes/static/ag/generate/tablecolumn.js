var tablecolunms = {
    baseUrl: "/back/generate",
    entity: "generate",
    tableId: "colunmsTable",
    toolbarId: "columnsToolbar",
    unique: "columnName",
    order: "asc",
    currentItem: {}
};
tablecolunms.columns = function () {
    return [/*{
        checkbox: true,
        checked : true//设置选中
    }, */{
        field: 'columnName',
        title: '字段名称',
        width:'50px'
    }, {
        field: 'columnComment',
        title: '字段备注',
        width:'80px',
        events:operateComment,
        formatter : function(value, row, index) {
            if (row.columnComment=='') {
                return "<span  class='label label-danger'>不能为空,点击编辑</span>";
            } else {
                return value;
            }
        }
    }, {
        field: 'dataType',
        title: '字段类型',
        width:'50px'
    }, {
        field: 'characterMaximumLength',
        title: '字段大小',
        width:'30px'
    }, {
        field: 'isNullable',
        title: '是否为空',
        width:'30px'
    }, {
        field: 'columnKey',
        title: '主键标识',
        width:'50px'
    }, {
        field: 'queryFlag',
        title: '作为查询条件',
        visible:false
    }, {
        field: 'queryKind',
        title: '查询条件类型',
        visible:false
    }, {
        field: 'queryResutFlag',
        title: '查询结果展示',
        visible:false
    }, {
        field: 'editFlag',
        title: '编辑页面展示',
        visible:false
    }, {
        field: 'tableName',
        title: '表名',
        visible:false
    }, {
        field: 'operate',
        title: '操作',
        align:'center',
        width:'300px',
        events: operateEvents,
        formatter:operateFormatter
    }];
};
window.operateEvents = {
    'click .columndiv': function (e, value, row, index) {

        if($(this).attr("class")=='columndiv'){
            $(this).removeClass("columndiv");
            $(this).addClass("columndiv1");
            if($(this).attr("id")==row.columnName+"1") {
                $("#" + row.columnName + "2").css("display", "block");
                row.queryFlag="Y";
                $("#"+row.columnName+"2").html('<select class="columndiv5" id='+row.columnName+'5   name="queryKind" style="border: 0; background: transparent;"><option selected value="=">等于</option><option value="between">区间</option><option value="like">模糊</option></select>');
                $("#"+row.columnName+"5").change(function() {row.queryKind=$("#"+row.columnName+"5").find("option:selected").val();});
                row.queryKind="=";
            }else if($(this).attr("id")==row.columnName+"3"){
                row.queryResultFlag="Y";
            }else if($(this).attr("id")==row.columnName+"4"){
                row.editFlag="Y";
            }

        }else{
            $(this).addClass("columndiv");
            $(this).removeClass("columndiv1");
            if($(this).attr("id")==row.columnName+"1") {
                $("#" + row.columnName + "2").css("display", "none");
                row.queryFlag="N";
                $("#"+row.columnName+"2").html('<select class="columndiv5" id='+row.columnName+'5   name="queryKind" style="border: 0; background: transparent;"><option selected value="=">等于</option><option value="between">区间</option><option value="like">模糊</option></select>');
                $("#"+row.columnName+"5").change(function() {row.queryKind=$("#"+row.columnName+"5").find("option:selected").val();});
                row.queryKind="";
            }else if($(this).attr("id")==row.columnName+"3"){
                row.queryResultFlag="N";
            }else if($(this).attr("id")==row.columnName+"4"){
                row.editFlag="N";
            }
        }
    },
    'click .columndiv1': function (e, value, row, index) {

        if($(this).attr("class")=='columndiv'){
            $(this).removeClass("columndiv");
            $(this).addClass("columndiv1");
            if($(this).attr("id")==row.columnName+"1") {
                $("#" + row.columnName + "2").css("display", "block");
                row.queryFlag="Y";
                $("#"+row.columnName+"2").html('<select class="columndiv5" id='+row.columnName+'5   name="queryKind" style="border: 0; background: transparent;"><option selected value="=">等于</option><option value="between">区间</option><option value="like">模糊</option></select>');
                $("#"+row.columnName+"5").change(function() {row.queryKind=$("#"+row.columnName+"5").find("option:selected").val();});
                row.queryKind="=";
            }else if($(this).attr("id")==row.columnName+"3"){
                row.queryResultFlag="Y";
            }else if($(this).attr("id")==row.columnName+"4"){
                row.editFlag="Y";
            }
        }else{
            $(this).addClass("columndiv");
            $(this).removeClass("columndiv1");
            if($(this).attr("id")==row.columnName+"1") {
                $("#" + row.columnName + "2").css("display", "none");
                row.queryFlag="N";
                $("#"+row.columnName+"2").html('<select class="columndiv5" id='+row.columnName+'5   name="queryKind" style="border: 0; background: transparent;"><option selected value="=">等于</option><option value="between">区间</option><option value="like">模糊</option></select>');
                $("#"+row.columnName+"5").change(function() {row.queryKind=$("#"+row.columnName+"5").find("option:selected").val();});
                row.queryKind="";
            }else if($(this).attr("id")==row.columnName+"3"){
                row.queryResultFlag="N";
            }else if($(this).attr("id")==row.columnName+"4"){
                row.editFlag="N";
            }
        }
    },

    'change .columndiv5': function (e, value, row, index) {
        row.queryKind=$("#"+row.columnName+"5").find("option:selected").val();

    }
};
window.operateComment={
    'click .label': function (e, value, row,index) {
           var json_row = encodeURI(JSON.stringify(row));
           if(typeof $("#"+row.columnName)!= "undefined") {
               $("#"+row.columnName).val($("#"+row.columnName).val());
           }
               $(this).html('<input id="'+ row.columnName + '"  type="text" onblur="columnOnblur(' + '\'' + json_row + '\')" style="border: 0px;height: 30px;width: 100px;" />');
               $(this).removeClass("label");
               $("#"+row.columnName).focus();

    }
}
function  columnOnblur(row) {
    row=JSON.parse(decodeURI(row));
    row.columnComment=$("#"+row.columnName).val();
    //row.tableName=$("#tableName1").val();
    //alert(JSON.stringify(row));
     if($("#"+row.columnName).val()==""){
         $("#"+row.columnName).parent().addClass("label label-danger");
         $("#"+row.columnName).parent().html("不能为空,点击编辑");
     }else{
             $.ajax({
                 url: tablecolunms.baseUrl + "/updateTableColumnComment" ,
                 type: "put",
                 data:JSON.stringify(row),
                 dataType:"json",
                 contentType:"application/json;charset=utf-8",
                 success: function (data) {
                     if (data.rel == true) {
                         $("#"+row.columnName).parent().html($("#"+row.columnName).val());
                     }
                 }
             });
     }

}

function  operateFormatter(value, row, index){
        var  flag="1";
        var  displayflag="block";
        if(row.columnKey=='PRI'){
            flag="";
            displayflag="none";
        }
        var button= [
            '<div  class="columndiv'+flag+'" style="cursor: pointer;" id='+row.columnName+'1 >&nbsp;作为查询条件&nbsp;</div>',
            '<div  class="columndiv2"  style="display: '+displayflag+';" id='+row.columnName+'2 ><select class="columndiv5" id='+row.columnName+'5   name="queryKind" style="border: 0; background: transparent;"><option selected value="=">等于</option><option value="between">区间</option><option value="like">模糊</option></select></div>',
            '<div  class="columndiv'+flag+'" style="cursor: pointer;" id='+row.columnName+'3 >&nbsp;查询结果展示&nbsp;</div>',
            '<div  class="columndiv'+flag+'" style="cursor: pointer;" id='+row.columnName+'4 >&nbsp;编辑页面展示&nbsp;</div>'
        ].join('');
        return button;
}


tablecolunms.queryParams = function (params) {
    if (!params)
        return {
            columnName: $("#columnName").val(),
            columnComment: $("#columnComment").val(),
            dataType: $("#dataType").val(),
            characterMaximumLength: $("#characterMaximumLength").val(),
            isNullable: $("#isNullable").val(),
            columnKey: $("#columnKey").val(),
            queryFlag: $("#queryFlag").val(),
            queryKind: $("#queryKind").val(),
            queryResutFlag: $("#queryResutFlag").val(),
            editFlag: $("#editFlag").val()
        };
    var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
        limit: params.limit, //页面大小
        offset: params.offset, //页码
        columnName: $("#columnName").val(),
        columnComment: $("#columnComment").val(),
        dataType: $("#dataType").val(),
        characterMaximumLength: $("#characterMaximumLength").val(),
        isNullable: $("#isNullable").val(),
        columnKey: $("#columnKey").val(),
        queryFlag: $("#queryFlag").val(),
        queryKind: $("#queryKind").val(),
        queryResutFlag: $("#queryResutFlag").val(),
        editFlag: $("#editFlag").val()
    };
    return temp;
};

tablecolunms.generatecode=function () {
    $('#btn_gen').on('click', function () {
        var rows = tablecolunms.table.bootstrapTable('getData');
        //alert(JSON.stringify(rows));
        /*for (var i=0;i<rows.length;i++){
            var new_rows=JSON.stringify(rows[i]);
            new_rows.queryFlag=
        }*/
        //return;

        $.ajax({
            url: tablecolunms.baseUrl + "/generatecode" ,
            type: "POST",
            data:JSON.stringify(rows),
            dataType:"json",
            contentType:"application/json;charset=utf-8",
            success: function (data) {
                $("#result").css("display","block");
                if (data.rel == true) {
                    $("#result").html('<span  class="label label-danger">自动生成代码成功，请到应用里面查看对应源码，重新启动对应应用</span><font color="#006400">\n'+eval(data.result).join("")+'</font>');
                } else {
                    $("#result").html('<span  class="label label-danger">自动生成代码失败，请查原因</span><font color="red">\n'+eval(data.result).join("")+'</font>');
                }
            }
        });

    });
}
tablecolunms.init = function (tableName,generated) {
    $("#generated").val(generated);
    $("#tableName1").val(tableName);
    tablecolunms.table = $('#' + tablecolunms.tableId).bootstrapTable({
        url: tablecolunms.baseUrl + '/getTableFilds/'+tableName ,//请求后台的URL（*）
        method: 'get', //请求方式（*）
        toolbar: '#' + tablecolunms.toolbarId, //工具按钮用哪个容器
        striped: true, //是否显示行间隔色
        cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: false, //是否显示分页（*）
        sortable: false, //是否启用排序
        sortOrder: tablecolunms.order, //排序方式
        queryParams: tablecolunms.queryParams,//传递参数（*）
        sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1, //初始化加载第一页，默认第一页
        pageSize: 10, //每页的记录行数（*）
        pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
        search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch: false,
        showColumns: false, //是否显示所有的列
        showRefresh: false, //是否显示刷新按钮
        minimumCountColumns: 2, //最少允许的列数
        clickToSelect: true, //是否启用点击选中行
        uniqueId: tablecolunms.unique, //每一行的唯一标识，一般为主键列
        showToggle: false, //是否显示详细视图和列表视图的切换按钮
        cardView: false, //是否显示详细视图
        detailView: false, //是否显示父子表
        columns: tablecolunms.columns()
    });
    tablecolunms.generatecode();
};

