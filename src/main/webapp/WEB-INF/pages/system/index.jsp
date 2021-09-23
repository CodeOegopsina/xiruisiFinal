<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
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
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>喜瑞斯，67373upup!</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/pages-JD-index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/widget-jquery.autocomplete.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/widget-cartPanelView.css" />
</head>

<body>
<!-- 头部栏位 -->
<!--页面顶部-->
<div id="nav-bottom">
    <!--顶部-->
    <div class="nav-top">
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
                        <li class="f-item">网站导航</li>
                    </ul>
                </div>
            </div>
        </div>
        <!--头部-->
        <div class="header">
            <div class="py-container">
                <div class="yui3-g Logo">
                    <div class="yui3-u Left logoArea">
                        <a class="logo-bd" title="喜瑞斯" href="${pageContext.request.contextPath}/" target="_blank"></a>
                    </div>
                    <div class="yui3-u Center searchArea">
                        <div class="search">
                            <form action="" class="sui-form form-inline">
                                <!--searchAutoComplete-->
                                <div class="input-append">
                                    <input type="text" id="autocomplete" type="text" class="input-error input-xxlarge" />
                                    <button class="sui-btn btn-xlarge btn-danger" type="button" id="search">搜索</button>
                                </div>
                                <script>
                                    $(function () {
                                        $("#search").click(function () {
                                            location.href = '${pageContext.request.contextPath}/goods/searchGoods?goods_name='+$("#autocomplete").val()+'&currentPage=1'
                                        })
                                    })
                                </script>
                            </form>
                        </div>
                        <div class="hotwords">
                            <ul>
                                <li class="f-item">喜瑞斯首发</li>
                                <li class="f-item">亿元优惠</li>
                                <li class="f-item">9.9元团购</li>
                                <li class="f-item">每满99减30</li>
                                <li class="f-item">亿元优惠</li>
                                <li class="f-item">9.9元团购</li>
                                <li class="f-item">办公用品</li>

                            </ul>
                        </div>
                    </div>
                    <div class="yui3-u Right shopArea">
                        <div class="fr shopcar">
                            <div class="show-shopcar" id="shopcar">
                                <span class="car"></span>
                                <a class="sui-btn btn-default btn-xlarge" href="${pageContext.request.contextPath}/goods/toCart?username=${Username}" target="_blank">
                                    <span>我的购物车</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="yui3-g NavList">
                    <div class="yui3-u Left all-sort">
                        <h4>全部商品分类</h4>
                    </div>
                    <div class="yui3-u Center navArea">
                        <ul class="nav">
                            <li class="f-item">服装城</li>
                            <li class="f-item">美妆馆</li>
                            <li class="f-item">喜瑞斯超市</li>
                            <li class="f-item">全球购</li>
                            <li class="f-item">闪购</li>
                            <li class="f-item">团购</li>
                            <li class="f-item"><a href="${pageContext.request.contextPath}/system/toDeveloping" target="_blank">秒杀</a></li>
                        </ul>
                    </div>
                    <div class="yui3-u Right"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--列表-->
