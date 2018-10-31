var navbar;
layui.use(['element', 'layer','navbar'],function(){
    var $ = layui.jquery,layer = layui.layer,element=layui.element(),navbar = layui.navbar();
});
function onMouseOverColor(obj,thisobj) {
    if (obj == 'tab_div_2') {
        $("#div-blank-2").css("display", "block");
        $("#div-blank-1").css("display", "none");
        $("#tab_div_2").css("color", "#4E5465");
        $("#tab_div_1").css("color", "#D6D6D6");
    } else if (obj == 'tab_div_1') {
        $("#div-blank-2").css("display", "none");
        $("#div-blank-1").css("display", "block");
        $("#tab_div_2").css("color", "#D6D6D6");
        $("#tab_div_1").css("color", "#4E5465");
    } else if(obj=='third_div'){
        $(thisobj).css("background-color","#D6D6D6");
    }else if (obj == 'four_div') {
        $("#div-blank-five-div").css("display", "none");
        $("#div-blank-four-div").css("display", "block");
        $("#five_div").css("color", "#D6D6D6");
        $("#four_div").css("color", "#4E5465");
    }else if (obj == 'five_div') {
        $("#div-blank-four-div").css("display", "none");
        $("#div-blank-five-div").css("display", "block");
        $("#four_div").css("color", "#D6D6D6");
        $("#five_div").css("color", "#4E5465");
    }else if (obj == 'six_div') {
        $("#container1").css("display", "block");
        $("#container2").css("display", "none");
        $("#container3").css("display", "none");
        $("#six_div").css("color", "#4E5465");
        $("#seven_div").css("color", "#D6D6D6");
        $("#eight_div").css("color", "#D6D6D6");
        chart_container1();
    }else if (obj == 'seven_div') {
        $("#container1").css("display", "none");
        $("#container2").css("display", "block");
        $("#container3").css("display", "none");
        $("#six_div").css("color", "#D6D6D6");
        $("#seven_div").css("color", "#4E5465");
        $("#eight_div").css("color", "#D6D6D6");
        chart_container2();
    }else if (obj == 'eight_div') {
        $("#container1").css("display", "none");
        $("#container2").css("display", "none");
        $("#container3").css("display", "block");
        $("#six_div").css("color", "#D6D6D6");
        $("#seven_div").css("color", "#D6D6D6");
        $("#eight_div").css("color", "#4E5465");
        chart_container3();
    }
}
function onMouseOutColor(obj,thisobj) {
    if(obj=='third_div'){
        $(thisobj).css("background-color","#eee");
    }
}

