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
        margin: 20px;
        width: 70%;
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
            var json = {
                "goods_id":$("#goods_id").val(),
                "goods_name":$("#goods_name").val(),
                "cat_id":$("#cat_id").val(),
                "image1":$("#image1").val(),
                "image2":$("#image2").val(),
                "image3":$("#image3").val(),
                "image4":$("#image4").val(),
                "image5":$("#image5").val(),
                "goods_price":$("#goods_price").val(),
                "goods_number":$("#goods_number").val(),
                "goods_introduce":$("#goods_introduce").val(),
            }
            $.ajax({
                url:'${pageContext.request.contextPath}/goods/goodsAdd',
                data:JSON.stringify(json),
                type:'POST',
                contentType:'application/json;charset=utf-8',
                dataType:'json',
                success:function (res) {
                    if(res.type === 'success'){
                        javaex.optTip({
                            content : "添加成功",
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
        <span>商品id</span><input id="goods_id" type="text" class="text" placeholder="请输入商品id" autocomplete="off" /><br>
        <span>商品名称</span><input id="goods_name" type="text" class="text" placeholder="请输入商品名称" autocomplete="off" /><br>
        <span>商品分类id</span><input id="cat_id" type="text" class="text" placeholder="请输入商品分类id" autocomplete="off" /><br>
        <span>商品图片1</span><input id="image1" type="text" class="text" placeholder="商品图片1" autocomplete="off" /><br>
        <span>商品图片2</span><input id="image2" type="text" class="text" placeholder="商品图片2" autocomplete="off" /><br>
        <span>商品图片3</span><input id="image3" type="text" class="text" placeholder="商品图片3" autocomplete="off" /><br>
        <span>商品图片4</span><input id="image4" type="text" class="text" placeholder="商品图片4" autocomplete="off" /><br>
        <span>商品图片5</span><input id="image5" type="text" class="text" placeholder="商品图片5" autocomplete="off" /><br>
        <span>单价</span><input id="goods_price" type="text" class="text" placeholder="单价" autocomplete="off" /><br>
        <span>数量</span><input id="goods_number" type="text" class="text" placeholder="数量" autocomplete="off" /><br>
        <span>简介</span><input id="goods_introduce" type="text" class="text" placeholder="简介" autocomplete="off" /><br>
    </form>
    <button id="save" class="button green">添加</button>
</body>
</html>
