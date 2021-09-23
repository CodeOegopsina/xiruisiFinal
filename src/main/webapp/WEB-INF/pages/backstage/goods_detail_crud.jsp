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
<style>
    .text{
        width:50px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: nowrap;
    }
</style>
<script>
    $(function () {
        $("#add").click(function () {
            javaex.dialog({
                type : "window",
                id : "test",	// 指定id，仅当页面存在多个弹出层，需要关闭指定弹出层时才使用
                url : "${pageContext.request.contextPath}/backStage/goods_add",	// 页面地址或网址或请求地址
                width : "800",	// 弹出层宽度
                height : "600",	// 弹出层高度
                title:"添加商品"
            });
        });
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
                url : "${pageContext.request.contextPath}/backStage/goods_update?goods_id="+ids+"",	// 页面地址或网址或请求地址
                width : "800",	// 弹出层宽度
                height : "600",	// 弹出层高度
                title:"查看/修改商品"
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
                url:'${pageContext.request.contextPath}/goods/goodsDelete',
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
    })
</script>
<div class="list-content">
    <!--块元素-->
    <div class="block">
        <!--页面有多个表格时，可以用于标识表格-->
        <h2>商品信息管理</h2>
        <!--正文内容-->
        <div class="main">
            <!--表格上方的操作元素，添加、删除等-->
            <div class="operation-wrap">
                <div class="buttons-wrap">
                    <button id="add" class="button blue radius-3"><span class="icon-plus"></span> 添加</button>
                    <button id="delete" class="button red radius-3"><span class="icon-close2"></span> 删除</button>
                    <button id="update" class="button green radius-3 update" value="1"><span class="icon-check2"></span>修改/查看</button>
                    <%--下拉框搜索--%>
                    <select id="select">
                        <c:if test="${cat_id != 0}">
                        <option value="${cat_id}">${cat_id == 1?"电脑,办公":"手机，数码"}</option>
                            <option value="0">全部分类</option>
                        </c:if>
                        <c:if test="${cat_id == 0}">
                            <option value="0">选择商品分类</option>
                        </c:if>
                        <option value="1">电脑，办公</option>
                        <option value="2">手机，数码</option>
                        <option value="3">游戏，娱乐</option>
                        <option value="4">运动与健康</option>
                        <option value="5">家用电器</option>
                        <option value="6">母婴，玩具</option>
                        <option value="7">图书，音像</option>
                        <option value="8">家具，家居</option>
                        <option value="9">汽车用品</option>
                        <option value="10">服装，内衣</option>
                        <option value="11">彩票，旅行</option>
                        <option value="12">箱包</option>
                        <option value="13">家装，厨具</option>
                        <option value="14">理财，众筹</option>
                        <option value="15">游戏，线上</option>
                    </select>
                    <%--商品名模糊搜索--%>
                    <div class="input-group">
                        <input id="goods_name" type="text" class="text" placeholder="输入商品名" value=${goods_name}>
                        <button id="search" class="button blue">搜索</button>
                        <script>
                            $(function () {
                                $("#search").click(function () {
                                    location.href = "${pageContext.request.contextPath}/backStage/goods_detail?currentPage=1&pageSizes=10&goods_name="+$("#goods_name").val()+"&cat_id="+$("#select").val()+"";
                                })
                            })
                        </script>
                    </div>
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
                    <th>商品id</th>
                    <th>商品名称</th>
                    <th>分类</th>
                    <th>商品图片1</th>
                    <th>商品图片2</th>
                    <th>商品图片3</th>
                    <th>商品图片4</th>
                    <th>商品图片5</th>
                    <th>单价</th>
                    <th>库存</th>
                    <th>简介</th>
                    <th>预览</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${goodsList}" var="goods">
                <tr>
                    <td class="checkbox"><input type="checkbox" class="fill listen-1-2 check" value="${goods.goods_id}"/> </td>
                    <td><div class = "text">${goods.goods_id}</div></td>
                    <td><div class = "text">${goods.goods_name}</div></td>
                    <td><div class = "text">${goods.cat_id == 1?"电脑，办公":"手机数码"}</div></td>
                    <td><div class = "text">${goods.image1}</div></td>
                    <td><div class = "text">${goods.image2}</div></td>
                    <td><div class = "text">${goods.image3}</div></td>
                    <td><div class = "text">${goods.image4}</div></td>
                    <td><div class = "text">${goods.image5}</div></td>
                    <td><div class = "text">${goods.goods_price}</div></td>
                    <td><div class = "text">${goods.goods_number}</div></td>
                    <td><div class = "text">${goods.goods_introduce}</div></td>
                    <td><a target="_blank" href="${pageContext.request.contextPath}/goods/goodsDetail?goods_id=${goods.goods_id}">预览</a></td>
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
                        location.href = "${pageContext.request.contextPath}/backStage/goods_detail?pageSizes="+rtn.perPageCount+"&currentPage="+rtn.pageNum+"&goods_name="+$("#goods_name").val()+"&cat_id="+$("#select").val()+""
                    }
                });
            </script>
        </div>
    </div>
</div>
