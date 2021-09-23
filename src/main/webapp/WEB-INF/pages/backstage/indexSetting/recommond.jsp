<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--主体内容-->
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
<script>
    $(function () {
        $("#update").click(function () {
            var ids = [];
            $(".check:checked").each(function (index,element) {
                ids.push(element.value);
            });
            if(ids.length !== 1){
                alert("请选择一条数据查询或修改");
                return;
            }
            javaex.dialog({
                type : "window",
                id : "test",	// 指定id，仅当页面存在多个弹出层，需要关闭指定弹出层时才使用
                url : "${pageContext.request.contextPath}/backStage/recommendUpdate?id="+ids+"",	// 页面地址或网址或请求地址
                width : "800",	// 弹出层宽度
                height : "600",	// 弹出层高度
                title:"查看/修改商品"
            });
        });
    })
</script>
<div class="list-content">
    <!--块元素-->
    <div class="block">
        <!--页面有多个表格时，可以用于标识表格-->
        <h2>首页推荐设置</h2>
        <a href="${pageContext.request.contextPath}/" target="_blank">
            <button class="button indigo radius-3" style="position: absolute;right: 20px;top: 16px;">前往首页预览</button>
        </a>
        <!--正文内容-->
        <div class="main">
            <!--表格上方的操作元素，添加、删除等-->
            <div class="operation-wrap">
                <div class="buttons-wrap">
                    <button id="update" class="button green radius-3 update" value="1"><span class="icon-check2"></span>修改</button>
                    <script>
                        javaex.select({
                            id : "select",
                            isSearch : true,
                            // 回调函数
                            callback: function (rtn) {
                                console.log("selectValue:" + rtn.selectValue);
                                console.log("selectName:" + rtn.selectName);
                            }
                        });
                    </script>
                </div>
            </div>
            <table id="table" class="table color2">
                <thead>
                <tr>
                    <th class="checkbox"><input type="checkbox" class="fill listen-1" /> </th>
                    <th>id</th>
                    <th>商品id</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${recommend}" var="goods">
                <tr>
                    <td class="checkbox"><input type="checkbox" class="fill listen-1-2 check" value="${goods.id}"/> </td>
                    <td><div class = "text">${goods.id}</div></td>
                    <td><div class = "text">${goods.goods_id}</div></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
