var generate = {
    baseUrl: "/back/generate",
    entity: "generate",
    tableId: "generateTable",
    toolbarId: "generateToolbar",
    unique: "id",
    order: "asc",
    currentItem: {}
};
generate.columns = function () {
    return [{
        checkbox: true
    }, {
        field: 'id',
        title: '主键ID'
    }, {
        field: 'tabname',
        title: '表名'
    }, {
        field: 'tabdesc',
        title: '描述'
    }, {
        field: 'generatedir',
        title: '代码生成路径'
    }, {
        field: 'generated',
        title: '程序生成标记'
    }, {
        field: 'optime',
        title: '操作时间'
    }];
};
generate.queryParams = function (params) {
    if (!params)
        return {
                id: $("#id").val(),
                tabname: $("#tabname").val(),
                tabdesc: $("#tabdesc").val(),
                generatedir: $("#generatedir").val(),
                generated: $("#generated").val(),
                begintime: $("#begintime").val(),
                endtime: $("#endtime").val()
                };
    var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit, //页面大小
                offset: params.offset, //页码
                id: $("#id").val(),
                tabname: $("#tabname").val(),
                generatedir: $("#generatedir").val(),
                tabdesc: $("#tabdesc").val(),
                begintime: $("#begintime").val(),
                endtime: $("#endtime").val()
                 };
    return temp;
};

generate.init = function () {

generate.table = $('#' + generate.tableId).bootstrapTable({
        url: generate.baseUrl + '/page', //请求后台的URL（*）
        method: 'get', //请求方式（*）
        toolbar: '#' + generate.toolbarId, //工具按钮用哪个容器
        striped: true, //是否显示行间隔色
        cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
        pagination: true, //是否显示分页（*）
        sortable: false, //是否启用排序
        sortOrder: generate.order, //排序方式
        queryParams: generate.queryParams,//传递参数（*）
        sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
        pageNumber: 1, //初始化加载第一页，默认第一页
        pageSize: 10, //每页的记录行数（*）
        pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
        search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
        strictSearch: false,
        showColumns: false, //是否显示所有的列
        showRefresh: true, //是否显示刷新按钮
        minimumCountColumns: 2, //最少允许的列数
        clickToSelect: true, //是否启用点击选中行
        uniqueId: generate.unique, //每一行的唯一标识，一般为主键列
        showToggle: true, //是否显示详细视图和列表视图的切换按钮
        cardView: false, //是否显示详细视图
        detailView: false, //是否显示父子表
        columns: generate.columns()
    });
};
generate.select = function (layerTips) {
    var rows = generate.table.bootstrapTable('getSelections');
    if (rows.length == 1) {
        generate.currentItem = rows[0];
        return true;
    } else {
        layerTips.msg("请选中其中一行");
        return false;
    }
};

