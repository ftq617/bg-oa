<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/11
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>user</title>
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
<body>
<form class="layui-form" action="">

    <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="layui-input-block">
            <input readonly id="number" type="text" name="username" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">手机号：</label>
            <div class="layui-input-inline">
                <input readonly id="phone" type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">姓名：</label>
            <div class="layui-input-inline">
                <input readonly id="name" type="text" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">性别：</label>
            <div class="layui-input-inline">
                <input readonly id="sex" type="text" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">部门：</label>
            <div class="layui-input-inline">
                <input readonly id="dep_name" type="text" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">职位：</label>
            <div class="layui-input-inline">
                <input readonly id="job_name" type="text" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">创建时间：</label>
            <div class="layui-input-inline">
                <input readonly id="createTime" type="date" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">加入时间：</label>
            <div class="layui-input-inline">
                <input readonly id="joinTime" type="date" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-inline">
        <label class="layui-form-label">修改密码:</label>
        <div class="layui-input-inline">
            <input id="passeord" type="password" name="password" lay-verify="password" autocomplete="off" class="layui-input">
        </div>
    </div>
    <a id="xiu" class="layui-btn layui-btn-lg">修改密码</a>
</form>
<script>
    function getTime(data){
        var now = new Date(data);
        var day = ("0" + now.getDate()).slice(-2);
        var month = ("0" + (now.getMonth() + 1)).slice(-2);
        var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
        return today
    }
    $(document).ready(function () {
        $.get("/getUserInfo",function (data) {
            var obj=data.data
            $("#number").val(obj.number)
            $("#name").val(obj.userName)
            $("#phone").val(obj.phone)
            $("#sex").val(obj.sex==1?"男":"女")
            $("#dep_name").val(obj.departmentName)
            $("#job_name").val(obj.jobName)
            $("#createTime").val(getTime(obj.createTime))
            $("#joinTime").val(getTime(obj.joinTime))
        })
        $("#xiu").click(function () {
            var password=$("#passeord").val()
            if (password==null||password==""){
                layer.msg('密码不能为空', {icon: 5});
                return
            }else if (password.length<6){
                layer.msg('密码不能小于六位', {icon: 5});
                return
            }
            $.post("/updateUserInfo",{password:p},function (data) {
                if (data.status==200){
                    layer.msg('修改密码成功', {icon: 1});
                }else {
                    layer.msg(data.msg, {icon: 1});
                }
            });
        });
    })
</script>
</body>
</html>
