var linkman = {
    baseUrl: "/back/linkman/",
    id:"id",
    type:"post"
};
if(getParams(linkman.id)!=null&&getParams(linkman.id)!=""){
    linkman.baseUrl+=getParams(linkman.id);
    linkman.type="put";
    $.get(linkman.baseUrl, null, function (data) {
        setFromValues2(data.result);
    });
}
layui.use(['form','laydate'], function(){
    var form = layui.form;
    laydate = layui.laydate;
                            laydate.render({
    elem:"#optime"
    ,type: 'datetime'
    });

            laydate.render({
    elem:"#born"
    });

                    //监听提交
    form.on('submit(edit)', function(data){
        $.ajax({
            url: linkman.baseUrl,
            type: linkman.type,
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