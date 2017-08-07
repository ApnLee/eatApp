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


<style type="text/css">
body{ 
     overflow:scroll; 
     border:1px solid;
}


</style>
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
<body>
	<section> <!--    <h2><strong style="color:grey;">页面标题及表格/分页（根据具体情况列入重点，切勿放置可扩展内容不定的数据）</strong></h2> -->
	<div class="page_title">
		<h2 class="fl">物流</h2>
		<a class="fr top_rt_btn" href="${pageContext.request.contextPath}/back/logistics/addLogistics.jsp">添加物流</a>
	</div>
	<table class="table">
		<tr>
			<th>物流编码</th>
			<th>物流公司</th>
			<th>操作</th>
		</tr>
		
		<c:forEach items="${pageBean.datas}" var="logistics" varStatus="varSta">
		<input type="hidden" name="id" value="${logistics.id}">
			<tr>
				<td>${logistics.logisticsCode }</td>
				<td>${logistics.logisticsCompany }</td>
				
				<td style="width: 200px;">
					<a href="${pageContext.request.contextPath}/BackLogisticsServlet?method=updateUI&id=${logistics.id}">修改</a> 
					<a href="${pageContext.request.contextPath}/BackLogisticsServlet?method=delete&id=${logistics.id}" class="inner_btn" onClick="return confirm('确定要删除吗？')">删除</a>
				</td>
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
		<a href="${pageContext.request.contextPath }/BackLogisticsServlet?method=list&currentPage=${pageBean.current-1}">&laquo;</a>
		<a href="${pageContext.request.contextPath }/BackLogisticsServlet?method=list&currentPage=1">首页</a>
		<a href="${pageContext.request.contextPath }/BackLogisticsServlet?method=list&currentPage=${pageBean.total}">末页</a>	
		<a href="${pageContext.request.contextPath }/BBackLogisticsServlet?method=list&currentPage=${pageBean.current+1}">&raquo;</a>
	 </aside> 
	 </section>
</body>
</html>