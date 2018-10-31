var custaddr = {
    baseUrl: "/back/custaddr/",
    id:"id",
    type:"post"
};
if(getParams(custaddr.id)!=null&&getParams(custaddr.id)!=""){
    custaddr.baseUrl+=getParams(custaddr.id);
    custaddr.type="put";
    $.get(custaddr.baseUrl, null, function (data) {
        setFromValues2(data.result);
    });
}
layui.use('form', function(){
    var form = layui.form;
    //监听提交
    form.on('submit(edit)', function(data){
        $.ajax({
            url: custaddr.baseUrl,
            type: custaddr.type,
            data: data.field,
            dataType: "json",
            success: function () {
                //弹出loading
                var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
                setTimeout(function(){
                    top.layer.close(index);
                    top.layer.msg("提交成功！");
                    layer.closeAll("iframe");
                    //刷新父页面
                    parent.location.reload();
                },1000);
            }
        });
        return false;
    });
});