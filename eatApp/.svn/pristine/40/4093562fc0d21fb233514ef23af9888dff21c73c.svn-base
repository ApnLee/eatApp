<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>无标题文档</title>
<link href="${pageContext.request.contextPath }/back/css/style1.css" rel="stylesheet" type="text/css" />
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
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>


</head>


<body>
    
    <div class="rightinfo">
    
    
    <table class="tablelist">
    	<thead>
	    	<tr>
		        <th><input name="" value="" checked="checked"/></th>
		        <th>订单编号<i class="sort"></th>
		        <th>用户</th>
		        <th>更新时间</th>
		        <th>订单价格</th>
		        <th>购物总数</th>
		        <th>物流</th>
		        <th>运单号</th>
		        <th>订单状态</th>
		        <th>地址</th>
		        <th>操作</th>
		     </tr>
	    </thead>
        
        <tbody>   
			<c:forEach items="${pageBean.datas}" var="order" varStatus="state">
		        <tr>
			        <td><input name="" type="checkbox" value="" /></td>
			        <td>${order.id}</td>
			        <td>${order.realname}</td>
			        <td>${order.orderdate}</td>
			        <td>${order.totalprice}</td>
			        <td>${order.shopcount}</td>
			        <td>${order.logisticsCompany}</td>
			        <td>${order.waynum}</td>
			        <td>${order.statusName}</td>
			        <td>${order.address}</td>
			        
			        <td><a href="${pageContext.request.contextPath }/BackOrderServlet?method=updateUI&id=${order.id}" class="tablelink">修改</a>     
			        	<a href="${pageContext.request.contextPath }/BackOrderServlet?method=delete&id=${order.id}" class="tablelink">删除</a>
			        </td>
		        </tr> 
	        </c:forEach>
        </tbody>
    </table>
    
    <aside class="paging"> 
		<a href="${pageContext.request.contextPath }/BackOrderServlet?method=list&currentPage=${pageBean.current-1}">&laquo;</a>
		<a href="${pageContext.request.contextPath }/BackOrderServlet?method=list&currentPage=1">首页</a>
		<a href="${pageContext.request.contextPath }/BackOrderServlet?method=list&currentPage=${pageBean.total}">末页</a>	
		<a href="${pageContext.request.contextPath }/BackOrderServlet?method=list&currentPage=${pageBean.current+1}">&raquo;</a>
	 </aside>
    
    </div>
    
    <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>
</html>