<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
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
        $("#star").click(function () {
            var goods_id = $(".id").val();
            var username = $(".username").val();
            $.ajax({
                url:'${pageContext.request.contextPath}/goods/collectGoods?goods_id='+goods_id+'&username='+username+'',
                type:'GET',
                dataType:'json',
                success:function (res) {
                    $('.alert').html(res.msg).addClass('alert-success').show().delay(1500).fadeOut();
                }
            })
        });
    });
</script>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>商品详情页</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/pages-item.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/pages-zoom.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/widget-cartPanelView.css" />
</head>
<body>
<style>
    .alert {
        display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        min-width: 200px;
        margin-left: -100px;
        z-index: 99999;
        padding: 15px;
        border: 1px solid transparent;
        border-radius: 4px;
    }

    .alert-success {
        color: #3c763d;
        background-color: #dff0d8;
        border-color: #d6e9c6;
    }

    .alert-info {
        color: #31708f;
        background-color: #d9edf7;
        border-color: #bce8f1;
    }

    .alert-warning {
        color: #8a6d3b;
        background-color: #fcf8e3;
        border-color: #faebcc;
    }

    .alert-danger {
        color: #a94442;
        background-color: #f2dede;
        border-color: #ebccd1;
    }
</style>
<!--页面顶部 开始-->
<div class="alert"></div>
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
                        <li class="f-item" id="service">
                            <span>客户服务</span>
                            <ul class="service">
                                <li><a href="cooperation.html" target="_blank">合作招商</a></li>
                                <li><a href="shoplogin.html" target="_blank">商家后台</a></li>
                                <li><a href="cooperation.html" target="_blank">合作招商</a></li>
                                <li><a href="#">商家后台</a></li>
                            </ul>
                        </li>
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
                        <a class="logo-bd" title="喜瑞斯" href="${pageContext.request.contextPath}/"></a>
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
                                <div class="clearfix shopcarlist" id="shopcarlist" style="display:none">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="yui3-g NavList">
                    <div class="yui3-u Left all-sort" onclick="location.href='${pageContext.request.contextPath}/goods/goodsList?cat_id=${goods.cat_id}&currentPage=1'">
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
                            <li class="f-item">有趣</li>
                        </ul>
                    </div>
                    <div class="yui3-u Right"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--页面顶部 结束-->
