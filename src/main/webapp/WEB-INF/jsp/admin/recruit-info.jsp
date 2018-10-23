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
        <a href="">招聘</a>
        <a>
          <cite>招聘详情</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <div class="layui-col-md4">
            <table class="layui-table" id="trains-list" lay-filter="trains-list">
            </table>
        </div>
        <div class="layui-col-md8">
            <table class="layui-table" id="department-list" lay-filter="department-list">
            </table>
        </div>
    </div>
</div>
<div style="display: none;" id="rescme" class="change-pas-box">
    <form class="layui-form" action="">
        <input type="hidden" name="" id="id">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input readonly id="name" type="text" name="text" lay-verify="text" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">期望工资</label>
            <div class="layui-input-inline">
                <input readonly id="salary" type="number" name="salary" lay-verify="text" placeholder="请输入姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input readonly id="phone" type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-inline">
                    <input readonly id="email" type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-inline">
                <input readonly id="sex" type="text" name="text" lay-verify="text" placeholder="请输入专业" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">年龄</label>
                <div class="layui-input-inline">
                    <input readonly id="age" type="number" name="number" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">专业</label>
            <div class="layui-input-inline">
                <input readonly id="major" type="text" name="text" lay-verify="text" placeholder="请输入专业" autocomplete="off" class="layui-input">
            </div>
            <label class="layui-form-label">学历</label>
            <div class="layui-input-inline">
                <input readonly id="education" type="text" name="text" lay-verify="text" placeholder="请输入专业" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">自我介绍</label>
            <div class="layui-input-block">
                <textarea readonly id="introduce" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
        </div>
    </form>
</div>
<div style="display: none;" id="anpai" class="change-pas-box">
    <form class="layui-form" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">面试时间</label>
            <div class="layui-input-inline">
                <input id="time" type="date" name="number" lay-verify="required|number" autocomplete="off" class="layui-input">
            </div>
        </div>
    </form>
