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

      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="add()"><i class="layui-icon"></i>添加</button>
      </xblock>
      <table class="layui-table" id="trains-list" lay-filter="trains-list">
      </table>
    </div>
    <div style="display: none;" id="changeArea" class="change-pas-box" >
      <form class="layui-form" action="">
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label" style="width: 120px">培训内容：</label>
          <div class="layui-input-block" >
            <input id="up_content" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label">部门选择</label>
          <div class="layui-input-inline">
            <input id="up_deptId" type="hidden"/>
            <select id="up_dept" name="dept">
              <option value="">请选择部门</option>
            </select>
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label">职位选择</label>
          <div class="layui-input-inline">
            <input id="up_jobId" type="hidden"/>
            <select id="up_job">
              <option value="">请选择职位</option>
            </select>
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <div class="layui-inline">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-inline">
              <input type="date" name="date" id="up_start_date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
              <input type="date" name="date" id="up_end_date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
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
    <div style="display: none;" id="addTrains" class="change-pas-box">
      <form class="layui-form" action="">
        <div class="layui-form-item" style="padding:10px ">
        <label class="layui-form-label" style="width: 120px">请输入培训内容：</label>
        <div class="layui-input-block" >
          <input id="content" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
        </div>
      </div>
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label">部门选择</label>
          <div class="layui-input-inline">
            <input id="add_deptId" type="hidden"/>
            <select id="dept" name="dept">
              <option value="">请选择部门</option>
            </select>
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label">职位选择</label>
          <div class="layui-input-inline">
            <input id="add_jobId" type="hidden"/>
            <select id="job">
              <option value="">请选择职位</option>
            </select>
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <div class="layui-inline">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-inline">
              <input type="date" name="date" id="start_date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
              <input type="date" name="date" id="end_date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
          </div>
        </div>
      </form>
      <div style="width: 400px;margin-left: 50px;font-size: 20px">
        <label>请选择需要培训的员工:</label>
        <select id="add_uid" multiple style="font-size: 20px;height: 100px">
          <option value="">请选择员工</option>
        </select>
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
        getTrains()
      function getTrains(status){
          layui.use('table', function(){
              var table = layui.table;
              table.render({
                  elem: '#trains-list'
                  ,url:'/admin/trains/list'
                  ,method:"post"
                  ,where:{"status":status}
                  ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                  ,cols: [[
                      {type:'checkbox'},
                      {field:'id', width:80, title: 'ID', sort: true}
                      ,{field:'content',width:200,  title: '培训内容'}
                      ,{field:'department',width:200,  title: '培训部门',templet:"#dep_name"}
                      ,{field:'job', width:200, title: '培训职位',templet:"#job_name"}
                      ,{field:'startTime', title: '开始时间', width: 200, minWidth: 100,sort:true,templet:'#startTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
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
                      $("#up_content").val(data.content);
                      $("#up_deptId").val(data.department.id)
                      getDepartment("up_dept",data.department.id)
                      $("#up_jobId").val(data.job.id)
                      getJob("up_job",data.department.id,data.job.id)

                      $("#up_start_date").val(getTime(data.startTime));
                      $("#up_end_date").val(getTime(data.endTime));
                      //getUser("up_uid",data.depId,data.jobId)
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
                          title: '培训编辑',
                          content: $("#changeArea"),
                          btn:['修改','取消'],
                          btn1: function(index) {
                              if ($("#up_content").val()==''||$("#up_deptId").val()==''||$("#up_jobId").val()==''||$("#up_start_date").val()==''||$("#up_end_date").val()==''||$("#check").val()==''){
                                  layer.msg("数据不能有为空", {icon: 4});
                                  return
                              }
                              $.post("/admin/trains/update",{"id":data.id,"content":$("#up_content").val(),"department.id":$("#up_deptId").val(),"job.id":$("#up_jobId").val(),"startTime":$("#up_start_date").val(),"endTime":$("#up_end_date").val(),"status":$("#check").val()},function (objs) {
                                  if (objs.status==200){
                                      layer.msg('修改成功', {icon: 1});
                                      getTrains()
                                  }else{
                                      layer.msg(objs.msg, {icon: 3});
                                  }
                                  layer.close(index);
                              });
                          },
                          btn2:function() {
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
          getDepartment("dept")
          layer.open({
              type: 1,
              area: ['600px', '600px'],
              title: '添加培训',
              content: $("#addTrains"),
              btn:['增加','取消'],
              btn1: function(index) {
                  if ($("#content").val()==''||$("#add_deptId").val()==''||$("#add_jobId").val()==''||$("#start_date").val()==''||$("#end_date").val()==''||$("#add_uid").val()==''){
                      layer.msg("数据不能有为空", {icon: 4});
                      return
                  }
                  $.post("/admin/trains/add","content="+$("#content").val()+"&department.id="+$("#add_deptId").val()+"&job.id="+$("#add_jobId").val()+"&startTime="+$("#start_date").val()+"&endTime="+$("#end_date").val()+"&u_ids="+$("#add_uid").val(),function (objs) {
                      if (objs.status===200){
                          layer.msg('增加成功', {icon: 1,zIndex:layer.zIndex+100});
                          getTrains()
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
        function getDepartment(id,dep_id) {
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
                $("#"+id).html(html);
                layui.use('form',function(){
                    var form = layui.form;
                    form.render("select");
                });
            });
        }
        function getJob(id,dId,u_job) {
            $.post("/admin/job/list","depId="+dId,function (data) {id
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
        function getUser(id,dId,job_id,u_job) {
            $.post("/admin/user/list",{"page":1,"limit":100,"departmentId":dId,"jobId":job_id},function (data) {id
                var html = '';
                if (data.code == 0) {
                    var list = data.data;
                    for (var i = 0; i < list.length; i++) {
                        if (u_job==list[i].id) {
                            html += "<option selected value='" + list[i].id + "'>职员编号："+list[i].number +"----职员姓名："+ list[i].userName + "</option>"
                        }else {
                            html += "<option value='" + list[i].id + "'>职员编号："+list[i].number +"---职员姓名：" + list[i].userName + "</option>"
                        }
                    }
                }
                $("#"+id).html(html);
            })
        }
      function deletes(data) {
            //捉到所有被选中的，发异步进行删除
            $.post("/admin/trains/delete",'ids='+data,function (data) {
                if (data.status==200){
                    layer.msg('成功删除id为'+data+"培训", {icon: 1});
                    getTrains();
                } else if (data.status==201){
                    layer.msg(data.msg, {icon: 1});
                    getTrains();
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
    <script id="status" type="text/html">
      {{# if(d.status===1){ }}
      <div style="color: rgba(65,114,255,0.64);">启用</div>
      {{# }else{ }}
      <div style="color: red;">关闭</div>
      {{# } }}
    </script>
    <script id="dep_name" type="text/html">
      {{d.department.dName}}
    </script>
    <script id="job_name" type="text/html">
      {{d.job.jobName}}
    </script>
  </body>

</html>