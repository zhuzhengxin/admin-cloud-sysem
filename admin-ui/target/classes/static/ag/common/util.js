/**
 * 取得URL里面指定参数值
 * @param key
 * @returns {*}
 */
function getParams(key){
    var url = location.search.replace(/^\?/,'').split('&');
    var paramsObj = {};
    for(var i = 0, iLen = url.length; i < iLen; i++){
        var param = url[i].split('=');
        paramsObj[param[0]] = param[1];    }
    if(key){
        return paramsObj[key] || '';
    }
    return paramsObj;
}

/**
 * 设置表单值
 * @param el
 * @param data
 */
function setFromValues(el, data) {
    for (var p in data) {
        el.find(":input[name='" + p + "']").val(data[p]);
    }
}
/**
 * 设置表单值
 * @param el
 * @param data
 */
function setFromValues2(data) {
    for (var p in data) {
        $(":input[name='" + p + "']").val(data[p]);
    }
}
var treeViewHelper = {};
/**
 * tree view遍历节点值
 * @param node
 * @returns {Array}
 */
treeViewHelper.getChildrenNodeIdArr = function ( node ){
    var ts = [];
    if(node.nodes){
        for(x in node.nodes){
            ts.push(node.nodes[x].nodeId)
            if(node.nodes[x].nodes){
                var getNodeDieDai = this.getChildrenNodeIdArr(node.nodes[x]);
                for(j in getNodeDieDai){
                    ts.push(getNodeDieDai[j]);
                }
            }
        }
    }else{
        ts.push(node.nodeId);
    }
    return ts;
}
/**
 * 获取treeview的父级节点
 * @param treeId
 * @param node
 * @returns {Array}
 */
treeViewHelper.getParentIdArr = function (treeId,node){
    var ts = [];
    var parent  =   $('#'+treeId).treeview('getParent', node);
    while(parent.id&&parent.id!=0){
        ts.push(parent);
        parent = $('#'+treeId).treeview('getParent', parent);
    }
    return ts;
}
var tip = {
    alert: function (info, iconIndex) {
        parent.layer.msg(info, {
            icon: iconIndex
        });
    }
} ;

function loginPage(){

    layui.use(['form', 'layedit'], function () {

        var layerTips = parent.layer === undefined ? layui.layer : parent.layer, //获取父窗口的layer对象
            layer = layui.layer, //获取当前窗口的layer对象
            form = layui.form(),
            layedit = layui.layedit
        $("#btn_add").on('click',function () {
            //本表单通过ajax加载 --以模板的形式，当然你也可以直接写在页面上读取
            $.get('login', null, function (form) {
                addBoxIndex = layer.open({
                    type: 1,
                    title: '登录系统',
                    content: form,
                    btn: ['登录', '取消'],
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
                        form.render();
                        form.on('submit(edit)', function (data) {
                            $.ajax({
                                url: user.baseUrl,
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
                    }
                });
            });
        });;
    });



}
$(function(){
    // 设置jQuery Ajax全局的参数
    $.ajaxSetup({
        type: "POST",
        error: function(jqXHR, textStatus, errorThrown){
            switch (jqXHR.status){
                case(500):
                    tip.alert("服务器系统内部错误");
                    break;
                case(401):
                    tip.alert("未登录");
                    loginPage();
                    break;
                case(403):
                    tip.alert("无权限执行此操作");
                    break;
                case(408):
                    tip.alert("请求超时");
                    break;
                default:
                    tip.alert("未知错误");
            }
        }
    });
});