var testid = {
    baseUrl: "/back/testid/",
    id:"id",
    type:"post"
};
if(getParams(testid.id)!=null&&getParams(testid.id)!=""){
    testid.baseUrl+=getParams(testid.id);
    testid.type="put";
    $.get(testid.baseUrl, null, function (data) {
        setFromValues2(data.result);
    });
}
layui.use('form', function(){
    var form = layui.form;
    //监听提交
    form.on('submit(edit)', function(data){
        $.ajax({
            url: testid.baseUrl,
            type: testid.type,
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