$(function () {
    //$("#blank").html('<div class="div-blank-1" ><div style="text-align: center;padding-top: 80px;"><i class="layui-icon" style="font-size: 35px; ">&#xe63d;</i></div></div>');
    $.get('/back/menu/getShortCutList', null, function (data) {
        //alert(JSON.stringify(allMenu));
        //只给两个页面的快捷方式
        if(data.length>0){
            var html="";
            var  tabLength=Math.ceil(parseInt(data.length)/8);
            for(var menu in data){
                var marginLength="";
                marginLength=(parseInt(menu%4)+1)*9;
                var id=parseInt((parseInt(menu)+1)/8)+1;
                var title=data[menu].title;
                if (title.length>5)
                    title=title.substring(0,5)+"..";
                var tabUrl='{"href":"'+data[menu].href+'","title":"'+title+'"}';
                tabUrl = encodeURI(tabUrl);
                if (menu==0)
                html+='<div class="div-blank-1" id="div-blank-1">';
                else if ((parseInt(menu)+1)%8==1&&parseInt(tabLength)>1&&menu>0)
                html+='<div class="div-blank-1" id="div-blank-'+id+'" style="display: none;">';

                html+='<div class="div-blank-1-1"  ><div class="div-blank-1-1-1" style="margin-left:'+marginLength+'px;" onmouseover=onMouseOverColor("third_div",this) onmouseleave=onMouseOutColor("third_div",this)  onclick=tabAdd("'+tabUrl+'") ><i class="layui-icon" style="font-size: 40px; color: white;">&#xe614;</i></div><div class="div-blank-1-1-2" style="margin-left:'+marginLength+'px;"><a href="#" style="font-size: 10px;">'+title+'</a></div></div>';
                if (parseInt(tabLength)==1&&(parseInt(menu)+1)==data.length)
                    html+='</div>';
                else if (parseInt((parseInt(menu)+1))%8==0&&parseInt(tabLength)>1&&menu>0&&Math.ceil((parseInt(menu)+1)/8)<parseInt(tabLength))
                    html+='</div>';
                else if (parseInt((parseInt(menu)+1))==data.length&&parseInt(tabLength)>1)
                    html+='</div>';
                //alert(html);
            }
            //alert(html);
            var tabHtml="";
            if (tabLength>1){
                tabHtml+='<div class="div-tab-1-1-1-1" ><i  onmouseover=onMouseOutTabColor("1",this)  class="fa fa-circle" style="color:#4E5465; "></i></div>';
                for (var i=tabLength;i>1;i--){
                    tabHtml+='<div class="div-tab-1-1-1-2" ><i  onmouseover=onMouseOutTabColor("'+i+'",this)  class="fa fa-circle" style="color:#D6D6D6; "></i></div>';
            }
                $("#div-tab-1-1-1").html(tabHtml);
            }
            //alert(tabHtml);

        }else {
            tabUrl='{"href":"/admin/menu","title":"菜单管理"}';
            tabUrl = encodeURI(tabUrl);
            html='<div  class="div-blank-1" ><div  class="div-blank-1-1"><div class="div-blank-1-1-1" style="margin-left:9px;" onmouseover=onMouseOverColor("third_div",this) onmouseleave=onMouseOutColor("third_div",this)  onclick=tabAdd("'+tabUrl+'") ><i class="layui-icon" style="font-size: 35px; ">&#xe608;</i></div> <div class="div-blank-1-1-2" style="margin-left:9px;color: gray;"><a href="#">添加快捷键</a></div></div></div></div>';
        }

        $("#blank").html(html);

    });

    var  div_array = [ "first_div", "second_div","four_div","five_div","six_div","seven_div","eight_div"];
    $.each(div_array,function (i,val) {
        $("#"+val).mouseover(function () {
            onMouseOverColor(val,$("#"+val));
        });
    });
    $.each($(".div-blank-1-1-1"),function (i,val) {
        $(this).mouseover(function () {
            onMouseOverColor("third_div",this);
        });
        $(this).mouseleave(function () {
            onMouseOutColor("third_div",this);
        });
    });
    /*$.each($(".div-blank-1-1-1"),function (i,val) {
        $(this).click(function () {
            var menu='{"href":"/admin/user","title":"用户管理"}';
            parent.tab.tabAdd(JSON.parse(menu));
        });
    });*/
    chart_container1();
    run();


});
function  onMouseOutTabColor(i,obj) {

    $.each($(obj).parent().prevAll(),function (i,val) {
        $(this).children("i").css("color", "#D6D6D6");
    });
    $.each($(obj).parent().nextAll(),function (i,val) {
        $(this).children("i").css("color", "#D6D6D6");
    });
    $.each($("#blank"),function (i,val) {
        $(this).children(".div-blank-1").css("display", "none");
    });
    $("#div-blank-"+i).css("display", "block");
    $(obj).css("color", "#4E5465");
}
function tabAdd(obj){
    //alert(obj);
    parent.tab.tabAdd(JSON.parse(decodeURI(obj)));
}
function chart_container1(){
    Highcharts.chart('container1', {
        title: {
            text: 'Monthly Average Temperature',
            x: -20 //center
        },
        subtitle: {
            text: 'Source: WorldClimate.com',
            x: -20
        },
        xAxis: {
            categories: ['一月', '二月', '三月', '四月', '五月', '六月','七月', '八月', '九月', '十月', '十一月', '十二月']
        },
        yAxis: {
            title: {
                text: 'Temperature (°C)'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: '°C'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Tokyo',
            data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }, {
            name: 'New York',
            data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
        }, {
            name: 'Berlin',
            data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
        }, {
            name: 'London',
            data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
        }]
    });

}

function chart_container2(){
    $('#container2').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Browser market shares at a specific website, 2014'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: [
                ['Firefox',   45.0],
                ['IE',       26.8],
                {
                    name: 'Chrome',
                    y: 12.8,
                    sliced: true,
                    selected: true
                },
                ['Safari',    8.5],
                ['Opera',     6.2],
                ['Others',   0.7]
            ]
        }]
    });
}
function showValues() {
    $('#R0-value').html(chart.options.chart.options3d.alpha);
    $('#R1-value').html(chart.options.chart.options3d.beta);
}
function chart_container3(){
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container3',
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        },
        title: {
            text: 'Chart rotation demo'
        },
        subtitle: {
            text: 'Test options by dragging the sliders below'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        series: [{
            data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
        }]
    });


    // Activate the sliders
    $('#R0').on('change', function(){
        chart.options.chart.options3d.alpha = this.value;
        showValues();
        chart.redraw(false);
    });
    $('#R1').on('change', function(){
        chart.options.chart.options3d.beta = this.value;
        showValues();
        chart.redraw(false);
    });


    showValues();
}

function run(){
    var bar = $(".bar");
    $.each(bar,function (i,val) {
        var width=
        $(this).css("width",parseInt($(this).attr("title"))*3.35+"px");
        if (parseInt($(this).attr("title"))>80){
            $(this).css("background","red");
        }
        $(this).parent().parent().prev().children(".div-blank-4-1").text(parseInt($(this).attr("title"))+"%");
    })
}
