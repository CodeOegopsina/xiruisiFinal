<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>个人注册</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles/page-account.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>
<script>
    $(function(){
        /*发送验证码*/
        $("#send").click(function () {
            //ajax 请求向注册用户发送验证码
            $.ajax({
                url:'${pageContext.request.contextPath}/register/sendSms',
                data:$("#phone").val(),
                type:'POST',
                contentType:'application/json;charset=utf-8',
                dataType:'json',
                success:function (res) {
                    if(res.type === 'success'){
                        alert("验证码已发送，请勿反复点击");
                    }else{
                        alert(res.msg)
                    }
                }
            });
            return false;
        });

        /*username验证*/
        $("#username").mouseleave(function () {
            var username = $("#username").val();
            if(username == ''){
                $("#usernameError").html("请输入用户名");
                return;
            }else{
                $.ajax({
                    url:'${pageContext.request.contextPath}/register/checkUsername',
                    data:username,
                    type:'POST',
                    contentType:'application/json;charset=utf-8',
                    dataType:'json',
                    success:function (res) {
                        if(res.type === 'error'){
                            $("#usernameError").html(res.msg);
                        }else{
                            $("#usernameError").html('√');
                            flag = 1;
                        }
                    }
                });
            }
        });

        /*email验证*/
        $("#email").mouseleave(function () {
            var email = $("#email").val();
            var regEmail=/^\w+@\w+(\.[a-zA-Z]{2,3}){1,2}$/;
            if(email === ''){
                $("#eamilError").html("请输入邮箱");
                return;
            }else if(regEmail.test(email) === false){
                $("#eamilError").html("邮箱格式有误，请重新输入");
                return;
            }else{
                $.ajax({
                    url:'${pageContext.request.contextPath}/register/checkEmail',
                    data:email,
                    type:'POST',
                    contentType:'application/json;charset=utf-8',
                    dataType:'json',
                    success:function (res) {
                        if(res.type === 'error'){
                            $("#eamilError").html(res.msg);
                        }else{
                            $("#eamilError").html('√');
                        }
                    }
                });
            }
        });

        /*密码验证*/
        $("#password").mouseleave(function () {
            var password = $("#password").val();
            if(password === ''){
                $("#passwordError").html("请输入密码");
                return;
            }else{
                $("#passwordError").html("√")
            }
        });

        /*电话号码验证*/
        $("#phone").mouseleave(function () {
            var phoneNumber = $("#phone").val();
            var regPhone = /^1\d{10}$/;
            if(phoneNumber === ''){
                $("#phoneError").html("请输入手机号");
                return false;
            }else if(regPhone.test(phoneNumber) === false){
                $("#phoneError").html("号码格式有误，请重新输入");
                return false;
            }else{
                $.ajax({
                    url:'${pageContext.request.contextPath}/register/checkPhone',
                    data:phoneNumber,
                    type:'POST',
                    contentType:'application/json;charset=utf-8',
                    //contentType:'application/x-www-form-urlencoded;charset=utf-8',
                    dataType:'json',
                    success:function (res) {
                        if(res.type === 'error'){
                            $("#phoneError").html(res.msg);
                        }else{
                            $("#phoneError").html('√');
                        }
                    }
                });
            }

        });

        /*验证码验证*/
        $("#captcha").mouseleave(function () {
            var captcha = $("#captcha").val();
            //与session中的验证码比较
            if(captcha === ''){
                return;
            }
            $.ajax({
                url:'${pageContext.request.contextPath}/register/testSms',
                data:captcha,
                type:'POST',
                contentType:'application/json;charset=utf-8',
                dataType:'json',
                success:function (res) {
                    if(res.type === 'success'){

                    }else{
                        alert(res.msg);
                    }
                }
            });
        })

        /*发送注册信息*/
        $(".sui-btn").click(function() {
            /*获取表单数据*/
            var username = $("#username").val();
            var email = $("#email").val();
            var password = $("#password").val();
            var phoneNumber = $("#phone").val();
            var captcha = $("#captcha").val();
            if(username === '' || email === '' || password === '' || phoneNumber === ''){
                return;
            }
            //验证码
            if(captcha === ''){
                alert("请输入验证码");
                return;
            }
            //与session中的验证码比较
            //发送数据到后端保存
            var json = {
                "username":username,
                "password":password,
                "email":email,
                "phone":phoneNumber
            };
            $.ajax({
                url:'${pageContext.request.contextPath}/register/saveUser',
                data:JSON.stringify(json),
                type:'POST',
                contentType:'application/json;charset=utf-8',
                dataType:'json',
                success:function (res) {
                    if(res.type === 'success'){
                        alert("注册成功，点击确定前往登录界面");
                        location.href = '${pageContext.request.contextPath}/system/login';
                    }else{
                        alert("注册失败，请联系管理员");
                    }
                }
            });

        })

    })
</script>
<body>
<div class="register py-container ">
    <!--head-->
    <div class="py-container logoArea" style="margin-left:-500px ">
        <a href="${pageContext.request.contextPath}/" class="logo-bd"></a>
    </div>
    <!--register-->
    <div class="registerArea">
        <h3>注册新用户<span class="go">我有账号，去<a href="login.html">登陆</a></span></h3>
        <div class="info">
            <form class="sui-form form-horizontal" autocomplete="off">
                <div class="control-group">
                    <label class="control-label">用户名：</label>
                    <div class="controls">
                        <input id="username" type="text" class="input-xfat input-xlarge" placeholder="用户名">
                    </div>
                    <div id="usernameError" style="margin-left: 50px;font-size: 15px;color: red">

                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">邮箱：</label>
                    <div class="controls">
                        <input id="email" type="text" class="input-xfat input-xlarge" placeholder="邮箱">
                    </div>
                    <div id="eamilError" style="margin-left: 50px;font-size: 15px;color: red">

                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">登录密码：</label>
                    <div class="controls">
                        <input id="password" type="password" class="input-xfat input-xlarge" placeholder="设置登录密码">
                    </div>
                    <div id="passwordError" style="margin-left: 50px;font-size: 15px;color: red">

                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">手机号：</label>
                    <div class="controls">
                        <input id="phone" type="text" class="input-xfat input-xlarge" placeholder="请输入手机号">
                    </div>
                    <div id="phoneError" style="margin-left: 50px;font-size: 15px;color: red">

                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">短信验证码：</label>
                    <div class="">
                        <input id="captcha" type="text" class="yzm" placeholder="请输入验证码">
                        <button id="send">点击发送验证码</button>
                    </div>
                </div>
                <div class="control-group">
                    <span class="control-label">&nbsp;</span>
                    <label class="controls">
                        <input name="m1" type="checkbox" checked>
                        <span>同意协议并注册《喜瑞斯用户协议》</span>
                    </label>
                </div>
                <div class="control-group">
                    <span class="control-label"></span>
                    <div class="controls btn-reg">
                        <a class="sui-btn btn-block btn-xlarge btn-danger" href="#">完成注册</a>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
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
</body>
</html>