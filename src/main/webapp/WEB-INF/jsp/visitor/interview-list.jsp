<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>面试</title>
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
        <a href="">面试</a>
        <a>
          <cite>我的面试</cite></a>
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
      <table class="layui-table" id="department-list" lay-filter="department-list">
      </table>
    </div>
    <div style="display: none;" id="trains" class="change-pas-box">
      <form class="layui-form" action="">
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label" style="width: 120px">招聘标题：</label>
          <div class="layui-input-block" >
            <input id="title" readonly style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入招聘标题F" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label" style="width: 120px">工资：</label>
          <div class="layui-input-block" >
            <input id="salary" readonly style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label" style="width: 120px">需要人数：</label>
          <div class="layui-input-block" >
            <input id="pNumber" readonly style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
          </div>
          <label class="layui-form-label" style="width: 120px">已有人数：</label>
          <div class="layui-input-block" >
            <input id="hNumber" readonly style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <label class="layui-form-label">部门</label>
          <div class="layui-input-inline">
            <input id="deptId" readonly style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item" style="padding:10px ">
          <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
              <input readonly type="date" name="date" id="end_date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">招聘说明</label>
            <div class="layui-input-block">
              <textarea readonly id="describe" placeholder="请输入内容" class="layui-textarea"></textarea>
            </div>
          </div>
        </div>
      </form>
    </div>
    <script>

        gettable()
      function gettable(){
          layui.use('table', function(){
              var table = layui.table;
              table.render({
                  elem: '#department-list'
                  ,url:'/interview/list'
                  ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                  ,cols: [[
                      {field:'id', width:80, title: 'ID', sort: true}
                      ,{field:'rctId',  title: '招聘详情',templet:"#rctId"}
                      ,{field:'isRead',  title: '是否查看',templet:"#isRead"}
                      ,{field:'isInterview',  title: '是否面试',templet:"#isInterview"}
                      ,{field:'startTime', title: '投递时间',sort:true,templet:'#startTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                      ,{field:'viewTime', title: '面试时间',sort:true,templet:'#viewTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                      ,{field:'isEmploy',width:100, title: '是否录用',templet:"#status"}
                      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
                  ]],
                  page:true
              });
          });
      }

        layui.use('form',function(){
            var form = layui.form;
            form.on('radio', function(data){
                $("#check").val(data.value)
            });
        });

        function getTime(data){
            var now = new Date(data);
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
            return today
        }
        function look(id){
            $.get("/recruit/"+id,function (obj) {
                var data=obj.data
                $("#title").val(data.title);
                $("#deptId").val(data.department.dName)
                $("#salary").val(data.salary);
                $("#pNumber").val(data.pNumber)
                $("#hNumber").val(data.hNumber)
                $("#end_date").val(getTime(data.endTime));
                $("#describe").val(data.describe)
            })
            layer.open({
                type: 1,
                area: ['500px', '600px'],
                title: '查看招聘',
                content: $("#trains"),
                btn:['取消'],
                btn1: function(index) {
                    layer.close(index);
                },
            })
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

        function mianshi(id,check) {
            $.post("/interview/setinterview",{id:id,"isInterview":check},function (data) {
                    layer.msg(data.msg, {icon: 1});
                    gettable()
            });
        }
        function guyong(id,check) {
            $.post("/interview/sethire",{id:id,"isEmploy":check},function (data) {
                if (data.status==200) {
                    if (check == 4) {
                        layer.msg("就职成功", {icon: 1});
                    } else {
                        layer.msg("拒绝就职成功", {icon: 1});
                    }
                    gettable()
                }else {
                    layer.msg(data.msg, {icon: 4});
                }
            });
        }

    </script>
    <script type="text/html" id="barDemo">
      {{# if(d.isInterview==1){ }}
      <a class="layui-btn layui-btn-xs" onclick="mianshi('{{d.id}}',3)" lay-event="edit">参加面试</a>
      <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="mianshi('{{d.id}}',2)" lay-event="del">拒绝面试</a>
      {{#} if(d.isEmploy==2){}}
      <a class="layui-btn layui-btn-xs" onclick="guyong('{{d.id}}',4)" lay-event="edit">加入我们</a>
      <a class="layui-btn layui-btn-danger layui-btn-xs" onclick="guyong('{{d.id}}',3)" lay-event="del">残忍拒绝</a>
      {{#}}}
    </script>
    <script id="rctId" type="text/html">
      <a onclick="look('{{d.rctId}}')" class="layui-btn layui-btn-sm layui-btn-normal">查看招聘</a>
    </script>
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