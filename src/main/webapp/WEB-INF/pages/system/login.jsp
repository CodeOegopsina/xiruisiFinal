<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles/page-account.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>

<script>
    $(function () {
        $("#login").click(function () {
            //判断非空后直接发送到后台处理
            var username = $("#username").val();
            var password = $("#password").val();
            if(username === ''){
                alert("请输入用户名");
                return;
            }
            if(password === ''){
                alert('请输入密码');
                return;
            }
            var json = {
                "username":username,
                "password":password
            };
            $.ajax({
                url:'${pageContext.request.contextPath}/login/login',
                data:json,
                type:'GET',
                contentType:'application/json;charset=utf-8',
                dataType:'json',
                success:function (res) {
                    if(res.type === 'success'){
                        //跳转首页
                        location.href = '${pageContext.request.contextPath}/';
                    }else{
                        alert(res.msg)
                    }
                }
            })
        })
    })
</script>
<body>
<div class="login-box">
    <!--head-->
    <div class="py-container logoArea" style="margin-left:-400px ">
        <a href="${pageContext.request.contextPath}/" class="logo-bd"></a>
    </div>
    <!--loginArea-->
    <div class="loginArea">
        <div class="py-container login">
            <div class="loginform">
                <ul class="sui-nav nav-tabs tab-wraped">
                    <li><a href="${pageContext.request.contextPath}/system/login_sms" data-toggle="tab">短信验证登录</a></li>
                    <li class="active"><a href="#profile" data-toggle="tab">账户登录</a></li>
                </ul>
                <div class="tab-content tab-wraped">
                    <div id="index" class="tab-pane">
                        <p>啦啦啦</p>
                    </div>
                    <div id="profile" class="tab-pane active">
                        <form class="sui-form" autocomplete="off">
                            <div class="input-prepend">
                                <span class="add-on loginname"></span>
                                <input type="text" id="username" class="span2 input-xfat" placeholder="用户名">
                            </div>
                            <div class="input-prepend">
                                <span class="add-on loginpwd"></span>
                                <input type="password" id="password" class="span2 input-xfat" placeholder="请输入密码">
                            </div>
                            <div class="setting">
                                <label class="checkbox inline"></label>
                                <span class="forget">忘记密码？</span>
                            </div>
                            <div class="logined" id="login">
                                <a class="sui-btn btn-block btn-xlarge btn-danger">登&nbsp;&nbsp;录</a>
                            </div>
                        </form>

                        <div class="registration">
                            <a href="${pageContext.request.contextPath}/system/register">立即注册</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--foot-->
    <div class="py-container copyright">
        <ul>
            <li><a href="#">关于我们</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">联系客服</a></li>
            <li><a href="#">商家入驻</a></li>
            <li><a href="#">营销中心</a></li>
            <li><a href="#">手机喜瑞斯</a></li>
            <li><a href="#">销售联盟</a></li>
            <li><a href="#">喜瑞斯社区</a></li>
            <li><a href="#">喜瑞斯公益</a></li>
            <li><a href="#">English Site</a></li>
            <li><a href="#">Contact U</a></li>
        </ul>
        <div class="address">地址：天津工业大学 邮编：100096 电话：400-618-4000 传真：010-82935100</div>
        <div class="beian">津ICP备08001421号京公网安备110108007702
        </div>
    </div>
</div>
</body>

</html>