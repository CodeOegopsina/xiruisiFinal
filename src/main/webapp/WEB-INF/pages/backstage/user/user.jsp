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
                url:'${pageContext.request.contextPath}/login/userDelete',
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
        location.href = '${pageContext.request.contextPath}/backStage/user_detail?pageSizes=10&currentPage=1&username='+$("#username").val()+''
        })
    })
</script>
<div class="list-content">
    <!--块元素-->
    <div class="block">
        <!--页面有多个表格时，可以用于标识表格-->
        <h2>用户信息管理</h2>
        <!--正文内容-->
        <div class="main">
            <!--表格上方的操作元素，添加、删除等-->
            <div class="operation-wrap">
                <div class="buttons-wrap">
                    <button id="delete" class="button red radius-3"><span class="icon-close2"></span> 删除</button>
                    <!--表格上方的搜索操作-->
                        <div class="input-group">
                            <input id="username" type="text" class="text" placeholder="输入用户名搜索" value="${pageContext.request.getParameter("username")}"/>
                            <button id="search" class="button blue">搜索</button>
                        </div>
                </div>
            </div>
            <table id="table" class="table color2">
                <thead>
                <tr>
                    <th class="checkbox"><input type="checkbox" class="fill listen-1" /> </th>
                    <th>用户id</th>
                    <th>用户名</th>
                    <th>密码</th>
                    <th>邮箱</th>
                    <th>电话</th>
                    <th>真实姓名</th>
                    <th>地址</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${page.list}" var="user">
                    <tr>
                        <td class="checkbox"><input type="checkbox" class="fill listen-1-2 check" value="${user.user_id}"/> </td>
                        <td><div class = "text">${user.user_id}</div></td>
                        <td><div class = "text">${user.username}</div></td>
                        <td><div class = "text">${user.password}</div></td>
                        <td><div class = "text">${user.email}</div></td>
                        <td><div class = "text">${user.phone}</div></td>
                        <td><div class = "text">${user.address.realName}</div></td>
                        <td><div class = "text">${user.address.address}</div></td>
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
                        location.href = "${pageContext.request.contextPath}/backStage/user_detail?pageSizes="+rtn.perPageCount+"&currentPage="+rtn.pageNum+""
                    }
                });
            </script>
        </div>
    </div>
</div>
