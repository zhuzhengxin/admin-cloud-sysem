var custaddr = {
    baseUrl: "/back/custaddr",
    entity: "custaddr",
    tableId: "custaddrTable",
    toolbarId: "custaddrbar",
    toolbarId: "custaddrbar",
    pageId: "custaddrpage",
    id:"id",
    filter:"custaddrfilter"
};
layui.use(['form','laydate', 'laypage','layer','jquery', 'table'], function(){
            var form = layui.form,
            laydate = layui.laydate,
            laypage = layui.laypage,
            layer = parent.layer === undefined ? layui.layer : parent.layer,
            $ = layui.jquery,
            table = layui.table;
            //新增按钮
            $('#btn_add').on('click', function () {
                $(window).one("resize",function(){
                    var index = layui.layer.open({
                        type : 2,
                        title : "添加信息",
                        maxmin: false,
                        content : custaddr.entity+"/edit",
                        success: function (layero, index) {
                            setTimeout(function(){
                                layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                                    tips: 3
                                });
                            },500)
                        }
                    })
                    layui.layer.full(index);
                }).resize();

                });
            //表格渲染
            table.render({
                url:custaddr.baseUrl+"/page",
                elem:"#"+custaddr.tableId,
                height:315,
                page:true,
                limits: [10,20,30,40,50],
                loading:true,
                id: custaddr.tableId,
                cols:[[
                    {checkbox:true, LAY_CHECKED: false},
                                        {field: 'id', title: '主键', width: 180,sort:true},
                                        {field: 'name', title: '姓名', width: 180,sort:true},
                                        {field: 'addr', title: '地址', width: 180,sort:true},
                                        {fixed:'right' ,title:'操作',width:160, align:'center', toolbar: "#"+custaddr.toolbarId}
            ]],
            });
            //监听工具条
            table.on('tool('+custaddr.filter+')', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'add'){
               $(window).one("resize",function(){
               var index = layui.layer.open({
               type : 2,
               title : "添加信息",
               maxmin: false,
               content : custaddr.entity+"/edit",
               success: function (layero, index) {
                           setTimeout(function(){
                           layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                           tips: 3
                           });
                        },500)
               }
              })
                        layui.layer.full(index);
              }).resize();
            }else if(layEvent === 'del'){
               layer.confirm('确定删除数据吗？', null, function (index) {
               $.ajax({
                     url: custaddr.baseUrl + "/" + data.id,
                     type: "DELETE",
                     success: function (data) {
                              if (data.rel == true) {
                                  layer.msg("移除成功！");
                                  location.reload();
                               } else {
                                   layer.msg("移除失败！")
                                   location.reload();
                               }
                      }
                  });
                      layer.close(index);
              });
            }else if(layEvent === 'edit'){
                     $(window).one("resize",function(){
                      var index = layui.layer.open({
                                  type : 2,
                                  title : "修改信息",
                                  maxmin: false,
                                  content : custaddr.entity+"/edit?id="+data.id,
                                  success: function (layero, index) {
                                           setTimeout(function(){
                                           layui.layer.tips('点击此处返回列表', '.layui-layer-setwin .layui-layer-close', {
                                           tips: 3
                                           });
                                      },500)
                    }
                })
                      layui.layer.full(index);
            }).resize();
            }
            });
            //分页
            laypage.render({
                elem: custaddr.pageId //分页容器的id
                ,count: 100 //总页数
                ,skin: '#1E9FFF' //自定义选中色值
                ,jump: function(obj, first){
                if(!first){
                  layer.msg('第'+ obj.curr +'页');
                }
            }
            });
            $('#btn_query').on('click', function () {
                table.reload(custaddr.tableId,{
                where:{
                                                                        id: $("#id").val(),
                                                                                                name: $("#name").val(),
                                                                                                addr: $("#addr").val()
                                                        }
            })
    })
});



