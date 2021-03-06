<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎打卡</title>
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
        <a href="">打卡</a>
        <a>
          <cite>奖惩</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
          <input id="year" type="text" name="year"  placeholder="请输入年" autocomplete="off" class="layui-input">
          <input id="month" type="text" name="month"  placeholder="请输入月" autocomplete="off" class="layui-input">
          <a onclick="getClock()" class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></a>
        </form>
      </div>
      <table class="layui-table" id="trains-list" lay-filter="trains-list">
      </table>
    </div>
    <script>

      function getClock() {
          getTrainsAll($("#year").val(),$("#month").val())
      }
        var myDate = new Date();
        getTrainsAll(myDate.getFullYear(),myDate.getMonth()+1)
        function getTrainsAll(year,month){
            layui.use('table', function(){
                var table = layui.table;
                table.render({
                    elem: '#trains-list'
                    ,url:'/users/award/list'
                    ,method:"post"
                    ,where:{"year":year,"month":month}
                    ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                    ,cols: [[
                        {field:'reason', width:200, title: '原因'}
                        ,{field:'startTime', title: '开始时间', width: 200, minWidth: 100,sort:true,templet:'#startTime'} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
                        ,{field:'money',width:200,  title: '奖惩金额',templet:"#money"}
                        ,{field:'reason', width:200, title: '原因'}
                    ]],
                    page:true
                });
            });
        }
      function getTime(data){
          var now = new Date(data);
          var day = ("0" + now.getDate()).slice(-2);
          var month = ("0" + (now.getMonth() + 1)).slice(-2);
          var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
          return today
      }
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

  </body>

</html>