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
          <cite>我的培训</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <xblock>
          <a class="layui-btn layui-btn-danger" onclick="getTrainsAll()"><i class="layui-icon">&#xe615;</i>查看所有</a>
          <a class="layui-btn" onclick="getTrains()"><i class="layui-icon"></i>查看自己的</a>
        </xblock>
      </div>
      <table class="layui-table" id="trains-list" lay-filter="trains-list">
      </table>
    </div>
    <script>
      function getTime(data){
          var now = new Date(data);
          var day = ("0" + now.getDate()).slice(-2);
          var month = ("0" + (now.getMonth() + 1)).slice(-2);
          var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
          return today
      }
        getTrainsAll()
      function getTrainsAll(){
          layui.use('table', function(){
              var table = layui.table;
              table.render({
                  elem: '#trains-list'
                  ,url:'/users/trains/list'
                  ,method:"post"
                  ,where:{"status":status}
                  ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                  ,cols: [[
                      {field:'content',width:200,  title: '培训内容'}
                      ,{field:'department',width:200,  title: '培训部门',templet:"#dep_name"}
                      ,{field:'job', width:200, title: '培训职位',templet:"#job_name"}
                      ,{field:'startTime', title: '开始时间', width: 200, minWidth: 100,sort:true,templet:'#startTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                      ,{field:'endTime', title: '结束时间', width: 200, minWidth: 100,sort:true,templet:'#endTime'}
                      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
                  ]],
                  page:true
              });

              //监听行工具事件
              table.on('tool(trains-list)', function(obj) {
                  var data = obj.data;
                  if (obj.event === 'add') {
                      $.post("/users/userTrains/add","t_id="+data.id,function (data) {
                          if (data.status==200){
                              layer.msg('参加成功', {icon: 1});
                          }else {
                              layer.msg(data.msg, {icon: 5});
                          }
                      })
                  }
              });
          });
      }
      function getTrains(){
          var url="/users/userTrains/list"
          layui.use('table', function(){
              var table = layui.table;
              table.render({
                  elem: '#trains-list'
                  ,url:'/users/userTrains/list'
                  ,method:"post"
                  ,where:{"status":status}
                  ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                  ,cols: [[
                      {field:'content',width:200,  title: '培训内容'}
                      ,{field:'department',width:200,  title: '培训部门',templet:"#dep_name"}
                      ,{field:'job', width:200, title: '培训职位',templet:"#job_name"}
                      ,{field:'startTime', title: '开始时间', width: 200, minWidth: 100,sort:true,templet:'#startTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                      ,{field:'endTime', title: '结束时间', width: 200, minWidth: 100,sort:true,templet:'#endTime'}
                  ]],
                  page:true
              });

              //监听行工具事件
              table.on('tool(trains-list)', function(obj) {
                  var data = obj.data;
                  if (obj.event === 'add') {
                      layer.confirm('真的要删除行么', function (index) {
                          deletes(data.id);
                          obj.del();
                          layer.close(index);
                      });
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

      layui.use('form',function(){
            var form = layui.form;
            form.on('select', function(data){
                if (data.elem.id==="dept"){
                    $("#add_deptId").val(data.value)
                    getJob("job",data.value)
                    getUser("add_uid",data.value)
                }else if (data.elem.id==="job"){
                    if (data.value!='') {
                        $("#add_jobId").val(data.value)
                        getUser("add_uid",null,data.value)
                    }
                }else if (data.elem.id==="up_dept"){
                    $("#up_deptId").val(data.value)
                    getJob("up_job",data.value)
                    getUser("up_uid",data.value)
                }else if (data.elem.id==="up_job"){
                    if (data.value!='') {
                        $("#up_jobId").val(data.value)
                        getUser("up_uid",null,data.value)
                    }
                }
            });
        });
    </script>
    <script id="startTime" type="text/html">
      {{#
      var date = new Date();
      date.setTime(d.startTime);
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
    <script id="dep_name" type="text/html">
      {{d.department.dName}}
    </script>
    <script id="job_name" type="text/html">
      {{d.job.jobName}}
    </script>
    <script type="text/html" id="barDemo">
      <a class="layui-btn layui-btn-xs" lay-event="add">参加</a>
    </script>
  </body>

</html>