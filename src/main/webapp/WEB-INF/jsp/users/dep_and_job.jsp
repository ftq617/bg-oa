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
        <a href="">部门</a>
        <a>
          <cite>部门信息</cite></a>
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
      <div class="layui-row">
        <div class="layui-col-md4">
          <table class="layui-table layui-form" id="department-list" lay-filter="department-list"></table>
        </div>
        <div class="layui-col-md4">
          <table class="layui-table layui-form" id="job-list" lay-filter="job-list" >
          </table>
        </div>
          <div class="layui-col-md4">
              <table class="layui-table layui-form" id="user-list" lay-filter="user-list" >
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

     <script type="text/html" id="dpt_name">
       <i class="layui-icon x-show icon_bg" status="true" onclick="check_dep(this)"  value="{{d.id}}" dName="{{d.dName}}">&#xe623;</i>{{d.dName}}
      </script>
    <script type="text/html" id="job_name">
        <i class="layui-icon x-show icon_jb" status="true" onclick="check_job(this)"  value="{{d.id}}" jobName="{{d.jobName}}">&#xe623;</i>{{d.jobName}}
    </script>
    <script id="createTime" type="text/html">
        {{#
        var date = new Date();
        date.setTime(d.createTime);
        return date.Format("yyyy-MM-dd hh:mm:ss");
        }}
    </script>
    <script type="text/javascript" src="/js/data.js"></script>
    <script>
       var dep_list;
      function check_dep(node){
          var t=$(node).attr("status");
          var id=$(node).attr("value");
          var n=$(node).attr("dName");
          if (t=="true"){
              getJob(id)
              getUser(id)
              check_all()
              $(node).parents("tr").css("background","rgba(127,255,250,0.64)")
              $(node).parent().html(" <i class='layui-icon x-show icon_bg' status='false' onclick='check_dep(this)'  value='"+id+"' dName='"+n+"'>&#xe625;</i>"+n)
          } else {
              $(node).parents("tr").css("background","")
              $(node).parent().html(" <i class='layui-icon x-show icon_bg' status='true' onclick='check_dep(this)'  value='"+id+"' dName='"+n+"'>&#xe623;</i>"+n)
          }
      }

       function check_job(node){
           var t=$(node).attr("status");
           var id=$(node).attr("value");
           var n=$(node).attr("jobName");
           if (t=="true"){
               getUser(null,id)
               check_all_job()
               $(node).parents("tr").css("background","rgba(127,255,250,0.64)")
               $(node).parent().html(" <i class='layui-icon x-show icon_jb' status='false' onclick='check_job(this)'  value='"+id+"' jobName='"+n+"'>&#xe625;</i>"+n)
           } else {
               $(node).parents("tr").css("background","")
               $(node).parent().html(" <i class='layui-icon x-show icon_jb' status='true' onclick='check_job(this)'  value='"+id+"' jobName='"+n+"'>&#xe623;</i>"+n)
           }
       }
      function searchName() {
          var name=$("#j_name").val();
          getJob(-999,0,name);
      }
      function getJob(id,name) {
          $("#de_id").val(id)
          var url="/job/list";
          layui.use('table', function(){
              var table = layui.table;
              table.render({
                  elem: '#job-list'
                  ,url:url,
                  method:"post",
                  where:{"name":name,"depId":id}
                  ,cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                  ,cols: [[
                      {field:'jobName', width:150,  title: '职位名称',templet:"#job_name"}
                      ,{field:'createTime',  title: '创建时间',templet:'#createTime',sort:true}
                  ]],
                  width:380,
              });

          });
      }

       function getUser(depId,job_id) {
           var url="/users/user/list";
           layui.use('table', function(){
               var table = layui.table;
               table.render({
                   elem: '#user-list'
                   ,url:url,
                   method:"post",
                   where:{"jobId":job_id,"depId":depId}
                   ,cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                   ,cols: [[
                       {field:'number', width:150,  title: '职员编号',sort:true}
                       ,{field:'userName', width:150,  title: '用户名'}
                       ,{field:'joinTime',  title: '加入时间',templet:'#createTime',sort:true}
                   ]],
                   width:380,
                   page:true
               });

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

       function check_all_job(){
           var obj=$(".icon_jb");
           obj.each(function(i){
               if ($(this).attr("status")=="false"){
                   var id=$(this).attr("value");
                   var n=$(this).attr("jobName");
                   $(this).parents("tr").css("background","")
                   $(this).parent().html(" <i class='layui-icon x-show icon_jb' status='true' onclick='check_job(this)'  value='"+id+"' jobName='"+n+"'>&#xe623;</i>"+n)
               }
           });
       }
        layui.use('table', function(){
            var table = layui.table;
            getJob(-1);
            getUser(-1,-1);
            table.render({
                elem: '#department-list'
                ,url:'/department/list'
                ,cellMinWidth: 50 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'dName', width:150,  title: '部门名称',templet:"#dpt_name"}
                    ,{field:'uName',width:100,  title: '领导名'}
                ]],
                width:300,
            });

        });


    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>