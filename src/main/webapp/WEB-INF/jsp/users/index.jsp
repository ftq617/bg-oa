<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>用户-BLUE GOD OA</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
	<link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script src="/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>

</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="./index.jsp">BLUE GOD OA</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav left fast-add" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('资讯','http://www.baidu.com')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
              <dd><a onclick="x_admin_show('图片','http://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>
               <dd><a onclick="x_admin_show('用户','http://www.baidu.com')"><i class="iconfont">&#xe6b8;</i>用户</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item">
                <a href="javascript:;"><i class="layui-icon-notice">&#xe667;</i>通知</a>
              <dl id="tongzhi" class="layui-nav-child" style="color: #0C0C0C"><dd> 暂时没有通知</dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">欢迎您: ${USER.userName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('个人信息','/userInfo')">个人信息</a></dd>
              <dd><a onclick="x_admin_show('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
              <dd><a href="/admin/layout">退出</a></dd>
            </dl>
          </li>
          <li class="layui-nav-item to-index"><a href="/">前台首页</a></li>
        </ul>
        
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>工资信息</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/users/salary">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>工资单</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe6b8;</i>
                    <cite>培训信息</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/users/trains-list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>我的培训</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>部门人员</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/users/dep_and_job">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>员工列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>考勤信息</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/users/punch-clock">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>考勤详情</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/users/awad-list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>奖励惩罚</cite>
                        </a>
                    </li >

                </ul>
            </li>
        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/users/welcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright ©2018 BLUE GOD v2.3 All Rights Reserved</div>
    </div>
    <div style="display: none;" id="trainsArea" class="change-pas-box" >
        <form class="layui-form" action="">
            <div class="layui-form-item" style="padding:10px ">
                <label class="layui-form-label" style="width: 120px">培训内容：</label>
                <div class="layui-input-block" >
                    <input readonly id="up_content" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="padding:10px ">
                <label class="layui-form-label">部门选择</label>
                <div class="layui-input-inline">
                    <input readonly id="up_dept" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="padding:10px ">
                <label class="layui-form-label">职位选择</label>
                <div class="layui-input-inline">
                    <input readonly id="up_job" style="width: 200px" type="text" required="" name="title" lay-verify="title" autocomplete="off" placeholder="请输入名称" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="padding:10px ">
                <div class="layui-inline">
                    <label class="layui-form-label">开始时间</label>
                    <div class="layui-input-inline">
                        <input readonly type="date" name="date" id="up_start_date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">结束时间</label>
                    <div class="layui-input-inline">
                        <input readonly type="date" name="date" id="up_end_date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- 底部结束 -->
    <script type="text/javascript">
        var lists;

        $(document).ready(function(){
            getTrains()
        });
        function getTrains(){
            $.post("/users/userTrains/get_after","",function (data) {
                if (data.status==200){
                    var list = data.data;
                    if (list.length>0){
                        lists=list
                        $(".layui-icon-notice").css("background","red");
                        layer.msg('你有新的培训通知，请及时查看', {icon: 1});
                        var html=''
                        for (var i=0;i<list.length;i++){
                            html+="<dd><a onclick='viewTrains("+i+")'><i class='iconfont'>&#xe6a2;</i>培训通知提醒</a></dd>"
                        }
                        $("#tongzhi").html(html);
                    }
                }
            })
        }
        function getTime(data){
            var now = new Date(data);
            var day = ("0" + now.getDate()).slice(-2);
            var month = ("0" + (now.getMonth() + 1)).slice(-2);
            var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
            return today
        }
        function viewTrains(i) {
                var t=lists[i];
                $("#up_content").val(t.content)
                $("#up_dept").val(t.department.dName)
                $("#up_job").val(t.job.jobName)
                $("#up_start_date").val(getTime(t.startTime))
                $("#up_end_date").val(getTime(t.endTime))
            layer.open({
                type: 1,
                area: ['400px', '500px'],
                title: '培训通知',
                content: $("#trainsArea"),
                btn:['确认','取消'],
                btn1: function(index) {
                    layer.close(index)
                },
                btn2:function() {
                }
            })
        }

    //百度统计可去掉
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
      var s = document.getElementsByTagName("script")[0]; 
      s.parentNode.insertBefore(hm, s);
    })();
    </script>
</body>
</html>