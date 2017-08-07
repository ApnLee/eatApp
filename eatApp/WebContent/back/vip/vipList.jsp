<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
<script src="../js/jquery.js"></script>
<script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
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
</script>
</head>
<body>
		<div class="cont_col_lt mCustomScrollbar" style="height: 100%; width: 100%">
			<table class="table fl">
				<tr>
					<th>角色</th>
					<th>性别</th>
					<th>操作</th>
				</tr>
				<tr>
					<td class="center">顶级管理员</td>
					<td class="center">男</td>
					<td class="center"><a class="inner_btn">DeathGhost</a></td>
				</tr>
				<tr>
					<td class="center">采购人员</td>
					<td class="center">女</td>
					<td class="center"><a class="inner_btn">DeathGhost</a></td>
				</tr>
			</table>
			<table class="table fl" style="margin-top: 8px;">
				<tr>
					<th>角色</th>
					<th>性别</th>
					<th>操作</th>
				</tr>
				<tr>
					<td class="center">顶级管理员</td>
					<td class="center">男</td>
					<td class="center"><a class="inner_btn">DeathGhost</a></td>
				</tr>
				<tr>
					<td class="center">采购人员</td>
					<td class="center">女</td>
					<td class="center"><a class="inner_btn">DeathGhost</a></td>
				</tr>
			</table>
		</div>
</body>
</html>