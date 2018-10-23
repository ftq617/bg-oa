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
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="add()"><i class="layui-icon"></i>添加</button>
    </xblock>
    <table class="layui-table" id="trains-list" lay-filter="trains-list">
    </table>
</div>
<div style="display: none;" id="addTrains" class="change-pas-box">
    <form class="layui-form" action="">
        <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label" style="width: 120px">请输入招聘标题：</label>
            <div class="layui-input-block" >
                <input id="title" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入招聘标题F" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label" style="width: 120px">请输入工资：</label>
            <div class="layui-input-block" >
                <input id="salary" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label" style="width: 120px">请输入需要人数：</label>
            <div class="layui-input-block" >
                <input id="pNumber" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label">部门选择</label>
            <div class="layui-input-inline">
                <input id="deptId" type="hidden"/>
                <select id="dept" name="dept">
                    <option value="">请选择部门</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
            <div class="layui-inline">
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-inline">
                    <input type="date" name="date" id="end_date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">招聘说明</label>
                <div class="layui-input-block">
                    <textarea id="describe" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
        </div>
        <div id="checkType" class="layui-form-item" style="display: none">
            <label class="layui-form-label">是否启用</label>
            <div class="layui-input-block">
                <input type="hidden" id="check">
                <input type="radio" name="status" value="1" title="是" >
                <input type="radio" name="status" value="2" title="否">
            </div>
        </div>
    </form>
</div>
<script>
    function getTime(data){
        var now = new Date(data);
        var day = ("0" + now.getDate()).slice(-2);
        var month = ("0" + (now.getMonth() + 1)).slice(-2);
        var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
        return today
    }
    getRecruit()
    function getRecruit(status){
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                elem: '#trains-list'
                ,url:'/admin/recruit/list'
                ,method:"post"
                ,where:{"status":status}
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {type:'checkbox'},
                    {field:'id', width:80, title: 'ID', sort: true}
                    ,{field:'title',width:150,  title: '招聘标题'}
                    ,{field:'department',width:150,  title: '招聘部门',templet:"#dep_name"}
                    ,{field:'user', width:150, title: '负责人',templet:"#user_name"}
                    ,{field:'describe',width:200,  title: '招聘说明'}
                    ,{field:'salary', width:100, title: '岗位工资',templet:"#money"}
                    ,{field:'pNumber', width:120, title: '需要人数'}
                    ,{field:'hNumber', width:120, title: '已招人数'}
                    ,{field:'endTime', title: '结束时间', width: 200, minWidth: 100,sort:true,templet:'#endTime'}
                    ,{field:'status',width:100, title: '状态',templet:"#status"}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]],
                page:true
            });

            //监听行工具事件
            table.on('tool(trains-list)', function(obj){
                var data = obj.data;
                if(obj.event === 'del'){
                    layer.confirm('真的要删除行么', function(index){
                        deletes(data.id);
                        obj.del();
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    $("#title").val(data.title);
                    getDepartment(data.department.id)
                    $("#salary").val(data.salary);
                    $("#pNumber").val(data.pNumber)
                    $("#end_date").val(getTime(data.endTime));
                    $("#describe").val(data.describe)
                    $("#checkType").css("display","block")
                    if(data.status==1){
                        $("input[name='status']:first").attr("checked",true)
                    }else {
                        $("input[name='status']:last").attr("checked",true)
                    }
                    $("#check").val(data.status)
                    layui.use('form',function(){
                        var form = layui.form;
                        form.render("radio");
                        form.render("select");
                    });
                    layer.open({
                        type: 1,
                        area: ['500px', '600px'],
                        title: '招聘编辑',
                        content: $("#addTrains"),
                        btn:['修改','取消'],
                        btn1: function(index) {
                            if ($("#title").val()==''||$("#deptId").val()==''||$("#salary").val()==''||$("#end_date").val()==''||$("#describe").val()==''||$("#pNumber").val()==''){
                                layer.msg("数据不能有为空", {icon: 4});
                                return
                            }
                            $.post("/admin/recruit/update",{"id":data.id,"title":$("#title").val(),"department.id":$("#deptId").val(),"salary":$("#salary").val(),"endTime":$("#end_date").val(),"describe":$("#describe").val(),"pNumber":$("#pNumber").val(),"status":$("#check").val()},function (objs) {
                                if (objs.status==200){
                                    layer.msg('修改成功', {icon: 1});
                                }else{
                                    layer.msg(objs.msg, {icon: 3});
                                }
                                layer.close(index);
                            });
                            $("#checkType").css("display","none")
                        },
                        btn2:function() {
                            $("#checkType").css("display","none")
                        }
                    })
                }
            });
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


    function delAll (argument) {
        alert("再做吧")
    }
    function add() {
        $("#title").val("");
        $("#salary").val("");
        $("#pNumber").val("")
        $("#end_date").val(getTime(""));
        $("#describe").val("")
        getDepartment()
        layer.open({
            type: 1,
            area: ['600px', '600px'],
            title: '添加招聘',
            content: $("#addTrains"),
            btn:['增加','取消'],
            btn1: function(index) {
                $.post("/admin/recruit/add",{"title":$("#title").val(),"department.id":$("#deptId").val(),"salary":$("#salary").val(),"endTime":$("#end_date").val(),"describe":$("#describe").val(),"pNumber":$("#pNumber").val()},function (objs) {
                    if (objs.status===200){
                        layer.msg('增加成功', {icon: 1,zIndex:layer.zIndex+100});
                        getRecruit()
                    }else{
                        layer.msg(objs.msg, {icon: 3,zIndex:layer.zIndex+100});
                    }
                });
                layer.close(index);
            },
            btn2:function() {
            }
        })
    }
    layui.use('form',function(){
        var form = layui.form;
        form.on('select', function(data){
            if (data.elem.id==="dept"){
                $("#deptId").val(data.value)
            }
        });
    });
    function getDepartment(dep_id) {
        $("#deptId").val(dep_id)
        $.post("/admin/department/list","",function (data) {
            var html='<option value="">请选择部门</option>';
            if (data.code == 0) {
                var list = data.data;
                for (var i = 0; i < list.length; i++) {
                    if (dep_id==list[i].id) {
                        html += "<option selected value='" + list[i].id + "'>" + list[i].dName + "</option>"
                    }else {
                        html += "<option value='" + list[i].id + "'>" + list[i].dName + "</option>"
                    }
                }
            }
            $("#dept").html(html);
            layui.use('form',function(){
                var form = layui.form;
                form.render("select");
            });
        });
    }
    function deletes(data) {
        //捉到所有被选中的，发异步进行删除
        $.post("/admin/recruit/delete",'ids='+data,function (data) {
            if (data.status==200){
                layer.msg('成功删除id为'+data+"招聘", {icon: 1});
                getRecruit()
            } else if (data.status==201){
                layer.msg(data.msg, {icon: 1});
                getRecruit()
            }
            else {
                layer.msg(data.msg, {icon: 5});
            }
        });
    }
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
<script id="status" type="text/html">
    {{# if(d.status===1){ }}
    <div style="color: rgba(65,114,255,0.64);">启用</div>
    {{# }else{ }}
    <div style="color: red;">关闭</div>
    {{# } }}
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
</body>

</html>
