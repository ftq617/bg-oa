<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/12
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的简历-X</title>
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
        <a href="">简历</a>
        <a>
          <cite>我的简历</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form" action="">
            <input type="hidden" name="" id="id">
            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input id="name" type="text" name="text" lay-verify="text" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">期望工资</label>
                <div class="layui-input-inline">
                    <input id="salary" type="number" name="salary" lay-verify="text" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-inline">
                        <input id="phone" type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-inline">
                        <input id="email" type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-inline">
                        <input type="hidden" id="sex">
                        <input type="radio" name="sex" value="1" title="男" >
                        <input type="radio" name="sex" value="2" title="女">
                    </div>
                <div class="layui-inline">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-inline">
                        <input id="age" type="number" name="number" lay-verify="number" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">专业</label>
                <div class="layui-input-inline">
                    <input id="major" type="text" name="text" lay-verify="text" placeholder="请输入专业" autocomplete="off" class="layui-input">
                </div>
                <label class="layui-form-label">学历</label>
                <div class="layui-input-inline">
                    <input id="educationValue" type="hidden"/>
                    <select id="education" name="education">
                        <option value="1">小学</option>
                        <option value="2">初中</option>
                        <option value="3">高中</option>
                        <option value="4">本科</option>
                        <option value="5">研究生</option>
                        <option value="6">博士</option>
                        <option value="7">博士后</option>
                        <option value="8">院士</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">自我介绍</label>
                <div class="layui-input-block">
                    <textarea id="introduce" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>
        </form>
        <fieldset class="layui-elem-field site-demo-button">
            <div>
                <a onclick="addResume()" class="layui-btn layui-btn-normal">添加</a>
                <a onclick="updateResume()" class="layui-btn layui-btn-warm">修改</a>
                <a onclick="deleteResume()" class="layui-btn layui-btn-danger">删除</a>
            </div>
        </fieldset>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        getResume()
    })
    function getResume() {
        $.get("/my_resume",function (data) {
            if (data.status==200){
                var res=data.data;
                $("#salary").val(res.salary/100)
                $("#id").val(res.id)
                $("#name").val(res.name)
                $("#phone").val(res.phone)
                $("#age").val(res.age)
                $("#email").val(res.email)
                $("#major").val(res.major)
                $("#introduce").val(res.introduce)
                $("#sex").val(res.sex)
                if(res.sex==1){
                    $("input[name='sex']:first").prop("checked",true)
                }else {
                    $("input[name='sex']:last").prop("checked",true)
                }
                $("#educationValue").val(res.education)
                $("#education").children().each(function () {
                    if ($(this).val()==res.education) {
                        $(this).prop("selected","true")
                    }
                })
                layui.use('form',function(){
                    var form = layui.form;
                    form.render();
                });
            } else {
                layer.msg(data.msg, {icon: 3});
            }
        })
    }
    function addResume() {
        if ($("#name").val()==''||$("#salary").val()==''||$("#phone").val()==''||$("#age").val()==''||$("#email").val()==''||$("#major").val()==''||$("#sex").val()==''||$("#educationValue").val()=='') {
            layer.msg('不能有空内容', {icon: 5});
            return
        }
        $.post("/add_resume",
            {"name":$("#name").val(),"salary":$("#salary").val(),"phone":$("#phone").val(),"age":$("#age").val(),"email":$("#email").val(),"major":$("#major").val(),"sex": $("#sex").val(),"education":$("#educationValue").val() },
            function (data) {
                if (data.status==200){
                    layer.msg('添加成功', {icon: 1});
                    getResume()
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            })
    }
    function updateResume() {
        if ($("#name").val()==''||$("#salary").val()==''||$("#phone").val()==''||$("#age").val()==''||$("#email").val()==''||$("#major").val()==''||$("#sex").val()==''||$("#educationValue").val()=='') {
            layer.msg('不能有空内容', {icon: 5});
            return
        }
        $.post("/update_resume",
            {"id":$("#id").val(),"salary":$("#salary").val(),"name":$("#name").val(),"phone":$("#phone").val(),"age":$("#age").val(),"email":$("#email").val(),"major":$("#major").val(),"sex": $("#sex").val(),"education":$("#educationValue").val(),"introduce":$("#introduce").val() },
            function (data) {
                if (data.status==200){
                    layer.msg('修改成功', {icon: 1});
                    getResume()
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            })
    }
    function deleteResume() {
        $.get("/delete_resume",
            function (data) {
                if (data.status==200){
                    layer.msg('删除', {icon: 1});
                    getResume()
                } else {
                    layer.msg(data.msg, {icon: 5});
                }
            })
    }
    layui.use('form',function(){
        var form = layui.form;
        form.on('radio', function(data){
            alert(data.value)
            $("#sex").val(data.value)
        });
        form.on('select', function(data){
            $("#educationValue").val(data.value)
        });
    });
</script>
</body>
</html>
