<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>BLUE GOD JOB</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
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
        <a href="">职位</a>
        <a>
          <cite>职位管理</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so layui-form-pane">
          <input class="layui-input" type="text" placeholder="职位名" name="cate_name" id="j_name">
          <a class="layui-btn"  lay-submit="" lay-filter="sreach" onclick="searchName()"><i class="layui-icon">&#xe615;</i>查找</a>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
      </xblock>
      <div class="layui-row">
        <div class="layui-col-md4">
          <table class="layui-table layui-form" id="department-list" lay-filter="department-list"></table>
        </div>
        <div class="layui-col-md8">
          <table class="layui-table layui-form" id="job-list" lay-filter="job-list" >
          </table>
        </div>
        </div>
    </div>
    <div style="display: none;" id="addArea" class="change-pas-box" >
        <form class="layui-form" action="">
        <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label" style="width: 120px">请输入职位名称：</label>
            <div class="layui-input-block">
                <input id="jname" type="text" style="width: 200px" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称"  class="layui-input">
            </div>
        </div>
        </form>
    </div>
    <input type="hidden" id="de_id"/>
    <div style="display: none;" id="editArea" class="change-pas-box" >
        <form class="layui-form" action="">
            <div class="layui-form-item" style="padding:10px ">
            <label class="layui-form-label">职位名称：</label>
            <div class="layui-input-block">
                <input id="dname" type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称"  class="layui-input">
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
            <div class="layui-form-item">
                <label class="layui-form-label">修改部门</label>
                <div class="layui-input-inline">
                    <input type="hidden" id="depId">
                    <select id="dpt_check" name="dept">
                        <option value="">请选择部门</option>
                    </select>
                </div>
            </div>
        </form>
    </div>
    <script type="text/html" id="dpt_bar">
      <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="add" ><i class="layui-icon">&#xe642;</i>添加职位</a>
    </script>
     <script type="text/html" id="dpt_name">
       <i class="layui-icon x-show icon_bg" status="true" onclick="check_dep(this)"  value="{{d.id}}" dName="{{d.dName}}">&#xe623;</i>{{d.dName}}
      </script>
    <script id="createTime" type="text/html">
        {{#
        var date = new Date();
        date.setTime(d.createTime);
        return date.Format("yyyy-MM-dd hh:mm:ss");
        }}
    </script>
    <script type="text/html" id="job_bar">
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    </script>
    <script type="text/javascript" src="/js/data.js"></script>
    <script id="status" type="text/html">
        {{# if(d.status===1){ }}
        <div style="color: rgba(65,114,255,0.64);">启用</div>
        {{# }else{ }}
        <div style="color: red;">关闭</div>
        {{# } }}
    </script>
    <script>
       var dep_list;
      function check_dep(node){
          var t=$(node).attr("status");
          var id=$(node).attr("value");
          var n=$(node).attr("dName");
          if (t=="true"){
              getJob(id)
              check_all()
              $(node).parents("tr").css("background","rgba(127,255,250,0.64)")
              $(node).parent().html(" <i class='layui-icon x-show icon_bg' status='false' onclick='check_dep(this)'  value='"+id+"' dName='"+n+"'>&#xe625;</i>"+n)
          } else {
              $(node).parents("tr").css("background","")
              $(node).parent().html(" <i class='layui-icon x-show icon_bg' status='true' onclick='check_dep(this)'  value='"+id+"' dName='"+n+"'>&#xe623;</i>"+n)
          }
      }
      function searchName() {
          var name=$("#j_name").val();
          getJob(-999,0,name);
      }
      function getJob(id,status,name) {
          $("#de_id").val(id)
          var url="/admin/job/list";
          layui.use('table', function(){
              var table = layui.table;
              table.render({
                  elem: '#job-list'
                  ,url:url,
                  method:"post",
                  where:{"name":name,"depId":id,"status":status}
                  ,cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                  ,cols: [[
                      {type:'checkbox'},
                      {field:'id', width:50, title: 'ID', sort: true}
                      ,{field:'jobName', width:150,  title: '职位名称'}
                      ,{field:'createTime',  title: '创建时间',templet:'#createTime',sort:true}
                      ,{field:'status', width:100,  title: '状态',templet:"#status"}
                      ,{fixed: 'right',width:150, title:'操作', toolbar: '#job_bar'}
                  ]],
              });

              //监听行工具事件
              table.on('tool(job-list)', function(obj){
                  var data = obj.data;
                  if(obj.event === 'del'){
                      layer.confirm('真的要删除'+data.jobName+'职位么', function(index){
                          deleteJob(data.id,data.depId);
                          layer.close(index);
                      });
                  }
                  else if(obj.event === 'edit'){
                      $("#dname").val(data.jobName);
                      if(data.status==1){
                          $("input[name='status']:first").prop("checked",true)
                      }else {
                          $("input[name='status']:last").prop("checked",true)
                      }
                      $("#check").val(data.status)
                      layui.use('form',function(){
                          var form = layui.form;
                          form.render("radio");
                      });
                      $("#depId").val(data.depId)
                      $.post("/admin/department/list","",function (obj) {
                          var html='';
                          var list=obj.data;
                          for(var i=0;i<list.length;i++){
                              if (list[i].id==data.depId) {
                                  html+="<option selected value='"+list[i].id+"'>"+list[i].dName+"</option>"
                              }else {
                                  html += "<option value='" + list[i].id + "'>" + list[i].dName + "</option>"
                              }
                          }
                          $("#dpt_check").html(html);
                          layui.use('form',function(){
                              var form = layui.form;
                              form.render("select");
                          });
                      })
                      layer.open({
                          type: 1,
                          area: ['400px', '500px'],
                          title: '职位编辑',
                          content: $("#editArea"),
                          btn:['修改','取消'],
                          btn1: function(index) {
                              var name=$("#dname").val()
                              if (name==null||name==''){
                                  layer.msg('职位名不能为空', {icon: 5,zIndex:layer.zIndex+100});
                                  return
                              }
                              $.post("/admin/job/update","id="+data.id+"&jobName="+$("#dname").val()+"&status="+$("#check").val()+"&depId="+$("#depId").val(),function (objs) {
                                  if (objs.status==200){
                                      layer.msg('修改成功', {icon: 1});
                                  }else{
                                      layer.msg(objs.msg, {icon: 3});
                                  }
                                  layer.close(index)
                                  getJob(data.depId)
                              });
                          },
                          btn2:function() {
                          }
                      })
                  }
              });
          });
      }
      layui.use('form',function(){
          var form = layui.form;
          form.on('radio', function(data){
              $("#check").val(data.value)
          });
      });

      function deleteJob(ids,dep_id) {
          $.post("/admin/job/delete",'ids='+ids,function (data) {
              if (data.status==200){
                  layer.msg('成功删除'+data.data+"个职位", {icon: 1});
              } else if (data.status==201){
                  layer.msg(data.msg, {icon: 1});
              }
              else {
                  layer.msg(data.msg, {icon: 5});
              }
             getJob(dep_id);
          });
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
        layui.use('table', function(){
            var table = layui.table;
            getJob(-1);
            table.render({
                elem: '#department-list'
                ,url:'/admin/department/list'
                ,cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'id', width:50, title: 'ID', sort: true}
                    ,{field:'dName', width:150,  title: '部门名称',templet:"#dpt_name"}
                    ,{field:'uName',width:100,  title: '领导名'}
                    ,{fixed: 'right',width:100, title:'操作', toolbar: '#dpt_bar'}
                ]],
                width:405,
            });

            //监听行工具事件
            table.on('tool(department-list)', function(obj){
                var data = obj.data;
                if(obj.event ==='add'){
                    layer.open({
                        type: 1,
                        area: ['400px', '300px'],
                        title: '增加职位',
                        content: $("#addArea"),
                        btn:['增加','取消'],
                        btn1: function(index) {

                            $.post("/admin/job/add","depId="+data.id+"&depName="+data.dName+"&jobName="+$("#jname").val(),function (objs) {
                                if (objs.status==200){
                                    layer.msg('增加成功', {icon: 1});
                                    layer.close(index);
                                }else{
                                    layer.msg(objs.msg, {icon: 3});
                                }
                                getJob(data.id);
                            });
                        },
                        btn2:function() {
                        }
                    })
                }
            });
        });

      function delAll () {
        var data = tableCheck.getJobData();
          layer.confirm('确认要删除id为'+data+'的职位吗？',function(index){
              deleteJob (data, $("#de_id").val());
          });
      }
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>