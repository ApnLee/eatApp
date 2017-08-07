<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/back/css/style.css" />

<style type="text/css">
body {
	overflow-x: hidden;
	overflow-y: auto;
}
</style>

<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->

<script src="${pageContext.request.contextPath }/back/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/back/js/jquery.mCustomScrollbar.concat.min.js"></script>
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
	<script>
		function checked() {
			
			logisticsCode = $("*[name='logisticsCode']").val();
			logisticsCompany = $("*[name='logisticsCompany']").val();
			

			if (logisticsCode == "") {
				alert("物流编码不能为空！");
				return false;
			} else if (logisticsCompany == "") {
				alert("物流公司不能为空！");
				return false;
			} else {
				return true;
			}
		}
	</script>
	<form method="post" action="${pageContext.request.contextPath}/BackLogisticsServlet?method=add"  name="f" onSubmit="return checked()">
		<h2>
			<strong style="color: grey;">添加物流页面</strong>
		</h2>
		<ul class="ulColumn2">
			<li>
				<span class="item_name" style="width: 120px;">物流编码：</span> 
				<input type="text" name="logisticsCode" class="textbox textbox_295" placeholder="请输入物流编码" />
			</li>
			<li>
				<span class="item_name" style="width: 120px;">物流公司：</span> 
				<input type="text" name="logisticsCompany" class="textbox textbox_295" placeholder="请输入物流公司" />
			</li>
		

			<li>
				<span class="item_name" style="width: 120px;"></span> 
				<input type="submit" class="link_btn" value="添加" /> 
				<input type="reset" class="link_btn" value="清空">
			</li>
		</ul>
	</form>
</body>
</html>