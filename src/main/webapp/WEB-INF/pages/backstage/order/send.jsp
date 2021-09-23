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
        $("#send").click(function () {
            var ids = [];
            $(".check:checked").each(function (index,element) {
                ids.push(element.value);
            });
            if(ids.length === 0){
                alert("请选择一条订单");
                return;
            }
            javaex.dialog({
                type : "window",
                id : "test",	// 指定id，仅当页面存在多个弹出层，需要关闭指定弹出层时才使用
                url : "${pageContext.request.contextPath}/backStage/send?ids="+ids+"",	// 页面地址或网址或请求地址
                width : "700",	// 弹出层宽度
                height : "500",	// 弹出层高度
                title:"发货"
            });
        });
        $("#delete").click(function () {
            var ids = [];
            $(".check:checked").each(function (index,element) {
                ids.push(element.value);
            });
            if(ids.length === 0){
                alert("请选择数据后删除");
                return;
            }
            //发送ids删除
            $.ajax({
                url:'${pageContext.request.contextPath}/backStage/orderDelete',
                type:'POST',
                dataType:'json',
                data:JSON.stringify(ids),
                contentType:'application/json',
                success:function (res) {
                    if(res.type === 'success'){
                        javaex.optTip({
                            content : "删除成功",
                            type : "success"
                        });
                        setTimeout(function() {
                            location.reload();
                        }, 1000);
                    }else{
                        alert(res.msg)
                    }
                }
            })
        })

        $("#search").click(function () {
            location.href = '${pageContext.request.contextPath}/backStage/getOrderList?order_status=1&currentPage=1&pageSizes=10&order_num='+$("#order_num").val()+'&realName='+$("#realName").val()+'';
        })
    })
</script>
<style>
    .text{
        width:50px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }
</style>
<div class="list-content">
    <!--块元素-->
    <div class="block">
        <!--页面有多个表格时，可以用于标识表格-->
        <h2>待发货订单</h2>
        <!--正文内容-->
        <div class="main">
            <!--表格上方的操作元素，添加、删除等-->
            <div class="operation-wrap">
                <div class="buttons-wrap">
                    <button id="send" class="button green radius-3"><span class=""></span> 发货</button>
                    <button id="delete" class="button red radius-3"><span class="icon-close2"></span> 删除</button>
                    <!--表格上方的搜索操作-->
                    <div class="input-group">
                        <input id="order_num" type="text" class="text" placeholder="输入订单号" value=${order_num}>
                        <input id="realName" type="text" class="text" placeholder="输入收货人" value=${realName}>
                        <button id="search" class="button blue">搜索</button>
                    </div>
                </div>
            </div>
            <table id="table" class="table color2">
                <thead>
                <tr>
                    <th class="checkbox"><input type="checkbox" class="fill listen-1" /> </th>
                    <th>订单号</th>
                    <th>商品名称</th>
                    <th>商品数量</th>
                    <th>订单金额</th>
                    <th>订单状态</th>
                    <th>创建时间</th>
                    <th>收件人</th>
                    <th>收货地址</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list}" var="order">
                    <tr>
                        <td class="checkbox"><input type="checkbox" class="fill listen-1-2 check" value="${order.id}"/> </td>
                        <td><div class = "">${order.order_num}</div></td>
                        <td><div class = "text">${order.goods.goods_name}</div></td>
                        <td><div class = "">${order.buy_counts}</div></td>
                        <td><div class = "">${order.paid_amount}</div></td>
                        <td><div class = "">${order.order_status==0?"待付款":order.order_status==1?"待发货":order.order_status==2?"待收货":"已完成"}</div></td>
                        <td><div class = "">${order.create_time}</div></td>
                        <td><div class = "">${order.address.realName}</div></td>
                        <td><div class = "">${order.address.address}</div></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="page" style="float: right">
                <ul id="page" class="pagination"></ul><div style="margin-top: 10px;margin-left: 220px">共${page.totalCount}条,${page.totalPage}页</div>
            </div>
            <script>
                javaex.page({
                    id : "page",
                    pageCount : ${page.totalPage},	// 总页数
                    currentPage : ${page.currentPage},// 默认选中第几页
                    perPageCount : ${page.pageSizes},	// 每页显示多少条，不填时，不显示该条数选择控件
                    isShowJumpPage : true,	// 是否显示跳页
                    totalNum : ${page.totalCount},// 总条数，不填时，不显示
                    position : "left",
                    callback : function(rtn) {
                        console.log("当前选中的页数：" + rtn.pageNum);
                        console.log("每页显示条数：" + rtn.perPageCount);
                        location.href = '${pageContext.request.contextPath}/backStage/getOrderList?order_status=1&currentPage='+rtn.pageNum+'&pageSizes='+rtn.perPageCount+'&order_num='+$("#order_num").val()+'&realName='+$("#realName").val()+'';
                    }
                });
            </script>
        </div>
    </div>
</div>
