<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品添加</title>
</head>
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
<style>
    input{
        margin: 10px;
        width: 50%;
    }
    span{
        margin-left: 30px;
    }
    button{
        width: 80%;
        margin: 30px;
    }
</style>
<script>
    $(function () {
        $("#save").click(function () {
            $.ajax({
                url:'${pageContext.request.contextPath}/backStage/sendOrder?id=${order.id}',
                type:'GET',
                contentType:'application/json;charset=utf-8',
                dataType:'json',
                success:function (res) {
                    if(res.type === 'success'){
                        javaex.optTip({
                            content : "发货成功",
                            type : "success"
                        });
                        // 建议延迟加载
                        setTimeout(function() {
                            parent.javaex.close();
                            parent.location.reload();
                        }, 1000);
                    }else{
                        alert("res.msg");
                    }
                }
            })
        })
    })
</script>
<body>
<form id="form">
    <span>订单号</span><input type="text" class="text readonly" value=${order.order_num} readonly autocomplete="off" /><br>
    <span>物流号</span><input type="text" class="text readonly" value=${logistics_id}><br>
    <span>快递公司</span>
    <span><select id="select">
        <option value="">请选择</option>
        <option value="1">顺丰快递</option>
        <option value="2">邮政快递</option>
        <option value="3">韵达快递</option>
        <option value="4">圆通快递</option>
        <option value="5">中通快递</option>
    </select></span><br>
    <span>发货时间</span><input type="text" class="text readonly" value="${now}" readonly autocomplete="off" /><br>
    <span>收件人</span><input id="image1" type="text" class="text" placeholder="" value=${order.address.realName} autocomplete="off" /><br>
    <span>手机号</span><input id="image2" type="text" class="text" placeholder="" value=${order.address.phone} autocomplete="off" /><br>
    <span>详细地址</span><input id="image3" type="text" class="text" placeholder="" value=${order.address.address} autocomplete="off" /><br>
</form>
<button id="save" class="button green">发货</button>
</body>
</html>