<div class="py-container">
    <div id="item">
        <div class="crumb-wrap">
        </div>
        <!--product-info-->
        <div class="product-info">
            <div class="fl preview-wrap">
                <!--放大镜效果-->
                <div class="zoom">
                    <!--默认第一个预览-->
                    <div id="preview" style="width: 420px" class="spec-preview">
                        <span class="jqzoom"><img style="width: 410px" jqimg=${goods.image1} src=${goods.image1} /></span>
                    </div>
                    <!--下方的缩略图-->
                    <div class="spec-scroll">
                        <a class="prev">&lt;</a>
                        <!--左右按钮-->
                        <div class="items">
                            <ul>
                                <li><img src= ${goods.image1}  jqimg=${goods.image1} onmousemove="preview(this)"/></li>
                                <li><img src= ${goods.image2}  jqimg=${goods.image2} onmousemove="preview(this)"/></li>
                                <li><img src= ${goods.image3}  jqimg=${goods.image3} onmousemove="preview(this)"/></li>
                                <li><img src= ${goods.image4}  jqimg=${goods.image4} onmousemove="preview(this)" /></li>
                                <li><img src= ${goods.image5}  jqimg=${goods.image5} onmousemove="preview(this)" /></li>
                            </ul>
                        </div>
                        <a class="next">&gt;</a>
                    </div>
                </div>
            </div>
            <div class="fr itemInfo-wrap">
                <div class="sku-name">
                    <h3>${goods.goods_name}</h3>
                </div>
                <div class="news"><span></span></div>
                <div class="summary">
                    <div class="summary-wrap">
                        <div class="fl title">
                            <i>价　　格</i>
                        </div>
                        <div class="fl price">
                            <i>¥</i>
                            <em>${goods.goods_price}</em>
                            <span>降价通知</span>
                        </div>
                        <div class="fr remark">
                            <i>累计评价</i><em>67373</em>
                        </div>
                    </div>
                    <div class="summary-wrap">
                        <div class="fl title">
                            <i>促　　销</i>
                        </div>
                        <div class="fl fix-width">
                            <i class="red-bg">暂无促销活动</i>
                            <em class="t-gray"></em>
                        </div>
                    </div>
                </div>
                <div class="support">
                    <div class="summary-wrap">
                        <div class="fl title">
                            <i>支　　持</i>
                        </div>
                        <div class="fl fix-width">
                            <em class="t-gray">以旧换新 礼品购</em>
                        </div>
                    </div>
                    <div class="summary-wrap">
                        <div class="fl title">
                            <i>库    存</i>
                        </div>
                        <div class="fl fix-width">
                            <em class="t-gray">${goods.goods_number}</em>
                        </div>
                    </div>
                    <div class="summary-wrap">
                        <div class="fl title">

                        </div>
                        <div class="fl fix-width">
                            <em class="t-gray"></em>
                        </div>
                    </div>
                </div>
                <div class="clearfix choose">
                    <div id="specification" class="summary-wrap clearfix">
                        <div class="fl">
                            <ul class="btn-choose unstyled">
                                <c:if test="${goods.goods_number != 0}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/goods/addCart?userName=${Username}&goods_id=${goods.goods_id}" target="_blank" class="sui-btn  btn-danger addshopcar">加入购物车</a>
                                </li>
                                </c:if>
                                <c:if test="${goods.goods_number == 0}">
                                    <li>
                                        <a href="" target="" class="sui-btn  btn-danger addshopcar">无货</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div>
                        <div class="fl" style="">
                            <ul class="btn-choose unstyled">
                                <li>
                                    <a href="#"  class="sui-btn" style="background: yellowgreen;font-size: 16px;padding: 10px 25px;color: white" id="star">加入收藏<input class="id" hidden value="${goods.goods_id}">
                                        <input class="username" hidden value="${Username}"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--product-detail-->
        <div class="clearfix product-detail">
            <div class="fl aside">
                <ul class="sui-nav nav-tabs tab-wraped">
                    <li class="active">
                        <a href="#index" data-toggle="tab">
                            <span>为你推荐</span>
                        </a>
                    </li>
                    <li>
                        <a href="#profile" data-toggle="tab">
                            <span>推荐品牌</span>
                        </a>
                    </li>
                </ul>
                <div class="tab-content tab-wraped">
                    <div id="index" class="tab-pane active">
                        <ul class="goods-list unstyled">
                            <li>
                                <div class="list-wrap">
                                    <div class="p-img">
                                        <img src="${pageContext.request.contextPath}/static/img/_/part01.png" />
                                    </div>
                                    <div class="attr">
                                        <em>Apple苹果iPhone 6s (A1699)</em>
                                    </div>
                                    <div class="price">
                                        <strong>
                                            <em>¥</em>
                                            <i>6088.00</i>
                                        </strong>
                                    </div>
                                    <div class="operate">
                                        <a href="javascript:void(0);" class="sui-btn btn-bordered">加入购物车</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="list-wrap">
                                    <div class="p-img">
                                        <img src="${pageContext.request.contextPath}/static/img/_/part02.png" />
                                    </div>
                                    <div class="attr">
                                        <em>Apple苹果iPhone 6s (A1699)</em>
                                    </div>
                                    <div class="price">
                                        <strong>
                                            <em>¥</em>
                                            <i>6088.00</i>
                                        </strong>
                                    </div>
                                    <div class="operate">
                                        <a href="javascript:void(0);" class="sui-btn btn-bordered">加入购物车</a>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="list-wrap">
                                    <div class="p-img">
                                        <img src="${pageContext.request.contextPath}/static/img/_/part03.png" />
                                    </div>
                                    <div class="attr">
                                        <em>Apple苹果iPhone 6s (A1699)</em>
                                    </div>
                                    <div class="price">
                                        <strong>
                                            <em>¥</em>
                                            <i>6088.00</i>
                                        </strong>
                                    </div>
                                    <div class="operate">
                                        <a href="javascript:void(0);" class="sui-btn btn-bordered">加入购物车</a>
                                    </div>
                                </div>
                                <div class="list-wrap">
                                    <div class="p-img">
                                        <img src="${pageContext.request.contextPath}/static/img/_/part02.png" />
                                    </div>
                                    <div class="attr">
                                        <em>Apple苹果iPhone 6s (A1699)</em>
                                    </div>
                                    <div class="price">
                                        <strong>
                                            <em>¥</em>
                                            <i>6088.00</i>
                                        </strong>
                                    </div>
                                    <div class="operate">
                                        <a href="javascript:void(0);" class="sui-btn btn-bordered">加入购物车</a>
                                    </div>
                                </div>
                                <div class="list-wrap">
                                    <div class="p-img">
                                        <img src="${pageContext.request.contextPath}/static/img/_/part03.png" />
                                    </div>
                                    <div class="attr">
                                        <em>Apple苹果iPhone 6s (A1699)</em>
                                    </div>
                                    <div class="price">
                                        <strong>
                                            <em>¥</em>
                                            <i>6088.00</i>
                                        </strong>
                                    </div>
                                    <div class="operate">
                                        <a href="javascript:void(0);" class="sui-btn btn-bordered">加入购物车</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="profile" class="tab-pane">
                        <p>推荐品牌</p>
                    </div>
                </div>
            </div>
            <div class="fr detail">
                <div class="clearfix fitting">
                    <h4 class="kt">商品详情</h4>
                </div>
                <div style="width: 980px">
                    <image class="" src=${goods.goods_introduce} mode="aspectFit" />
                </div>
            </div>
        </div>
        <!--页面底部  开始 -->
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
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.easing/jquery.easing.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/sui/sui.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.jqzoom/jquery.jqzoom.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.jqzoom/zoom.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pages/index.js"></script>
        <!--页面底部  结束 -->
</body>
</html>