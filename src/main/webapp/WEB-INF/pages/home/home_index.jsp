<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>我的订单</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/pages-seckillOrder.css" />

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
                            <li class="f-item"><a href="seckill-index.html" target="_blank">秒杀</a></li>
                        </ul>
                    </div>
                    <div class="yui3-u Right"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery/jquery.min.js"></script>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/widget/nav.js"></script>
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
</body>
<!--header-->
<div id="account">
    <div class="py-container">
        <div class="yui3-g home">
            <!--左侧列表-->
            <div class="yui3-u-1-6 list">
                <div class="list-items">
                    <dl>
                        <dt><i>·</i> 订单中心</dt>
                        <dd ><a href="${pageContext.request.contextPath}/system/toHome?username=${Username}&currentPage=1"  class="list-active" >我的订单</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/system/toOrderList?username=${Username}&order_status=0&currentPage=1" >待付款</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/system/toOrderList?username=${Username}&order_status=1&currentPage=1"  >待发货</a></dd>
                        <dd><a href="${pageContext.request.contextPath}/system/toOrderList?username=${Username}&order_status=2&currentPage=1" >待收货</a></dd>
                    </dl>
                    <dl>
                        <dt><i>·</i> 我的中心</dt>
                        <dd><a href="${pageContext.request.contextPath}/goods/toCollect?username=${Username}&currentPage=1">我的收藏</a></dd>
                    </dl>
                    <dl>
                        <dt><i>·</i> 设置</dt>
                        <dd><a href="${pageContext.request.contextPath}/system/toAddress?username=${Username}"  >地址管理</a></dd>
                    </dl>
                </div>
            </div>
            <!--右侧主内容-->
            <div class="yui3-u-5-6 order-pay">
                <div class="body">
                    <div class="table-title">
                        <table class="sui-table  order-table">
                            <tr>
                                <thead>
                                <th width="35%">宝贝</th>
                                <th width="5%">单价</th>
                                <th width="5%">数量</th>
                                <th width="8%">商品操作</th>
                                <th width="10%">实付款</th>
                                <th width="10%">交易状态</th>
                                <th width="10%">交易操作</th>
                                </thead>
                            </tr>
                        </table>
                    </div>
                    <div class="order-detail">
                        <c:forEach items="${page.list}" var="order">
                        <div class="orders">
                            <!--order1-->
                            <div class="choose-title">
                                <label>
                                    <span>　创建日期：${order.orders.get(0).create_time}　订单编号：${order.order_num} </span>
                                </label>
                                <a href="${pageContext.request.contextPath}/system/toOrderDetail?orderNum=${order.order_num}" style="margin-left: 450px">查看详情</a>
                            </div>
                            <table class="sui-table table-bordered order-datatable">
                                <tbody>
                                <!-- 开始二级遍历 -->
                                <c:forEach items="${order.orders}" var="item">
                                <tr>
                                    <td width="35%">
                                        <div class="typographic"><img width="20%" src="${item.goods.image1}" />
                                            <a href="${pageContext.request.contextPath}/goods/goodsDetail?goods_id=${item.goods.goods_id}" class="block-text">${item.goods.goods_name}</a>
                                            <span class="guige"></span>
                                        </div>
                                    </td>
                                    <td width="5%" class="center">
                                        <ul class="unstyled">
                                            <li>${item.goods.goods_price}</li>
                                        </ul>
                                    </td>
                                    <td width="5%" class="center">${item.buy_counts}</td>
                                    <td width="8%" class="center">
                                        <a href="${pageContext.request.contextPath}/goods/goodsDetail?goods_id=${item.goods.goods_id}" class="">再次购买</a><br>
                                        <a href="${pageContext.request.contextPath}/pay/deleteOrder?username=${Username}&currentPage=${page.currentPage}&order_id=${item.id}" class="delete">删除订单<input class="id" hidden value="${item.id}"></a>
                                    </td>
                                    <td width="10%" class="center" >
                                        <ul class="unstyled">
                                            <li>${item.paid_amount}</li>
                                            <li>（含运费：￥0.00）</li>
                                        </ul>
                                    </td>
                                    <td width="10%" class="center">
                                        <c:if test="${item.order_status == 0}">
                                        <ul class="unstyled">
                                            <li>等待付款</li>
                                        </ul>
                                        </c:if>
                                        <c:if test="${item.order_status == 1}" >
                                            <ul class="unstyled">
                                                <li>待发货</li>
                                            </ul>
                                        </c:if>
                                        <c:if test="${item.order_status == 2}">
                                            <ul class="unstyled">
                                                <li>待收货</li>
                                            </ul>
                                        </c:if>
                                        <c:if test="${item.order_status == 3}">
                                            <ul class="unstyled">
                                                <li>已完成</li>
                                            </ul>
                                        </c:if>
                                    </td>
                                    <td width="10%" class="center">
                                        <c:if test="${item.order_status == 0}">
                                            <ul class="unstyled">
                                                <li><a href="${pageContext.request.contextPath}/pay/toPay?orderNum=${item.order_num}&totalPrice=${item.order_amount}&subject=&addressId=${item.address.address_id}&username=${Username}" class="sui-btn btn-info pay">立即支付</a></li>
                                            </ul>
                                        </c:if>
                                        <c:if test="${item.order_status == 1}" >
                                            <ul class="unstyled">
                                                <li><a href="#" class="sui-btn btn-info send">提醒发货</a></li>
                                            </ul>
                                        </c:if>
                                        <c:if test="${item.order_status == 2}">
                                            <ul class="unstyled">
                                                <li><a href="#" class="sui-btn btn-info receive">确认收货</a></li>
                                            </ul>
                                        </c:if>
                                        <c:if test="${item.order_status == 3}">
                                            <ul class="unstyled">
                                                <li><a href="${pageContext.request.contextPath}/system/toDeveloping" class="sui-btn btn-info">去评价</a></li>
                                            </ul>
                                        </c:if>
                                    </td>
                                </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        </c:forEach>
                        <div class="choose-order">
                            <%--分页开始--%>
                                <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/page.css">
                                <script src="${pageContext.request.contextPath}/static/js/jquery.z-pager.js" type="text/javascript" charset="utf-8"></script>
                                <div id="pager" class="pager clearfix" style="float: right">
                                </div>
                                <script type="text/javascript">
                                    $("#pager").zPager({
                                        totalData: ${page.totalCount},
                                        current: ${page.currentPage},
                                        pageCount: ${page.totalPage}, //总页数
                                        pageData: ${page.pageSizes},
                                        minPage: 1,
                                        prevBtn: 'pg-prev', //上一页按钮
                                        nextBtn: 'pg-next', //下一页按钮
                                        btnShow: true,
                                        ajaxSetData: false
                                    });

                                    function currentPage(currentPage){
                                        /*
                                            触发页码数位置： Page/js/jquery.z-pager.js 64行
                                        */
                                        console.log("当前页码数：" + currentPage);
                                        if(currentPage !== ${page.currentPage}){
                                            location.href = "${pageContext.request.contextPath}/system/toHome?username=${Username}&currentPage="+currentPage+"";
                                        }
                                    }
                                </script>
                            <%--分页结束--%>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
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
<script>
    $(function () {
        //绑定相关的事件
        $(".send").click(function () {
            alert("提醒商家发货成功");
        })
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
<!--页面底部END-->
undefined

</html>