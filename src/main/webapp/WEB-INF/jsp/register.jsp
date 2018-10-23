<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/9/28
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注 册</title>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="/login/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/login/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/login/css/form-elements.css">
    <link rel="stylesheet" href="/login/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="/login/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/login/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/login/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/login/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/login/ico/apple-touch-icon-57-precomposed.png">

</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1> B G 办公 </h1>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>请填写注册信息：</h3>
                            <p>加入我们，证明更美好的自己</p>
                        </div>
                        <div class="form-top-right">
                            <a  class="btn btn-primary" href="/login" style="background: #7426ff;width: 100px;height: 50px;font-size: 25px" > 登陆</a>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="/user/register" method="post" class="login-form" onsubmit="return check()">
                            <input id="token" type="hidden" name="token" value="">
                            <div class="form-group">
                                <label class="sr-only" for="form-phone">手机号</label>
                                <input type="text" name="phone" placeholder="Phone..." class="form-phone form-control" id="form-phone"><div id="phone" style="color: red">${phone}</div>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-username">姓名</label>
                                <input type="text" name="userName" placeholder="UserName..." class="form-password form-control" id="form-username"><div id="username" style="color: red"></div>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">密码</label>
                                <input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password"><div id="password" style="color: red"></div>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">确认密码</label>
                                <input type="password" name="form-password" placeholder="Again Password..." class="form-password form-control" id="form-password2"><div id="password2" style="color: red"></div>
                            </div>
                            <div class="form-group" >
                                <select name="sex" class="form-username form-control" id="form-sex">
                                    <option value="1">男</option>
                                    <option value="2">女</option>
                                </select>
                            </div>
                            <button type="submit" class="btn">注 册 !</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 social-login">
                    <h3>其它登陆方式:</h3>
                    <div class="social-login-buttons">
                        <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                            <i class="fa fa-facebook"></i> Facebook
                        </a>
                        <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                            <i class="fa fa-twitter"></i> Twitter
                        </a>
                        <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                            <i class="fa fa-google-plus"></i> Google Plus
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="copyrights">Collect from <a href="http://www.bluegod.xyz/"  title="BOG GOD">BOG GOD</a></div>


<!-- Javascript -->
<script src="/login/js/jquery-1.11.1.min.js"></script>
<script src="/login/bootstrap/js/bootstrap.min.js"></script>
<script src="/login/js/jquery.backstretch.min.js"></script>
<script src="/login/js/scripts.js"></script>

<!--[if lt IE 10]>
<script src="/login/js/placeholder.js"></script>
<![endif]-->

<script type="text/javascript">
    $(document).ready(function(){
        $("#token").val(Math.random()*(10000000000));
        if ('${msg}'!=''){
            alert('${msg}');
        }
    });
    function check(){
        if ( $("#phone").css("color")=="red"){
            alert($("#phone").text())
            return false;
        }
        if ( $("#password").text()!=""){
            alert($("#password").text())
            return false;
        }
        if ( $("#password2").text()!=""){
            alert($("#password2").text())
            return false;
        }
        if ( $("#username").text()!=""){
            alert($("#username").text())
            return false;
        }
        return true;
    }
    $("#form-phone").blur(function () {
        var phone=$("#form-phone").val();
        if (phone==null||phone==""){

            $("#phone").text("手机号不能为空");
            return false;
        }
        if (phone.length!=11){
            $("#phone").text("手机号为11位！！！");
            return false;
        }
        $.post("/user/checkphone",
            {phone:$("#form-phone").val()},
        function (data) {
            if (data.status==200){
                $("#phone").css("color","green")
                $("#phone").text(data.msg);
            } else {
                $("#phone").text(data.msg);
                $("#phone").css("color","red")
            }
        })
    });
    $("#form-username").blur(function () {
        var user=$("#form-username").val();
        if (user==null||user==""){
            $("#username").text("姓名不能为空");
        }else {
            $("#username").text("");
        }
    });
    $("#form-password").blur(function () {
        var password=$("#form-password").val();
        if (password==null||password==""){
            $("#password").text("密码不能为空");
        }else if (password.length<6){
            $("#password").text("密码不能小于六位");
        }
        else {
            $("#password").text("");
        }
    });
    $("#form-password2").blur(function () {
        var password=$("#form-password").val();
        var password2=$("#form-password2").val();
        if (password!=password2){
            $("#password2").text("两次密码不一致");
        } else {
            $("#password2").text("");
        }
    });
</script>

</body>

</html>