<div class="sort">
    <div class="py-container">
        <div class="yui3-g SortList ">
            <div class="yui3-u Left all-sort-list">
                <div class="all-sort-list2">
                    <c:forEach items="${catList}" var="cat">
                        <div class="item">
                            <h3><a href="${pageContext.request.contextPath}/goods/goodsList?cat_id=${cat.cat_id}&currentPage=1">${cat.cat_name}</a></h3>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="yui3-u Center banerArea">
                <!--banner轮播-->
                <div id="myCarousel" data-ride="carousel" data-interval="4000" class="sui-carousel slide">
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <a href="#">
                                <img src="https://s1.ax1x.com/2020/05/25/t9RxHO.jpg" />
                            </a>
                        </div>
                        <c:forEach items="${image}" var="item">
                        <div class="item">
                            <a href="#">
                                <img src=${item.c_img} />
                            </a>
                        </div>
                        </c:forEach>
                    </div><a href="#myCarousel" data-slide="prev" class="carousel-control left">‹</a><a href="#myCarousel" data-slide="next" class="carousel-control right">›</a>
                </div>
            </div>
            <div class="yui3-u Right">
                <div class="news">
                    <h4><em class="fl">喜瑞斯快报</em><span class="fr tip">更多 ></span></h4>
                    <div class="clearix"></div>
                    <ul class="news-list unstyled">
                        <li>
                            <span class="bold">[特惠]</span>备战开学季 全民半价购数码
                        </li>
                        <li>
                            <span class="bold">[公告]</span>备战开学季 全民半价购数码
                        </li>
                        <li>
                            <span class="bold">[特惠]</span>备战开学季 全民半价购数码
                        </li>
                        <li>
                            <span class="bold">[公告]</span>备战开学季 全民半价购数码
                        </li>
                        <li>
                            <span class="bold">[特惠]</span>备战开学季 全民半价购数码
                        </li>
                    </ul>
                </div>
                <ul class="yui3-g Lifeservice">
                    <li class="yui3-u-1-4 life-item tab-item">
                        <i class="list-item list-item-1"></i>
                        <span class="service-intro">话费</span>
                    </li>
                    <li class="yui3-u-1-4 life-item tab-item">
                        <i class="list-item list-item-2"></i>
                        <span class="service-intro">机票</span>
                    </li>
                    <li class="yui3-u-1-4 life-item tab-item">
                        <i class="list-item list-item-3"></i>
                        <span class="service-intro">电影票</span>
                    </li>
                    <li class="yui3-u-1-4 life-item tab-item">
                        <i class="list-item list-item-4"></i>
                        <span class="service-intro">游戏</span>
                    </li>
                    <li class="yui3-u-1-4 life-item notab-item">
                        <i class="list-item list-item-5"></i>
                        <span class="service-intro">彩票</span>
                    </li>
                    <li class="yui3-u-1-4 life-item notab-item">
                        <i class="list-item list-item-6"></i>
                        <span class="service-intro">加油站</span>
                    </li>
                    <li class="yui3-u-1-4 life-item notab-item">
                        <i class="list-item list-item-7"></i>
                        <span class="service-intro">酒店</span>
                    </li>
                    <li class="yui3-u-1-4 life-item notab-item">
                        <i class="list-item list-item-8"></i>
                        <span class="service-intro">火车票</span>
                    </li>
                    <li class="yui3-u-1-4 life-item  notab-item">
                        <i class="list-item list-item-9"></i>
                        <span class="service-intro">众筹</span>
                    </li>
                    <li class="yui3-u-1-4 life-item notab-item">
                        <i class="list-item list-item-10"></i>
                        <span class="service-intro">理财</span>
                    </li>
                    <li class="yui3-u-1-4 life-item notab-item">
                        <i class="list-item list-item-11"></i>
                        <span class="service-intro">礼品卡</span>
                    </li>
                    <li class="yui3-u-1-4 life-item notab-item">
                        <i class="list-item list-item-12"></i>
                        <span class="service-intro">白条</span>
                    </li>
                </ul>
                <div class="life-item-content">
                    <div class="life-detail">
                        <i class="close">关闭</i>
                        <p>话费充值</p>
                        <form action="" class="sui-form form-horizontal">
                            号码：<input type="text" id="inputphoneNumber" placeholder="输入你的号码" />
                        </form>
                        <button class="sui-btn btn-danger">快速充值</button>
                    </div>
                    <div class="life-detail">
                        <i class="close">关闭</i> 机票
                    </div>
                    <div class="life-detail">
                        <i class="close">关闭</i> 电影票
                    </div>
                    <div class="life-detail">
                        <i class="close">关闭</i> 游戏
                    </div>
                </div>
                <div class="ads">
                    <img src="${pageContext.request.contextPath}/static/img/ad1.png" />
                </div>
            </div>
        </div>
    </div>
</div>
<!--推荐-->
<div class="show">
    <div class="py-container">
        <ul class="yui3-g Recommend">
            <li class="yui3-u-1-6  clock">
                <div class="time">
                    <img src="${pageContext.request.contextPath}/static/img/clock.png" />
                    <h3>今日推荐</h3>
                </div>
            </li>
            <li class="yui3-u-5-24">
                <a href="#" target="_blank"><img src="${pageContext.request.contextPath}/static/img/today01.png" alt="" /></a>
            </li>
            <li class="yui3-u-5-24">
                <img src="${pageContext.request.contextPath}/static/img/today02.png" alt=""/>
            </li>
            <li class="yui3-u-5-24">
                <img src="${pageContext.request.contextPath}/static/img/today03.png" alt=""/>
            </li>
            <li class="yui3-u-5-24">
                <img src="${pageContext.request.contextPath}/static/img/today04.png" alt=""/>
            </li>
        </ul>
    </div>
</div>
<style>
    .test{
        width:130px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;
    }
</style>
<!--喜欢-->
<div class="like">
    <div class="py-container">
        <div class="title">
            <h3 class="fl">为你推荐</h3>
        </div>
        <div class="bd">
            <ul class="clearfix yui3-g Favourate picLB" id="picLBxxl">
                <%--开始遍历--%>
                <c:forEach items="${likes}" var="goods">
                    <li class="yui3-u-1-6">
                        <dl class="picDl huozhe">
                            <dd>
                                <a href="${pageContext.request.contextPath}/goods/goodsDetail?goods_id=${goods.goods_id}" class="pic"><img src=${goods.image1}></a>
                                <div class="like-text">
                                    <p><div class="test">${goods.goods_name}</div></p>
                                    <h3>¥${goods.goods_price}</h3>
                                </div>
                            </dd>
                        </dl>
                    </li>
                </c:forEach>
                <%--结束遍历--%>
            </ul>
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
<!--页面底部END-->
<!-- 楼层位置 -->

<script type="text/javascript">
    $(function(){
        $("#service").hover(function(){
            $(".service").show();
        },function(){
            $(".service").hide();
        });
        $("#shopcar").hover(function(){
            $("#shopcarlist").show();
        },function(){
            $("#shopcarlist").hide();
        });

    })
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/model/cartModel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/czFunction.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pages/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/widget/cartPanelView.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/widget/jquery.autocomplete.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/widget/nav.js"></script>
</body>


</html>