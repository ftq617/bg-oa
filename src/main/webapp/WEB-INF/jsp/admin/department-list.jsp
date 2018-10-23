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
        <a href="">演示</a>
        <a>
          <cite>部门管理</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="add()"><i class="layui-icon"></i>添加</button>
      </xblock>
      <table class="layui-table" id="department-list" lay-filter="department-list">
      </table>
    </div>
    <div style="display: none;" id="changeArea" class="change-pas-box" >
      <form class="layui-form" action="">
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label" >部门名称：</label>
          <div class="layui-input-block">
            <input id="dname" type="text" name="title" lay-verify="title" required="" autocomplete="off" placeholder="请输入名称"  class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">是否启用</label>
          <div class="layui-input-block">
            <input type="hidden" id="check">
            <input type="radio" name="status" value="1" title="是" >
            <input type="radio" name="status" value="2" title="否">
          </div>
        </div>
      </form>
    </div>
    <div style="display: none;" id="addDepartment" class="change-pas-box">
      <form class="layui-form" action="">
        <div class="layui-form-item" style="padding:10px ">
        <label class="layui-form-label" style="width: 120px">请输入部门名称：</label>
        <div class="layui-input-block" >
          <input id="a_name" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
        </div>
      </div>
      </form>
    </div>
    <script>
        layui.use('table', function(){
            var table = layui.table;
            table.render({
                id:'uId',
                elem: '#department-list'
                ,url:'/admin/department/list'
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {type:'checkbox'},
                    {field:'id', width:80, title: 'ID', sort: true}
                    ,{field:'dName',  title: '部门名称'}
                    ,{field:'uName',  title: '领导名'}
                    ,{field:'createTime', title: '创建时间', width: '30%', minWidth: 100,sort:true,templet:'#createTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                    ,{field:'status',width:100, title: '状态',templet:"#status"}
                    ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                ]],
                page:true
            });

            //监听行工具事件
            table.on('tool(department-list)', function(obj){
                var data = obj.data;
                if(obj.event === 'del'){
                    layer.confirm('真的要删除行么', function(index){
                        deletes(data.id);
                        obj.del();
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    $("#dname").val(data.dName);
                    if(data.status==1){
                        $("input[name='status']:first").attr("checked",true)
                    }else {
                        $("input[name='status']:last").attr("checked",true)
                    }
                    $("#check").val(data.status)
                    layui.use('form',function(){
                        var form = layui.form;
                        form.render("radio");
                    });
                    layer.open({
                        type: 1,
                        area: ['400px', '300px'],
                        title: '部门编辑',
                        content: $("#changeArea"),
                        btn:['修改','取消'],
                        btn1: function() {

                            $.post("/admin/department/update","id="+data.id+"&dName="+$("#dname").val()+"&status="+$("#check").val(),function (objs) {
                                if (objs.status==200){
                                      layer.msg('修改成功', {icon: 1});
                                  }else{
                                      layer.msg(objs.msg, {icon: 3});
                                  }
                                setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                                    window.location.reload();//页面刷新
                                },1700);
                            });
                        },
                        btn2:function() {
                        }
                    })
                }
            });
        });
        layui.use('form',function(){
            var form = layui.form;
            form.on('radio', function(data){
                $("#check").val(data.value)
            });
        });

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
        var data = tableCheck.getData();
        layer.confirm('确认要删除id为'+data+'的部门吗？',function(index){
            deletes(data);
        });
      }
      function add() {
          layer.open({
              type: 1,
              area: ['400px', '300px'],
              title: '添加部门',
              content: $("#addDepartment"),
              btn:['增加','取消'],
              btn1: function() {
                  var name=$("#a_name").val()
                  if (name==null||name==''){
                      layer.msg('部门名不能为空', {icon: 5,zIndex:layer.zIndex+100});
                      return
                  }
                  $.post("/admin/department/add","dName="+$("#a_name").val(),function (objs) {
                      if (objs.status===200){
                          layer.msg('增加成功', {icon: 1,zIndex:layer.zIndex+100});
                      }else{
                          layer.msg(objs.msg, {icon: 3,zIndex:layer.zIndex+100});
                      }
                      setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                          window.location.reload();//页面刷新
                      },1700);
                  });
              },
              btn2:function() {
              }
          })
      }

      function deletes(data) {
            //捉到所有被选中的，发异步进行删除
            $.post("/admin/department/delete",'ids='+data,function (data) {
                if (data.status==200){
                    layer.msg('成功删除id为'+data+"部门", {icon: 1});
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                } else if (data.status==201){
                    layer.msg(data.msg, {icon: 1});
                }
                else {
                    layer.msg(data.msg, {icon: 5});
                }
                setTimeout(function(){  //使用  setTimeout（）方法设定定时2000毫秒
                    window.location.reload();//页面刷新
                },1700);
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
    <script id="createTime" type="text/html">
      {{#
      var date = new Date();
      date.setTime(d.createTime);
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
  </body>

</html>