</div>
<script>
    var dctId;
    function getTime(data){
        var now = new Date(data);
        var day = ("0" + now.getDate()).slice(-2);
        var month = ("0" + (now.getMonth() + 1)).slice(-2);
        var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
        return today
    }
    getRecruit()
    getInterview()
    function getInterview(rec_id, isRead, isInterview, isEmploy ){
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                elem: '#department-list'
                ,url:'/admin/interview/list'
                ,method:"post"
                ,where:{"rctId":rec_id,"isRead":isRead,"isInterview":isInterview,"isEmploy":isEmploy}
                ,cols: [[
                    {field:'resId',width:100,  title: '简历详情',templet:"#info"}
                    ,{field:'uName',  title: '人姓名',templet:"#uName"}
                    ,{field:'isRead',  title: '是否查看',templet:"#isRead"}
                    ,{field:'isInterview',  title: '是否面试',templet:"#isInterview"}
                    ,{field:'startTime', title: '投递时间',sort:true,templet:'#startTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ,{field:'viewTime', title: '面试时间', sort:true,templet:'#viewTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ,{field:'isEmploy',width:100, title: '是否录用',templet:"#status"}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]],
                page:true
            });

            //监听行工具事件
            table.on('tool(department-list)', function(obj){
                var data = obj.data;
                if(obj.event === 'del'){
                    layer.open({
                        type: 1,
                        area: ['500', '300'],
                        title: '雇佣',
                        content: "<div>确定雇佣此人?</div>",
                        btn:['确定',"取消"],
                        btn1: function(index) {
                            $.post("/interview/sethire",{"id":data.id,"isEmploy":2},function (data) {
                                if (data.status==200){
                                    layer.msg("雇佣他成功", {icon: 1});
                                }else{
                                    layer.msg(data.msg, {icon: 4});
                                }
                                getInterview(dctId);
                            })
                            layer.close(index);
                        },
                        btn2:function () {
                        }
                    })
                } else if(obj.event === 'edit'){
                    layer.open({
                        type: 1,
                        area: ['500', '300px'],
                        title: '安排面试',
                        content: $("#anpai"),
                        btn:['确定',"取消"],
                        btn1: function(index) {
                            var t=$("#time").val()
                            if (t!=null&&t!=''){
                                $.post("/interview/setinterview",{"id":data.id,"viewTime":t,"isInterview":1},function (data) {
                                    if (data.status==200){
                                        layer.msg("安排面试成功", {icon: 1});
                                        getInterview(dctId);
                                    }else {
                                        layer.msg(data.msg, {icon: 4});
                                    }
                                });
                            }else {
                                layer.msg("时间不能为空", {icon: 3});
                            }
                            layer.close(index);
                        },
                        btn2:function () {
                        }
                    })
                }
                else if(obj.event === 'del2'){
                    layer.open({
                        type: 1,
                        area: ['500', '300'],
                        title: '雇佣',
                        content: "<div>确定不雇佣此人?</div>",
                        btn:['确定',"取消"],
                        btn1: function(index) {
                            $.post("/interview/sethire",{"id":data.id,"isEmploy":1},function (data) {
                                if (data.status==200){
                                    layer.msg("拒绝成功", {icon: 1});
                                }else{
                                    layer.msg(data.msg, {icon: 4});
                                }
                                getInterview(dctId);
                            })
                            layer.close(index);
                        },
                        btn2:function () {
                        }
                    })
                } else if(obj.event === 'edit2'){
                    layer.open({
                        type: 1,
                        area: ['500', '300'],
                        title: '雇佣',
                        content: "<div>确定不面试此人?</div>",
                        btn:['确定',"取消"],
                        btn1: function(index) {
                            $.post("/interview/setinterview",{"id":data.id,"isInterview":2},function (data) {
                                if (data.status==200){
                                    layer.msg("退回其简历成功", {icon: 1});
                                    getInterview(dctId);
                                }else {
                                    layer.msg(data.msg, {icon: 4});
                                }
                            });
                            layer.close(index);
                        },
                        btn2:function () {
                        }
                    })
                }
            });
        });
    }
    function check_dep(node){
        var t=$(node).attr("status");
        var id=$(node).attr("value");
        var n=$(node).attr("dName");
        if (t=="true"){
            dctId=id;
            getInterview(id)
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
                    {field:'title',width:100,  title: '招聘标题'}
                    ,{field:'department',width:120,  title: '招聘部门',templet:"#dep_name"}
                    ,{field:'user', width:120, title: '负责人',templet:"#user_name"}
                    ,{field:'pNumber', width:100, title: '需要人数'}
                    ,{field:'hNumber', width:100, title: '已招人数'}
                ]],
                page:true
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

    function look(rscid,id){
        $.get("/admin/resume/"+rscid,function (data) {
            if(data.status==200){
                var res=data.data
                $("#salary").val(res.salary/100)
                $("#name").val(res.name)
                $("#phone").val(res.phone)
                $("#age").val(res.age)
                $("#email").val(res.email)
                $("#major").val(res.major)
                $("#introduce").val(res.introduce)
                $("#sex").val(res.sex==1?"男":"女")
                var a=''
                switch (res.education) {
                    case 1:
                        a="小学"
                        break;
                    case 2:
                        a="初中"
                        break;
                    case 3:
                        a="高中"
                        break;
                    case 4:
                        a="本科"
                        break;
                    case 5:
                        a="研究生"
                        break;
                    case 6:
                        a="博士"
                        break;
                    case 7:
                        a="博士后"
                        break;
                    case 8:
                        a="院士"
                        break;
                }
                $("#education").val(a)
                layer.open({
                    type: 1,
                    area: ['1000px', '600px'],
                    title: '查看简历',
                    content: $("#rescme"),
                    btn:['确定'],
                    btn1: function(index) {
                        $.post("/admin/interview/look",{"id":id,"isRead":1},function (data) {
                            getInterview(dctId);
                        });
                            layer.close(index);
                    }
                })
            }else{
                layer.msg(data.msg, {icon: 3});
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

</script>
<script type="text/html" id="barDemo">
    {{# if(d.isInterview==-1){ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">安排面试</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="edit2">退回简历</a>
    {{#} if(d.isEmploy==-1&&d.isInterview==3){}}
    <a class="layui-btn layui-btn-xs" lay-event="del">雇佣</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del2">不雇佣</a>
    {{# } }}
</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
<script id="startTime" type="text/html">
    {{#
    var date = new Date();
    date.setTime(d.startTime);
    return date.Format("yyyy-MM-dd hh:mm:ss");
    }}
</script>
<script id="viewTime" type="text/html">
    {{#
    if(d.viewTime==null){
        return "还未面试";
    }
    var date = new Date();
    date.setTime(d.viewTime);
    return date.Format("yyyy-MM-dd hh:mm:ss");
    }}
</script>
<script id="endTime" type="text/html">
    {{#
    var date = new Date();
    date.setTime(d.endTime);
    return date.Format("yyyy-MM-dd hh:mm:ss");
    }}
</script>
<script id="user_name" type="text/html">
    {{d.user.userName}}
</script>
<script type="text/html" id="dep_name">
    <i class="layui-icon x-show icon_bg" status="true" onclick="check_dep(this)"  value="{{d.id}}" dName="{{d.department.dName}}">&#xe623;</i>{{d.department.dName}}
</script>
<script id="info" type="text/html">
    <a onclick="look('{{d.rctId}}','{{d.id}}')" class="layui-btn layui-btn-sm layui-btn-normal">查看简历</a>
</script>
<script id="uName" type="text/html">
{{d.resume.name}}
</script>
<script id="isRead" type="text/html">
    {{# if(d.isRead===-1){ }}
    <div style="color: rgba(65,114,255,0.64);">未查看</div>
    {{# }else{ }}
    <div style="color: red;">已查看</div>
    {{# } }}
</script>
<script id="status" type="text/html">
    {{# if(d.isEmploy===4){ }}
    <div style="color: rgba(65,114,255,0.64);">就职</div>
    {{# }else if(d.isEmploy===3){ }}
    <div style="color: red;">拒绝就职</div>
    {{# }else if(d.isEmploy===2){ }}
    <div style="color: yellow;">同意录用</div>
    {{# }else if(d.isEmploy===1){ }}
    <div style="color: greenyellow;">已拒绝</div>
    {{# }else{ }}
    <div style="color: blue;">等待中</div>
    {{# } }}
</script>
<script id="isInterview" type="text/html">
    {{# if(d.isInterview===1){ }}
    <div style="color: rgba(65,114,255,0.64);">等待面试</div>
    {{# }else if(d.isInterview===2){ }}
    <div style="color: red;">拒绝</div>
    {{# }else if(d.isInterview===3){ }}
    <div style="color: greenyellow;">同意面试</div>
    {{# }else if(d.isInterview===4){ }}
    <div style="color: greenyellow;">拒绝面试</div>
    {{# }else{ }}
    <div style="color: blue;">等待中</div>
    {{# } }}
</script>
</body>

</html>
