<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/back/css/style.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->

<script src="${pageContext.request.contextPath }/back/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/back/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($) {
		$(window).load(
				function() {

					$("a[rel='load-content']").click(
							function(e) {
								e.preventDefault();
								var url = $(this).attr("href");
								$.get(url, function(data) {
									$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
									//scroll-to appended content 
									$(".content").mCustomScrollbar("scrollTo",
											"h2:last");
								});
							});

					$(".content").delegate(
							"a[href='top']",
							"click",
							function(e) {
								e.preventDefault();
								$(".content").mCustomScrollbar("scrollTo",
										$(this).attr("href"));
							});

				});
	})(jQuery);
</script>

</head>

<body style="overflow:scroll; border:1px solid;">
	
	<section> <!--    <h2><strong style="color:grey;">页面标题及表格/分页（根据具体情况列入重点，切勿放置可扩展内容不定的数据）</strong></h2> -->
	<div class="page_title">
		<h2 class="fl">商品详情</h2>
		<div style="position: absolute;top:1px;right:120px;">
			<form action="${pageContext.request.contextPath }/BackSnackServlet?method=list" method="post">
				零食名称：<input  style="width:150px; height:25px" type="text" name="snackName" value="" title="请输入零食名称">
				       <input style="width:50px; height:25px;line-height: 24px;background-color: green" type="submit" value="搜索">
			</form>
		</div>
		<a class="fr top_rt_btn" href="${pageContext.request.contextPath}/back/shop/addShop.jsp">添加商品</a>
	</div>
	<table class="table">
		<tr>
			<th>产品名称</th>
			<th>促销价格</th>
			<th>产品原价</th>
			<th>产品图片</th>
			<th>总销量</th>
			<th>累计评价</th>
			<th>库存</th>
			<th>产品类型</th>
			<th>原料产地</th>
			<th>产地</th>
			<th>配料表</th>
			<th>产品规格</th>
			<th>保质期</th>
			<th>储存方法</th>
			<th>食用方法</th>
			<th>操作</th>
		</tr>
		
		<c:forEach items="${pageBean.datas}" var="snack" varStatus="varSta">
		<input type="hidden" name="id" value="${snack.id}">
			<tr>
				<td style="width: 200px;"><div class="cut_title ellipsis">${snack.snackName }</div></td>
				<td>${snack.price }</td>
				<td>${snack.mktprice }</td>
				<td style="width: 100px;">${snack.image }</td>
				<td>${snack.totalSales }</td>
				<td>${snack.evaluate }</td>
				<td>${snack.stock }</td>
				<td>${snack.type }</td>
				<td>${snack.materialArea }</td>
				<td>${snack.productionArea }</td>
				<td>${snack.dosing }</td>
				<td>${snack.weight }</td>
				<td>${snack.expirationDate }</td>
				<td>${snack.storeMethod }</td>
				<td>${snack.edibleMethod }</td>
				<td style="width: 200px;"><a href="${pageContext.request.contextPath}/BackSnackServlet?method=updateUI&id=${snack.id}">修改</a> <a href="${pageContext.request.contextPath }/BackSnackServlet?method=delete&id=${snack.id}" class="inner_btn" onClick="return confirm('确定要删除吗？')">删除</a></td>
			</tr>
		</c:forEach>
		<!--  <tr>
			<td style="width: 200px;"><div class="cut_title ellipsis">名称</div></td>
			<td>内容二</td>
			<td>内容三</td>
			<td>内容四</td>
			<td>内容五</td>
			<td>内容六</td>
			<td>内容七</td>
			<td><a href="#">表内链接</a> <a href="#" class="inner_btn">表内按钮</a>
			</td>
		</tr>
		<tr>
			<td style="width: 200px;"><div class="cut_title ellipsis">名称</div></td>
			<td>内容二</td>
			<td>内容三</td>
			<td>内容四</td>
			<td>内容五</td>
			<td>内容六</td>
			<td>内容七</td>
			<td><a href="#">表内链接</a> <a href="#" class="inner_btn">表内按钮</a>
			</td>
		</tr>-->
	</table>
	<aside class="paging"> 
		<a href="${pageContext.request.contextPath }/BackSnackServlet?method=list&currentPage=${pageBean.current-1}">&laquo;</a>
		<a href="${pageContext.request.contextPath }/BackSnackServlet?method=list&currentPage=1">首页</a>
		<a href="${pageContext.request.contextPath }/BackSnackServlet?method=list&currentPage=${pageBean.total}">末页</a>	
		<a href="${pageContext.request.contextPath }/BackSnackServlet?method=list&currentPage=${pageBean.current+1}">&raquo;</a>
	 </aside> 
	 </section>
</body>
</html>