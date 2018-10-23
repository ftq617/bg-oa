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
          <cite>员工管理</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <div class="layui-col-md2">
            <div class="layui-row">
                <form class="layui-form layui-col-md12 x-so">
                    <input id="id" type="hidden">
                    <input id="year" type="text" name="year"  placeholder="请输入年" autocomplete="off" class="layui-input">
                    <input id="month" type="text" name="month"  placeholder="请输入月" autocomplete="off" class="layui-input">
                    <a onclick="getClock()" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></a>
                </form>
            </div>
        </div>
        <div class="layui-col-md6">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <label class="layui-form-label">部门分类</label>
                    <div class="layui-input-inline">
                        <select id="dept" name="dept">
                            <option value="">请选择部门</option>
                        </select>
                    </div>
                    <label class="layui-form-label">职位分类</label>
                    <div class="layui-input-inline">
                        <select id="job">
                            <option value="">请选择职位</option>
                        </select>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <xblock>
        <a class="layui-btn layui-btn-warm" onclick="getUser()">所有人员</a>
        <a class="layui-btn layui-btn-normal" onclick="typeGetUser(7)">经理</a>
        <a class="layui-btn layui-btn-danger" onclick="typeGetUser(6)">部长</a>
        <a class="layui-btn layui-btn-warm" onclick="typeGetUser(5)">主任</a>
        <a class="layui-btn layui-btn-normal" onclick="typeGetUser(4)">在职人员</a>
        <a class="layui-btn layui-btn-danger" onclick="typeGetUser(3)">试用人员</a>
        <a class="layui-btn layui-btn-normal" onclick="typeGetUser(2)">离职人员</a>
        <a class="layui-btn layui-btn-danger" onclick="typeGetUser(1)">游客</a>
    </xblock>
    <div class="layui-row">
        <div class="layui-col-md4">
            <table class="layui-hide" id="user-list" lay-filter="user-list"></table>
        </div>
        <div class="layui-col-md8">
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
                            <a id="isObject" onclick="yiyichuli()" class="layui-btn layui-btn-normal">查看异议</a>
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
<input id="sId" type="hidden">
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
                <input id="moneyT" style="width: 200px" type="number" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
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
<script id="sex" type="text/html">
    {{# if(d.sex==1){}}
        男
    {{# }else{}}
        女
    {{# }}}
</script>
<script id="type" type="text/html">
    {{# switch(d.type){
        case 1:}}游客{{# break;
        case 2:}}离职{{# break;
        case 3:}}试用{{# break;
        case 4:}}在职干事{{# break;
        case 5:}}主任{{# break;
        case 6:}}部长{{# break;
        case 7:}}经理{{# break;
        case 8:}}董事{{# break;}}}
</script>
<script>
    var d_id;
    var j_id;
    var t_type;
    $(document).ready(function(){
        getUser();
        var myDate = new Date();
        getSalary(null,myDate.getFullYear(),myDate.getMonth()+1)
        $.post("/admin/department/list","",function (data) {
            var html='<option value="">请选择部门</option>';
            if (data.code == 0) {
                var list = data.data;
                for (var i = 0; i < list.length; i++) {
                    html += "<option value='" + list[i].id + "'>" + list[i].dName + "</option>"
                }
            }
            $("#dept").html(html);
            layui.use('form',function(){
                var form = layui.form;
                form.render("select");
            });
        });
    });

    function getClock(){
        getSalary($("#id").val(),$("#year").val(),$("#month").val())
    }

    layui.use('form',function(){
        var form = layui.form;
        form.on('select', function(data){
            if (data.elem.id==="dept"){
                d_id = data.value;
                if (data.value==''){
                    getUser()
                }else {
                    getUser(data.value);
                }
                getJob("job",data.value)
            }else if (data.elem.id==="job"){
                d_id=data.value;
                if (data.value!='') {
                    getUser(null, data.value);
                }
            }
            else if (data.elem.id==="u_dept") {
                $("#u_did").val(data.value)
                getJob("u_job",data.value)
            }
            else if (data.elem.id==="u_job") {
                $("#u_jid").val(data.value)
            }
            else if (data.elem.id==="u_type") {
                $("#utype").val(data.value)
            }
        });
    });

    function getJob(id,d_id,u_job) {
        $.post("/admin/job/list","depId="+d_id,function (data) {
            var html = '<option value="">请选择职位</option>';
            if (data.code == 0) {
                var list = data.data;
                for (var i = 0; i < list.length; i++) {
                    if (u_job==list[i].id) {
                        html += "<option selected value='" + list[i].id + "'>" + list[i].jobName + "</option>"
                    }else {
                        html += "<option value='" + list[i].id + "'>" + list[i].jobName + "</option>"
                    }
                }
            }
            $("#"+id).html(html);
            layui.use('form',function(){
                var form = layui.form;
                form.render("select");
            });
        })
    }
    function typeGetUser(type) {
        t_type=type
        getUser(d_id,j_id,type);
    }

    function getUser(dep_id,job_id,type,name){
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                elem: '#user-list'
                ,url:'/admin/user/list'
                ,method:"post",
                where:{"name":name,"departmentId":dep_id,"jobId":job_id,"type":type}
                ,cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {type:'checkbox'},
                    {field:'id', width:50, title: 'ID', sort: true}
                    ,{field:'number', width:100,  title: '职员编号'}
                    ,{field:'userName',width:100,  title: '姓名',templet:"#user_name"}
                    ,{field:'jobName',width:100,  title: '职位名'}
                    ,{field:'departmentName',width:100,  title: '部门名'}
                    ,{field:'sex', width:100,  title: '性别',templet:"#sex"}
                    ,{fixed: 'right',width:100, title:'操作', toolbar: '#u_add'}
                ]],
                page:true
            });
            //监听行工具事件
            table.on('tool(user-list)', function(obj) {
                var data = obj.data;
                if (obj.event === 'add') {
                    layer.open({
                        type: 1,
                        area: ['200px', '300px'],
                        title: '生成工资单',
                        content: "<div> 确定生成： "+data.userName+" 的工资单？</div>",
                        btn:['确定','取消'],
                        btn1: function(index) {
                            $.post("/admin/salary/add",{"uId":data.id},function (objs) {
                                if (objs.status==200){
                                    layer.msg('生成'+data.userName +'工资单成功', {icon: 1});
                                    var myDate = new Date();
                                    getSalary(data.id,myDate.getFullYear(),myDate.getMonth())
                                }else{
                                    layer.msg(objs.msg, {icon: 3});
                                }
                            });
                            layer.close(index)
                        },
                        btn2:function() {
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
            var myDate = new Date();
            $("#id").val(id)
            getSalary(id,myDate.getFullYear(),myDate.getMonth())
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

    function getSalary(id,year,month) {
        $.post("/admin/salary/list",{"uId":id,"year":year,"month":month},function (data) {
            if (data.status==200){
                var obj=data.data;
                $("#sId").val(obj.id)
                $("#basic").val(obj.basic/100);
                var date = new Date();
                date.setTime(obj.overtime);
                $("#start_time").val(date.Format("yyyy-MM-dd hh:mm:ss"));
                $("#reApun").val(obj.reApun/100);
                $("#social").val(obj.social/100);
                $("#isHandle").val(obj.isHandle==1?"未处理":"处理");
                $("#total").val((obj.basic+obj.reApun-obj.social)/100);
                if (obj.isObjection==-1) {
                    $("#isObject").text("无异议");
                    $("#isObject").attr("disabled",true);
                    $("#isObject").css("pointer-events","none");
                }else {
                    $("#isObject").text("查看异议");
                    $("#isObject").attr("disabled",false);
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

    function yiyichuli() {
        $.get("/users/objection/"+$("#sId").val(),function (data) {
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
                    btn: ['同意','否决','取消'],
                    btn1: function (index) {
                        if (obj.isHandle==-1){
                            if ($("#moneyT").val()==''){
                                layer.msg("金额不能为空", {icon: 4});
                                return
                            }
                            $.post("/admin/objection/update",{"id":$("#sId").val(),"uId":$("#id").val(),"money":$("#moneyT").val(),"type":1},function (data) {
                                if (data.status==200){
                                    layer.msg("同意成功", {icon: 1});
                                } else {
                                    layer.msg(data.msg, {icon: 4});
                                }
                            })
                        }else {
                            layer.msg("你已经处理过了", {icon: 4});
                        }
                        layer.close(index)
                    },
                    btn2: function (index) {
                        if (obj.isHandle==-1){
                            $.post("/admin/objection/update",{"id":$("#sId").val(),"type":2},function (data) {
                                if (data.status==200){
                                    layer.msg("否决成功", {icon: 1});
                                } else {
                                    layer.msg(data.msg, {icon: 4});
                                }
                            })
                        }else {
                            layer.msg("你已经处理过了", {icon: 4});
                        }
                        layer.close(index)
                    },
                    btn3: function (index) {
                        layer.close(index)
                    }
                })
            }else {
                layer.msg(data.msg, {icon: 1});
            }
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