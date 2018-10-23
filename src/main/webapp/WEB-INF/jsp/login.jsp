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
    <title>登 陆</title>

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

<body id="win">

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
                            <h3>登陆后可浏览更多信息</h3>
                            <p>请输入您的用户名和密码:</p>
                        </div>
                        <div class="form-top-right">
                            <a  class="btn btn-primary" href="/register" style="background: #7426ff;width: 100px;height: 50px;font-size: 25px" > 注册</a>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form role="form" action="/user/login" method="post" class="login-form" onsubmit="return check()">
                            <div class="form-group">
                                <label class="sr-only" for="form-phone">账号</label>
                                <input type="text" name="phone" placeholder="Username..." class="form-phone form-control" id="form-phone"><div id="phone" style="color: red">${phone}</div>
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">密码</label>
                                <input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password"><div id="password" style="color: red">${password}</div>
                            </div>
                            <button id="btn" type="submit" class="btn">登 陆!</button>
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
</body>
<script type="text/javascript">
    function check() {
        var phone=$("#form-phone").val();
        var password=$("#form-password").val();

        if (phone==null||phone==""){

            $("#phone").text("手机号不能为空");
            return false;
        }
        if (password==null||password==""){
            $("#password").text("密码不能为空");
            return false;
        }
        if (phone.length!=11){
            $("#phone").text("手机号为11位！！！");
            return false;
        }
        return true;
    }
</script>
</html>
