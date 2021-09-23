<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>结算页</title>
    <link rel="icon" href="${pageContext.request.contextPath}/static/img/assets/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/pages-getOrderInfo.css" />
</head>

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
        <a id="logo" href="${pageContext.request.contextPath}/" class="fl logo" style="margin-top: 20px"><div class="title" style="margin-top: 10px">结算页</div></a>
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
    <!--主内容-->
    <div class="checkout py-container">
        <div class="checkout-tit">
            <h4 class="tit-txt">填写并核对订单信息</h4>
        </div>
        <div class="checkout-steps">
            <!--收件人信息-->
            <div class="step-tit">
                <h5>收件人信息<span><a data-toggle="modal" data-target=".edit" data-keyboard="false" class="newadd">新增/修改收货地址</a></span></h5>
            </div>
            <div class="step-cont">
                <div class="addressInfo">
                    <ul class="addr-detail">
                        <c:if test="${address == null}">
                        <li class="addr-item">
                            <div>
                                <div class="con name selected"><a href="javascript:;" >姓名&nbsp;<span title="点击取消选择">&nbsp;</span></a></div>
                                <div class="con address">姓名 详细地址 <span style="color: red">请点击右侧添加收货地址</span> <span> 电话</span>
                                    <span class="base">默认地址</span>
                                    <span class="edittext"><a data-toggle="modal" data-target=".edit" data-keyboard="false" ></a>&nbsp;&nbsp;<a href="javascript:;"></a></span>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </li>
                        </c:if>
                        <c:if test="${address != null}">
                            <li class="addr-item">
                                <div>
                                    <div class="con name selected"><a id="realName" href="javascript:;" >${address.realName}&nbsp;<span title="点击取消选择">&nbsp;</span></a></div>
                                    <div class="con address">${address.realName} ${address.address} <span style="color: red"></span> <span> ${address.phone}</span>
                                        <span class="base">默认地址</span>
                                        <span class="edittext"><a data-toggle="modal" data-target=".edit" data-keyboard="false" ></a>&nbsp;&nbsp;<a href="javascript:;"></a></span>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                    <!--添加地址-->
                    <script>
                        $(function () {
                            $("#save").click(function () {
                                $.ajax({
                                    url:'${pageContext.request.contextPath}/goods/saveAddress',
                                    data:$("#form").serialize(),
                                    type:'GET',
                                    contentType:'application/json;charset=utf-8',
                                    dataType:'json',
                                    success:function (res) {
                                        if(res.type === 'success'){
                                            location.reload();
                                        }else{

                                        }
                                    }
                                })
                            })
                        })
                    </script>
                    <div  tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade edit">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                                    <h4 id="myModalLabel" class="modal-title">修改/添加收货地址</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="sui-form form-horizontal" id="form" autocomplete="off">
                                        <%--隐藏域提交用户名--%>
                                        <input type="hidden" value=${Username} name="username">
                                        <div class="control-group">
                                            <label class="control-label">收货人：</label>
                                            <div class="controls">
                                                <input type="text" class="input-medium" name="realName" value="${address.realName}">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label">详细地址：</label>
                                            <div class="controls">
                                                <input type="text" class="input-large" name="address" value="${address.address}" style="width: 360px">
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label class="control-label">联系电话：</label>
                                            <div class="controls">
                                                <input type="text" class="input-medium" name="phone" value="${address.phone}">
                                            </div>
                                        </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" data-ok="modal" id="save" class="sui-btn btn-primary btn-large">确定</button>
                                <button type="button" data-dismiss="modal" class="sui-btn btn-default btn-large">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!--确认地址-->
            </div>
            <div class="hr"></div>

        </div>
        <div class="hr"></div>
        <!--支付和送货-->
        <div class="payshipInfo">
            <div class="step-tit">
                <h5>支付方式</h5>
            </div>
            <div class="step-cont">
                <ul class="payType">
                    <li class="selected">支付宝付款<span title="点击取消选择"></span></li>
                </ul>
            </div>
            <div class="hr"></div>
            <div class="step-tit">
                <h5>送货清单</h5>
            </div>
            <div class="step-cont">
                <c:forEach items="${goods}" var="item">
                <ul class="send-detail">
                    <li>
                        <div class="sendGoods">
                            <!-- 开始遍历 -->
                            <ul class="yui3-g">
                                <li class="yui3-u-1-6">
                                    <span><img src="${item.goods.image1}" style="width: 50%"/></span>
                                </li>
                                <li class="yui3-u-7-12">
                                    <div class="desc">${item.goods.goods_name}</div>
                                    <div class="seven">7天无理由退货</div>
                                </li>
                                <li class="yui3-u-1-12">
                                    <div class="price">￥${item.number * item.goods.goods_price}</div>
                                </li>
                                <li class="yui3-u-1-12">
                                    <div class="num">X${item.number}</div>
                                </li>
                                <li class="yui3-u-1-12">
                                    <div class="exit">有货</div>
                                </li>
                            </ul>
                            <!-- 结束遍历 -->
                        </div>
                    </li>
                    <li></li>
                    <li></li>
                </ul>
                </c:forEach>
            </div>
            <div class="hr"></div>
        </div>
        <div class="linkInfo">
            <div class="step-tit">
                <h5>发票信息</h5>
            </div>
            <div class="step-cont">
                <span>普通发票（电子）</span>
                <span>个人</span>
                <span>明细</span>
            </div>
        </div>
        <div class="cardInfo">
            <div class="step-tit">
                <h5>使用优惠/抵用</h5>
            </div>
            <div class="step-cont">
                <span>全场满100包邮</span>
            </div>
        </div>
    </div>
</div>
<div class="order-summary">
    <div class="static fr">
        <div class="list">
            <span><i class="number">${totalNum}</i>件商品，总商品金额</span>
            <em class="allprice">¥${totalPrice}</em>
        </div>
        <div class="list">
            <span>返现：</span>
            <em class="money">0.00</em>
        </div>
        <div class="list">
            <span>运费：</span>
            <em class="transport">0.00</em>
        </div>
    </div>
</div>
<div class="clearfix trade">
    <div class="fc-price">应付金额:　<span class="price">¥${totalPrice}</span></div>
    <div class="fc-receiverInfo">寄送至:${address.address} 收货人：${address.realName} ${address.phone}</div>
</div>
<div class="submit">
    <a class="sui-btn btn-danger btn-xlarge" href="${pageContext.request.contextPath}/pay/toPay?orderNum=${orderNum}&totalPrice=${totalPrice}&subject=喜瑞斯订单&addressId=${address.address_id}&username=${Username}">提交订单</a>
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
                        <img width="50%" src="${pageContext.request.contextPath}/static/img/wx_cz.jpg">
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
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/pages/getOrderInfo.js"></script>
</body>

</html>