layui.use(['form', 'layedit', 'laydate'], function () {
    generate.init();

    var editIndex;
    var layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
        layer = layui.layer, //获取当前窗口的layer对象
        form = layui.form(),
        layedit = layui.layedit,
        laydate = layui.laydate;
    var addBoxIndex = -1;
    //初始化页面上面的按钮事件
    $('#btn_query').on('click', function () {
      generate.table.bootstrapTable('refresh', generate.queryParams());
    });

    $('#btn_add').on('click', function () {
        if (addBoxIndex != -1)
            return;
        //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
        $.get(generate.entity + '/edit', null, function (form) {
            addBoxIndex = layer.open({
                type: 1,
                title: '添加信息',
                content: form,
                btn: ['保存', '取消'],
                shade: false,
                offset: ['20px', '20%'],
                area: ['600px', '400px'],
                maxmin: true,
                yes: function (index) {
                    layedit.sync(editIndex);
                    //触发表单的提交事件
                    $('form.layui-form').find('button[lay-filter=edit]').click();
                },
                full: function (elem) {
                    var win = window.top === window.self ? window : parent.window;
                    $(win).on('resize', function () {
                        var $this = $(this);
                        elem.width($this.width()).height($this.height()).css({
                            top: 0,
                            left: 0
                        });
                        elem.children('div.layui-layer-content').height($this.height() - 95);
                    });
                },
                success: function (layero, index) {
                    var form = layui.form();
                    editIndex = layedit.build('' +
                        '');
                    form.render('select');
                    form.render();
                    form.on('submit(edit)', function (data) {
                        $.ajax({
                            url: generate.baseUrl,
                            type: 'post',
                            data: data.field,
                            dataType: "json",
                            success: function () {
                                layerTips.msg('保存成功');
                                layerTips.close(index);
                                location.reload();
                            }

                        });
                        //这里可以写ajax方法提交表单
                        return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                    });
                    //console.log(layero, index);
                },
                end: function () {
                    addBoxIndex = -1;
                }
            });
        });
    });
    $('#btn_edit').on('click', function () {
        if (generate.select(layerTips)) {
            var id = generate.currentItem.id;
            $.get(generate.baseUrl + '/' + id, null, function (data) {
                var result = data.result;
                $.get(generate.entity+'/edit', null, function (form) {
                    layer.open({
                        type: 1,
                        title: '编辑信息',
                        content: form,
                        btn: ['保存', '取消'],
                        shade: false,
                        offset: ['20px', '20%'],
                        area: ['600px', '400px'],
                        maxmin: true,
                        yes: function (index) {
                            //触发表单的提交事件
                            layedit.sync(editIndex);
                            $('form.layui-form').find('button[lay-filter=edit]').click();
                        },
                        full: function (elem) {
                            var win = window.top === window.self ? window : parent.window;
                            $(win).on('resize', function () {
                                var $this = $(this);
                                elem.width($this.width()).height($this.height()).css({
                                    top: 0,
                                    left: 0
                                });
                                elem.children('div.layui-layer-content').height($this.height() - 95);
                            });
                        },
                        success: function (layero, index) {
                            var form = layui.form();
                            setFromValues(layero, result);
                            layero.find("select[name='generated']").val(result.generated);
                            form.render();
                            form.on('submit(edit)', function (data) {
                                $.ajax({
                                    url: generate.baseUrl + "/" + result.id,
                                    type: 'put',
                                    data: data.field,
                                    dataType: "json",
                                    success: function () {
                                        layerTips.msg('更新成功');
                                        layerTips.close(index);
                                        location.reload();
                                    }

                                });
                                //这里可以写ajax方法提交表单
                                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                            });
                        }
                    });
                });
            });
        }
    });
    $('#btn_del').on('click', function () {
        if (generate.select(layerTips)) {
            var id = generate.currentItem.id;
            layer.confirm('确定删除数据吗？', null, function (index) {
                $.ajax({
                    url: generate.baseUrl + "/" + id,
                    type: "DELETE",
                    success: function (data) {
                        if (data.rel == true) {
                            layerTips.msg("移除成功！");
                            location.reload();
                        } else {
                            layerTips.msg("移除失败！")
                            location.reload();
                        }
                    }
                });
                layer.close(index);
            });
        }
    });

    $('#btn_qry').on('click', function () {
        if (generate.select(layerTips)) {
            var id = generate.currentItem.tabname;
            var generated=generate.currentItem.generated;
                $.get("/admin/generate/column_list/"+id, null, function (form) {
                    addBoxIndex = layer.open({
                        type: 1,
                        title: '校验表字段信息',
                        content: form,
                        shade: false,
                        offset: ['20px', '20%'],
                        area: ['600px', '400px'],
                        maxmin: true,
                        yes: function (index) {
                        },
                        full: function (elem) {
                            var win = window.top === window.self ? window : parent.window;
                            $(win).on('resize', function () {
                                var $this = $(this);
                                elem.width($this.width()).height($this.height()).css({
                                    top: 0,
                                    left: 0
                                });
                                elem.children('div.layui-layer-content').height($this.height() - 95);
                            });
                        },
                        success: function (layero, index) {
                            tablecolunms.init(id,generated);
                        },
                        end: function () {
                            tablecolunms.currentItem = {};
                        }
                    });
                    layer.full(addBoxIndex);//实现全屏
                });

        }
    });
});