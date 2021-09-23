<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <!--字体图标-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/icomoon.css" rel="stylesheet" />
    <!--动画-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/animate.css" rel="stylesheet" />
    <!--骨架样式-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/common.css" rel="stylesheet" />
    <!--皮肤（缇娜）-->
    <link href="${pageContext.request.contextPath}/static/javaex/pc/css/skin/tina.css" rel="stylesheet" />
    <!--jquery，不可修改版本-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/lib/jquery-1.7.2.min.js"></script>
    <!--全局动态修改-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/common.js"></script>
    <!--核心组件-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/javaex.min.js"></script>
    <!--表单验证-->
    <script src="${pageContext.request.contextPath}/static/javaex/pc/js/javaex-formVerify.js"></script>
    <title>喜瑞斯后台</title>
    <style>
        .logo{
            width: 60px;
            height: 60px;
            margin-left: 5px;
            margin-top: 1px;
        }
        .logo_name{
            margin-left: 20px;
        }
    </style>
</head>
<body>
<!--顶部导航-->
<div class="admin-navbar">
    <div class="admin-container-fluid clear">
        <!--logo名称-->
        <div class="admin-logo"><image class="logo" src="https://ae01.alicdn.com/kf/H474b2115d8a544b5baaa8b078eb22d2bq.jpg"/>
        </div>
        <div class="admin-logo"><span class="logo_name">喜瑞斯 后台管理</span></div>

        <!--右侧-->
        <ul class="admin-navbar-nav fr">
            <li>
                <a href="javascript:;">欢迎您，管理员</a>
                <ul class="dropdown-menu" style="right: 10px;">
                    <li><a href="${pageContext.request.contextPath}/system/toBackStageLogin">安全退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<!--主题内容-->
<div class="admin-mian">
    <!--左侧菜单-->
    <div class="admin-aside admin-aside-fixed">
        <h1><span class="admin-nav-name">菜单</span></h1>
        <div id="admin-toc" class="admin-toc">
            <div class="menu-box">
                <div id="menu" class="menu">
                    <ul>
                        <li class="menu-item">
                            <a href="javascript:;">首页设置<i class="icon-keyboard_arrow_left"></i></a>
                            <ul>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/backStage/carousel_detail');">轮播图设置</a></li>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/backStage/recommond_detail');">推荐商品设置</a></li>
                            </ul>
                        </li>
                        <li class="menu-item ">
                            <a href="javascript:page('${pageContext.request.contextPath}/backStage/goods_detail?currentPage=1&pageSizes=10');">商品信息管理</a>
                        </li>
                        <li class="menu-item ">
                            <a href="javascript:page('${pageContext.request.contextPath}/backStage/user_detail?currentPage=1&pageSizes=10');">用户信息管理</a>
                        </li>
                        <li class="menu-item">
                            <a href="javascript:;">订单管理<i class="icon-keyboard_arrow_left"></i></a>
                            <ul>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/backStage/getOrderList?order_status=0&currentPage=1&pageSizes=10');">待支付订单</a></li>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/backStage/getOrderList?order_status=1&currentPage=1&pageSizes=10');">待发货订单</a></li>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/backStage/getOrderList?order_status=2&currentPage=1&pageSizes=10');">待收货订单</a></li>
                                <li><a href="javascript:page('${pageContext.request.contextPath}/backStage/getOrderList?order_status=3&currentPage=1&pageSizes=10');">已完成订单</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!--iframe载入内容-->
    <div class="admin-markdown">
        <iframe id="page" src="${pageContext.request.contextPath}/backStage/welcome"></iframe>
    </div>
</div>
</body>
<script>
    var hightUrl = "xxxx";
    javaex.menu({
        id : "menu",
        isAutoSelected : true,
        key : "",
        url : hightUrl
    });

    $(function() {
        // 设置左侧菜单高度
        setMenuHeight();
    });

    /**
     * 设置左侧菜单高度
     */
    function setMenuHeight() {
        var height = document.documentElement.clientHeight - $("#admin-toc").offset().top;
        height = height - 10;
        $("#admin-toc").css("height", height+"px");
    }

    // 控制页面载入
    function page(url) {
        $("#page").attr("src", url);
    }
</script>
</html>
