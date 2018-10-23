<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/11
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/data.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">培训</a>
        <a>
          <cite>培训管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input type="text" name="username"  placeholder="请输入用户名" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <div class="layui-row">
        <div class="layui-col-md3">
            <table class="layui-table layui-form" id="department-list" lay-filter="department-list"></table>
        </div>
        <div class="layui-col-md9">
            <table class="layui-table" id="trains-list" lay-filter="trains-list"></table>
        </div>
    </div>
</div>
<script>
    function getTime(data){
        var now = new Date(data);
        var day = ("0" + now.getDate()).slice(-2);
        var month = ("0" + (now.getMonth() + 1)).slice(-2);
        var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
        return today
    }
    layui.use('table', function(){
        var table = layui.table;
        getRecruit(null)
        table.render({
            elem: '#department-list'
            ,url:'/department/list'
            ,cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
            ,cols: [[
                {field:'id', width:50, title: 'ID', sort: true}
                ,{field:'dName', width:150,  title: '部门名称',templet:"#dpt_name"}
                ,{field:'uName',width:100,  title: '领导名'}
            ]],
            width:340,
        });

    });
    function getRecruit(depid){
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                elem: '#trains-list'
                ,url:'/recruit/list'
                ,method:"post"
                ,where:{"department.id":depid}
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'title',width:150,  title: '招聘标题'}
                    ,{field:'department',width:130,  title: '招聘部门',templet:"#dep_name"}
                    ,{field:'user', width:130, title: '负责人',templet:"#user_name"}
                    ,{field:'describe',width:200,  title: '招聘说明'}
                    ,{field:'salary', width:80, title: '岗位工资',templet:"#money"}
                    ,{field:'pNumber', width:100, title: '需要人数'}
                    ,{field:'hNumber', width:100, title: '已招人数'}
                    ,{field:'endTime', title: '结束时间', width: 200, minWidth: 100,sort:true,templet:'#endTime'}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:100}
                ]],
                page:true
            });

            //监听行工具事件
            table.on('tool(trains-list)', function(obj){
                var data = obj.data;
                if(obj.event === 'edit'){
                    layer.confirm('真的要投递么', function(index){
                        $.post("/interview/add",
                            {"rctId":data.id},
                            function x(objs) {
                                if(objs.status==200){
                                    layer.msg('投递成功，请静待我们的回复', {icon: 1});
                                }else {
                                    layer.msg(objs.msg, {icon: 3});
                                }
                        });
                        layer.close(index);
                    });
                }
            });
        });
    }
    function check_dep(node){
        var t=$(node).attr("status");
        var id=$(node).attr("value");
        var n=$(node).attr("dName");
        if (t=="true"){
            getRecruit(id)
            check_all()
            $(node).parents("tr").css("background","rgba(127,255,250,0.64)")
            $(node).parent().html(" <i class='layui-icon x-show icon_bg' status='false' onclick='check_dep(this)'  value='"+id+"' dName='"+n+"'>&#xe625;</i>"+n)
        } else {
            $(node).parents("tr").css("background","")
            $(node).parent().html(" <i class='layui-icon x-show icon_bg' status='true' onclick='check_dep(this)'  value='"+id+"' dName='"+n+"'>&#xe623;</i>"+n)
        }
    }
    function check_all(){
        var obj=$(".icon_bg");
        obj.each(function(i){
            if ($(this).attr("status")=="false"){
                var id=$(this).attr("value");
                var n=$(this).attr("dName");
                $(this).parents("tr").css("background","")
                $(this).parent().html(" <i class='layui-icon x-show icon_bg' status='true' onclick='check_dep(this)'  value='"+id+"' dName='"+n+"'>&#xe623;</i>"+n)
            }
        });
    }
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">投递简历</a>
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
<script id="endTime" type="text/html">
    {{#
    var date = new Date();
    date.setTime(d.endTime);
    return date.Format("yyyy-MM-dd hh:mm:ss");
    }}
</script>
<script id="money" type="text/html">
    {{d.salary/100}}
</script>
<script id="dep_name" type="text/html">
    {{d.department.dName}}
</script>
<script id="user_name" type="text/html">
    {{d.user.userName}}
</script>
<script type="text/html" id="dpt_name">
    <i class="layui-icon x-show icon_bg" status="true" onclick="check_dep(this)"  value="{{d.id}}" dName="{{d.dName}}">&#xe623;</i>{{d.dName}}
</script>
</body>

</html>
