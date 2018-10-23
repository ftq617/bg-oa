<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>BLUE GOD</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/lib/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">员工</a>
        <a>
          <cite>薪资</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <div class="layui-col-md8">
            <div class="layui-row">
                <form class="layui-form layui-col-md6 x-so">
                    <input id="id" type="hidden">
                    <input id="year" type="text" name="year"  placeholder="请输入年" autocomplete="off" class="layui-input">
                    <input id="month" type="text" name="month"  placeholder="请输入月" autocomplete="off" class="layui-input">
                    <a onclick="getClock()" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></a>
                </form>
            </div>
        </div>
    </div>
    <div class="layui-row">
        <div >
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">基本工资</label>
                        <div class="layui-input-inline">
                            <input readonly type="number" id="basic" lay-verify="number" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">时间</label>
                        <div class="layui-input-inline">
                            <input readonly type="text" id="start_time"  autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">奖惩</label>
                        <div class="layui-input-inline">
                            <input readonly id="reApun" type="number"  lay-verify="number" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">五险一金</label>
                        <div class="layui-input-inline">
                            <input readonly id="social" type="number" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">是否有异议</label>
                        <div class="layui-input-inline">
                            <a onclick="yiyichuli()" id="isObject" tst="1" class="layui-btn layui-btn-normal">提出异议</a>
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">是否处理</label>
                        <div class="layui-input-inline">
                            <input readonly id="isHandle" type="text" name="phone" lay-verify="text" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <label class="layui-form-label">总金额</label>
                        <div class="layui-input-inline">
                            <input readonly id="total" type="number" name="phone" lay-verify="number" autocomplete="off" class="layui-input">
                        </div>
                    </div>
                </div>
            </form>
            <table class="layui-table" id="trains-list" lay-filter="trains-list">
            </table>
        </div>
    </div>
</div>
<div style="display: none;" id="Objection" class="change-pas-box">
    <form class="layui-form" action="">
        <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label" style="width: 120px">原因：</label>
            <div class="layui-input-block" >
                <textarea readonly id='reason' placeholder="请输入原因" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label" style="width: 120px">提出时间：</label>
            <div class="layui-input-block" >
                <input readonly id="time" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label" style="width: 120px">处理金额：</label>
            <div class="layui-input-block" >
                <input readonly id="moneyT" style="width: 200px" type="number" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">处理时间</label>
                <div class="layui-input-block">
                    <input readonly id="reissTime" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">是否处理</label>
                <div class="layui-input-block">
                    <input readonly id="isH" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
                </div>
            </div>
        </div>
    </form>
</div>
<script src="/js/data.js"></script>
<script id="createTime" type="text/html">
    {{#
    var date = new Date();
    date.setTime(d.createTime);
    return date.Format("yyyy-MM-dd hh:mm:ss");
    }}
</script>

<script>

    $(document).ready(function(){

        var myDate = new Date();
        getSalary(myDate.getFullYear(),myDate.getMonth())
    });

    function yiyichuli(id) {
        if ( $("#isObject").attr("tst")==1) {
            layer.open({
                type: 1,
                area: ['400px', '500px'],
                title: '提出异议',
                content: "<div style='padding: 10px;font-size: 20px'> 请输入异议薪资的原因：<br><textarea id='reson' placeholder=\"请输入原因\" class=\"layui-textarea\"></textarea></div>",
                btn: ['确定', '取消'],
                btn1: function (index) {
                    $.post("/users/objection/add", {"id": $("#id").val(),"reason": $("#reson").val()}, function (data) {
                        if (data.status == 200) {
                            layer.msg('提出异议成功', {icon: 1});
                            var myDate = new Date();
                            getSalary(myDate.getFullYear(), myDate.getMonth())
                        } else {
                            layer.msg(data.msg, {icon: 1});
                        }
                    })
                    layer.close(index)
                },
                btn2: function () {
                }
            })
        }else{
            $.get("/users/objection/"+$("#id").val(),function (data) {
                if (data.status==200){
                    var obj=data.data
                    $("#reason").val(obj.reason)
                    var date = new Date();
                    date.setTime(obj.time);
                    $("#time").val(date.Format("yyyy-MM-dd hh:mm:ss"));
                    $("#moneyT").val(obj.money/100)
                    if (obj.reissTime!=null) {
                        var date = new Date();
                        date.setTime(obj.reissTime);
                        $("#reissTime").val(date.Format("yyyy-MM-dd hh:mm:ss"));
                    }
                    if(obj.isHandle==1) {
                        $("#isH").val("同意处理")
                    }else if (obj.isHandle==2){
                        $("#isH").val("不同意处理")
                    } else {
                        $("#isH").val("未处理")
                    }
                    layer.open({
                        type: 1,
                        area: ['400px', '500px'],
                        title: '查看异议',
                        content:$("#Objection"),
                        btn: ['确定'],
                        btn1: function (index) {
                            layer.close(index)
                        }
                    })
                }else {
                    layer.msg(data.msg, {icon: 1});
                }
            });
        }
    }

    function getClock(){
        getSalary($("#year").val(),$("#month").val())
    }

    function getSalary(year,month) {
        $.post("/users/salary/list",{"year":year,"month":month},function (data) {
            if (data.status==200){
                var obj=data.data;
                $("#id").val(obj.id)
                $("#basic").val(obj.basic/100);
                var date = new Date();
                date.setTime(obj.overtime);
                $("#start_time").val(date.Format("yyyy-MM-dd hh:mm:ss"));
                $("#reApun").val(obj.reApun/100);
                $("#social").val(obj.social/100);
                $("#isHandle").val(obj.social==1?"未处理":"处理");
                $("#total").val((obj.basic+obj.reApun-obj.social)/100);
                if (obj.isObjection==-1) {
                    $("#isObject").text("提出异议");
                    $("#isObject").attr("tst",1)
                }else {
                    $("#isObject").text("查看异议处理");
                    $("#isObject").attr("tst",2)
                }
                getTrainsAll(obj.awardPenaltieList)
            }
        })
    }
    function getTrainsAll(dat){
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                elem: '#trains-list'
                ,cols: [[
                    {field:'reason', width:200, title: '原因'}
                    ,{field:'startTime', title: '开始时间', width: 200, minWidth: 100,sort:true,templet:'#startTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ,{field:'money',width:200,  title: '奖惩金额',templet:"#money"}
                ]],
                data:dat,
                page:true
            });
        });
    }
</script>
<script type="text/html" id="user_name">
    <i class="layui-icon x-show icon_bg" status="true" onclick="check_dep(this)"  value="{{d.id}}" dName="{{d.userName}}">&#xe623;</i>{{d.userName}}
</script>
<script id="startTime" type="text/html">
    {{#
    var date = new Date();
    date.setTime(d.startTime);
    return date.Format("yyyy-MM-dd hh:mm:ss");
    }}
</script>
<script id="money" type="text/html">
{{d.money/100}}
</script>
<script type="text/html" id="u_add">
    <a class="layui-btn layui-btn-xs" lay-event="add">生成工资单</a>
</script>
</body>

</html>