<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	(function($){
		$(window).load(function(){
			
			$("a[rel='load-content']").click(function(e){
				e.preventDefault();
				var url=$(this).attr("href");
				$.get(url,function(data){
					$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
					//scroll-to appended content 
					$(".content").mCustomScrollbar("scrollTo","h2:last");
				});
			});
			
			$(".content").delegate("a[href='top']","click",function(e){
				e.preventDefault();
				$(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
			});
			
		});
	})(jQuery);
	(function($) {	 
		  var $activeLink;
		  $(document).on('click', '#change_a a', function() {
		    if ($activeLink != null) $activeLink.removeClass('active');
		    $activeLink = $(this).addClass('active');
		  });
		}(jQuery));
</script>
</head>
<body>
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
 <h2><a target="right" href="right.jsp">起始页</a></h2>
 <ul id="change_a">
  <li>
   <dl>
    <dt>商品信息</dt>
    <!--当前链接则添加class:active-->
    <dd><a target="right" href="${pageContext.request.contextPath }/BackSnackServlet?method=list">商品列表</a></dd>
    <dd><a target="right" href="${pageContext.request.contextPath}/back/shop/addShop.jsp">添加商品</a></dd>
   </dl>
  </li>
  <li>
   <dl>
    <dt>订单信息</dt>
    <dd><a target="right" href="${pageContext.request.contextPath}/BackOrderServlet?method=list">订单列表</a></dd>
   </dl>
  </li>

  
  <li>
   <dl>
    <dt>物流管理</dt>
    <dd><a target="right" href="${pageContext.request.contextPath}/BackLogisticsServlet?method=list">物流公司</a></dd>
   </dl>
  </li>
 </ul>
</aside>
</body>
</html>