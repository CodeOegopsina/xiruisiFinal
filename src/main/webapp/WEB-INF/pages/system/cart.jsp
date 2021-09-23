<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>我的购物车</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/pages-cart.css" />
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
    window.onbeforeunload = function () {
        var scrollPos;
        if (typeof window.pageYOffset != 'undefined') {
            scrollPos = window.pageYOffset;
        }
        else if (typeof document.compatMode != 'undefined' &&
            document.compatMode != 'BackCompat') {
            scrollPos = document.documentElement.scrollTop;
        }
        else if (typeof document.body != 'undefined') {
            scrollPos = document.body.scrollTop;
        }
        document.cookie = "scrollTop=" + scrollPos; //存储滚动条位置到cookies中
    }

    window.onload = function () {
        if (document.cookie.match(/scrollTop=([^;]+)(;|$)/) != null) {
            var arr = document.cookie.match(/scrollTop=([^;]+)(;|$)/); //cookies中不为空，则读取滚动条位置
            document.documentElement.scrollTop = parseInt(arr[1]);
            document.body.scrollTop = parseInt(arr[1]);
        }
    }
</script>
<script>
    $(function () {
        var total = $("input[name='check']").length;
        $('#totalNum').html( total );
        $("#all").html(" "+total);
        var totalPrice = 0;
        var username = '${Username}';
        if(username === ''){
            $("#showUsername").html("请<a href=\"${pageContext.request.contextPath}/system/login\">登录</a>\n" +
                "                            <span><a href=\"${pageContext.request.contextPath}/system/register\">免费注册</a></span>")
        }else{
            $("#showUsername").html(""+username+" <a href='${pageContext.request.contextPath}/login/logout'>退出登录</a>");
        }
        //处理全选
        $("#allCheck").click(function () {
            $("input[name='check']").prop("checked",this.checked);
        });
        $('input[type=checkbox]').click(
            function () {
                $('#totalNum').empty();
                var len = $("input[name=check]:checkbox:checked").length;
                if(len !== total){
                    $("#allCheck").prop("checked",false);
                }
                $('#totalNum').append(len);
            }
        );
        //计算总价
        $("input[name=check]:checkbox:checked").parent().next().next().next().next().children().each(function (index,element) {
            totalPrice += parseFloat(element.innerHTML);
        });
        $("#totalPrice").html(totalPrice.toFixed(2));
        //取消选择修改数据表属性
        $("input[name='check']").click(function () {
            //修改
            $.ajax({
                url:'${pageContext.request.contextPath}/goods/isChecked?goods_id='+this.value+'&username=${Username}',
                type:'GET',
                dataType:'json',
                success:function (res) {
                    $("#totalPrice").html(res.totalPrice.toFixed(2));
                }
            })
        });
    });
</script>
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
        <a id="logo" href="${pageContext.request.contextPath}/" class="fl logo" style="margin-top: 20px"><div class="title" style="margin-top: 10px">购物车</div></a>
        <div class="fr search">
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
    </div>
    <!--All goods-->
    <div class="allgoods">
        <h4>全部商品<span id="all"></span></h4>
        <div class="cart-main">
            <div class="yui3-g cart-th">
                <div class="yui3-u-1-4"><input type="checkbox" name="" id="allCheck" value=""  checked/> 全部</div>
                <div class="yui3-u-1-4">商品</div>
                <div class="yui3-u-1-8">单价（元）</div>
                <div class="yui3-u-1-8">数量</div>
                <div class="yui3-u-1-8">小计（元）</div>
                <div class="yui3-u-1-8">操作</div>
            </div>
            <c:if test="${not empty cart}">
            <div class="cart-item-list">
                <div class="cart-body">
                    <c:forEach items="${cart}" var="goods">
                    <div class="cart-list">
                        <ul class="goods-list yui3-g">
                            <li class="yui3-u-1-24">
                                <input type="checkbox" name="check" checked value="${goods.goods.goods_id}"/>
                            </li>
                            <li class="yui3-u-11-24">
                                <div class="good-item">
                                    <div class="item-img"><img src="${goods.goods.image1}" style="width: 80%"/></div>
                                    <div class="item-msg">${goods.goods.goods_name}</div>
                                </div>
                            </li>
                            <li class="yui3-u-1-8"><span class="price">${goods.goods.goods_price}</span></li>
                            <li class="yui3-u-1-8">
                                <a href="${pageContext.request.contextPath}/goods/cartNumberMin?goods_id=${goods.goods.goods_id}&username=${Username}" class="increment mins">-</a>
                                <input autocomplete="off" value="${goods.number}" class="itxt" />
                                <a href="${pageContext.request.contextPath}/goods/cartNumberPlus?goods_id=${goods.goods.goods_id}&username=${Username}" class="increment plus">+</a>
                            </li>
                            <li class="yui3-u-1-8"><span class="sum">${goods.goods.goods_price * goods.number}</span></li>
                            <li class="yui3-u-1-8">
                                <a href="${pageContext.request.contextPath}/goods/deleteCart?goods_id=${goods.goods.goods_id}&username=${Username}">删除</a><br/>
                            </li>
                        </ul>
                    </div>
                    </c:forEach>
                </div>
            </div>
            </c:if>
            <c:if test="${empty cart}">
                <div class="cart-item-list">
                    <img src="https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1589809676702&di=960cb07044bf4c8d2fb84d2f7fe591d2&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fe1b1467beea0a9c7d6a56b32bac6d7e5dcd914f7c3e6-YTwUd6_fw658" alt="">
                </div>
            </c:if>
        </div>
        <div class="cart-tool" style="margin-bottom: 40px">
            <div class="select-all">
            </div>
            <div class="option">
            </div>
            <div class="toolbar">
                <div class="chosed">已选择<span id="totalNum"></span>件商品</div>
                <div class="sumprice">
                    <span><em>总价（不含运费） ：</em><i class="summoney">¥<span id="totalPrice"></span></i></span>
                </div>
                <div class="sumbtn">
                    <%--懒得再计算，把总数和总价格传过去--%>
                    <a class="sum-btn" href='${pageContext.request.contextPath}/goods/getOrder?username=${Username}'>结算</a>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/widget/nav.js"></script>
</body>

</html>