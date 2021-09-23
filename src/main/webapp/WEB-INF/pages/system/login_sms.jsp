<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>短信验证登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles/page-account.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>

<script>
    $(function () {
        $("#send").click(function () {
            var phone = $("#phone").val();
            if(phone === ''){
                alert("请输入手机号");
            }else{
                $.ajax({
                    url:'${pageContext.request.contextPath}/login/sendSms',
                    data:phone,
                    type:'POST',
                    contentType:'application/json;charset=utf-8',
                    dataType:'json',
                    success:function (res) {
                        if(res.type === 'success'){
                            alert("发送成功，请勿反复点击");
                        }else{
                            alert(res.msg)
                        }
                    }
                })
            }
        });
        $("#submit").click(function () {
            var password = $("#password").val();
            if(password === ''){
                alert("请输入短信验证码");
                return false;
            }
            $.ajax({
                url:'${pageContext.request.contextPath}/login/testSms',
                data:password,
                type:'POST',
                contentType:'application/json;charset=utf-8',
                dataType:'json',
                success:function (res) {
                    if(res.type === 'success'){
                        location.href = '${pageContext.request.contextPath}/';
                    }else{
                        alert(res.msg);
                    }
                }
            });
        })
    });
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
                    <li><a href="${pageContext.request.contextPath}/system/login" data-toggle="tab">账户登录</a></li>
                    <li class="active"><a href="#profile" data-toggle="tab">短信验证登录</a></li>
                </ul>
                <div class="tab-content tab-wraped">
                    <div id="index" class="tab-pane">
                        <p>啦啦啦</p>
                    </div>
                    <div id="profile" class="tab-pane active">
                        <form class="sui-form"autocomplete="off">
                            <div class="input-prepend">
                                <span class="add-on loginname"></span>
                                <input type="text" id="phone" class="span2 input-xfat" placeholder="手机号">
                            </div>
                            <div class="input-prepend">
                                <span class="add-on loginpwd"></span>
                                <input type="text" id="password" class="span2 input-xfat" placeholder="短信验证码">
                            </div>
                            <div class="setting">
                                <label class="checkbox inline"></label>
                                <span><button type="button" id="send">点击发送验证码</button></span>
                            </div>
                            <div class="logined">
                                <a id="submit" class="sui-btn btn-block btn-xlarge btn-danger" href="#">登&nbsp;&nbsp;录</a>
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