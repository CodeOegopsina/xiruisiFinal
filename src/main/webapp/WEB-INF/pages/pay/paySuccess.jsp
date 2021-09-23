<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>支付页-成功</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">


    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/pages-paysuccess.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery/jquery.min.js"></script>
    <script>
        $(function () {
            var username = '${Username}';
            if(username === ''){
                $("#showUsername").html("请<a href=\"${pageContext.request.contextPath}/system/login\">登录</a>\n" +
                    "                            <span><a href=\"${pageContext.request.contextPath}/system/register\">免费注册</a></span>")
            }else{
                $("#showUsername").html(""+username+" <a href='${pageContext.request.contextPath}/login/logout'>退出登录</a>");
            }
        });
    </script>
</head>

<body>
<!--head-->
<div class="top">
    <div class="py-container">
        <div class="shortcut">
            <ul class="fl">
                <li class="f-item">喜瑞斯欢迎您！</li>
                <li class="f-item" id="showUsername">

                </li>
            </ul>
            <ul class="fr">
                <li class="f-item"><a href="${pageContext.request.contextPath}/system/toHome?username=${Username}&currentPage=1" target="_blank">我的订单</a></li>
                <li class="f-item space"></li>
                <li class="f-item"><a href="${pageContext.request.contextPath}/system/toHome?username=${Username}&currentPage=1" target="_blank">我的喜瑞斯</a></li>
                <li class="f-item space"></li>
                <li class="f-item">喜瑞斯会员</li>
                <li class="f-item space"></li>
                <li class="f-item">企业采购</li>
                <li class="f-item space"></li>
                <li class="f-item">关注喜瑞斯</li>
                <li class="f-item space"></li>
                <li class="f-item">客户服务</li>
                <li class="f-item space"></li>
                <li class="f-item">网站导航</li>
            </ul>
        </div>
    </div>
</div>
<style>
    #logo{
        color: #000000;
        text-decoration: none;
    }
    #logo:link{
        color: #000000;
        text-decoration: none;
    }
    #logo:visited{
        color: #000000;
        text-decoration: none;
    }
    #logo:hover{
        color: #000000;
        text-decoration: none;
    }
</style>
<div class="cart py-container">
    <!--logoArea-->
    <div class="logoArea">
        <a id="logo" href="${pageContext.request.contextPath}/" class="fl logo" style="margin-top: 20px"><div class="title" style="margin-top: 10px">支付页</div></a>
    </div>
    <!--主内容-->
    <div class="paysuccess">
        <div class="success">
            <h3 style="margin-left: 70px"><img src="${pageContext.request.contextPath}/static/img/_/right.png" width="48" height="48">支付成功啦！</h3>
            <div class="paydetail">
                <p>支付方式：支付宝支付</p>
                <p>支付金额：￥${pageContext.request.getParameter("total_amount")}元</p>
                <p class="button"><a href="${pageContext.request.contextPath}/system/toHome?username=${Username}&currentPage=1" class="sui-btn btn-xlarge btn-danger">查看订单</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.html" class="sui-btn btn-xlarge ">继续购物</a></p>
            </div>
        </div>

    </div>
</div>
<!-- 底部栏位 -->
<!--页面底部-->
<div class="clearfix footer">
    <div class="py-container">
        <div class="footlink">
            <div class="Mod-service">
                <ul class="Mod-Service-list">
                    <li class="grid-service-item intro  intro1">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>喜瑞斯</h4>
                            <p>正品保障，提供发票</p>
                        </div>

                    </li>
                    <li class="grid-service-item  intro intro2">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>多！</h4>
                            <p>品类齐全，轻松购物</p>
                        </div>

                    </li>
                    <li class="grid-service-item intro  intro3">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>快！</h4>
                            <p>多仓直发，极速配送</p>
                        </div>

                    </li>
                    <li class="grid-service-item  intro intro4">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>好！</h4>
                            <p>正品行货，极致服务</p>
                        </div>

                    </li>
                    <li class="grid-service-item intro intro5">

                        <i class="serivce-item fl"></i>
                        <div class="service-text">
                            <h4>省！</h4>
                            <p>天天低价，畅选无忧</p>
                        </div>

                    </li>
                </ul>
            </div>
            <div class="clearfix Mod-list">
                <div class="yui3-g">
                    <div class="yui3-u-1-6">
                        <h4>购物指南</h4>
                        <ul class="unstyled">
                            <li>购物流程</li>
                            <li>会员介绍</li>
                            <li>生活旅行/团购</li>
                            <li>常见问题</li>
                            <li>购物指南</li>
                        </ul>

                    </div>
                    <div class="yui3-u-1-6">
                        <h4>配送方式</h4>
                        <ul class="unstyled">
                            <li>上门自提</li>
                            <li>211限时达</li>
                            <li>配送服务查询</li>
                            <li>配送费收取标准</li>
                            <li>海外配送</li>
                        </ul>
                    </div>
                    <div class="yui3-u-1-6">
                        <h4>支付方式</h4>
                        <ul class="unstyled">
                            <li>货到付款</li>
                            <li>在线支付</li>
                            <li>分期付款</li>
                            <li>邮局汇款</li>
                            <li>公司转账</li>
                        </ul>
                    </div>
                    <div class="yui3-u-1-6">
                        <h4>售后服务</h4>
                        <ul class="unstyled">
                            <li>售后政策</li>
                            <li>价格保护</li>
                            <li>退款说明</li>
                            <li>返修/退换货</li>
                            <li>取消订单</li>
                        </ul>
                    </div>
                    <div class="yui3-u-1-6">
                        <h4>特色服务</h4>
                        <ul class="unstyled">
                            <li>夺宝岛</li>
                            <li>DIY装机</li>
                            <li>延保服务</li>
                            <li>喜瑞斯E卡</li>
                            <li>喜瑞斯通信</li>
                        </ul>
                    </div>
                    <div class="yui3-u-1-6">
                        <h4>帮助中心</h4>
                        <img  width="50%" src="${pageContext.request.contextPath}/static/img/wx_cz.jpg">
                    </div>
                </div>
            </div>
            <div class="Mod-copyright">
                <ul class="helpLink">
                    <li>关于我们<span class="space"></span></li>
                    <li>联系我们<span class="space"></span></li>
                    <li>关于我们<span class="space"></span></li>
                    <li>商家入驻<span class="space"></span></li>
                    <li>营销中心<span class="space"></span></li>
                    <li>友情链接<span class="space"></span></li>
                    <li>关于我们<span class="space"></span></li>
                    <li>营销中心<span class="space"></span></li>
                    <li>友情链接<span class="space"></span></li>
                    <li>关于我们</li>
                </ul>
                <div class="address">地址：天津工业大学 邮编：100096 电话：400-618-4000 传真：010-82935100</div>
                <div class="beian">津ICP备08001421号京公网安备110108007702
                </div>
            </div>
        </div>
    </div>
</div>
<!--页面底部END-->




<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/sui/sui.min.js"></script>
</body>

</html>