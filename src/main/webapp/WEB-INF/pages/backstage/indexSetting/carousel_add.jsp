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
            $.ajax({
                url:'${pageContext.request.contextPath}/backStage/carousel_add?image='+$("#image").val()+'',
                type:'GET',
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
    <span>图片url</span><input id="image" type="text" class="text" placeholder="请输入图片url" autocomplete="off" /><br>
</form>
<button id="save" class="button green">添加</button>
</body>
</html>
