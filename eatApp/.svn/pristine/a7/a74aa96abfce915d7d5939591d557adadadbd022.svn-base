<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="${pageContext.request.contextPath}/app/css/dlstyle.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/app/js/jquery-1.8.2.js"></script>


<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
  
			var $user = $("#user").val();
			var $psw = $("#password").val();
			//如果用户没有填内容
			if ($user == "") {
				//提示
				$("#hiddenUser").text("用户名不能为空");
				return false;
			}
			if ($psw == "") {
				$("#hiddenUser").text("密码不能为空");
				return false;
			} else {
				if($("input[type='checkbox']").is(':checked')){
					$("#formid").attr("action","/eatApp/LoginServlet?method=login&remember-me=1");
					
				}	
				$("#formid").submit();
			}

		});
	})
</script>

</head>

<body>

	<div class="login-boxtitle">
		<a href="home.html"><img alt="logo"
			src="${pageContext.request.contextPath}/app/images/logobig.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/app/images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>

				<div class="login-form">
					<form action="/eatApp/LoginServlet?method=login" method="post"
						id="formid">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label>
							<c:if test="${username!=null}">
								<input type="text" name="username" id="user"
									placeholder="邮箱/手机号" value=${username}>
							</c:if>
							<c:if test="${username==null}">
								<input type="text" name="username" id="user"
									placeholder="邮箱/手机号" value=${user}>
							</c:if>

						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="password" id="password"
								placeholder="请输入密码" value=${password}>
						</div>
					</form>
				</div>

				<div class="login-links">
					<label for="remember-me"> <c:if test="${username!=null}">
							<input name="remember-me" id="rem" type="checkbox" checked="checked">
						</c:if> <c:if test="${username==null}">
							<input name="remember-me" id="rem" type="checkbox">
						</c:if> 记住密码
					</label> <a href="#" class="am-fr">忘记密码</a> <br />
				</div>
				&nbsp; &nbsp;<span style="color: red" id="hiddenUser">${tip}</span>
				<div class="am-cf">
					<input type="button" id="login" value="登 录"
						class="am-btn am-btn-primary am-btn-sm"><br />
					<br /> <input type="button" name="" value="注 册"
						onclick="location.href='/eatApp/app/register.jsp'"
						class="am-btn am-btn-primary am-btn-sm">

				</div>

				<a href="app/welcome.jsp" style="color: green">游客进入</a>
			</div>
		</div>


		<div class="footer ">
			<div class="footer-hd ">
				<p>
					<a href="# ">恒望科技</a> <b>|</b> <a href="${pageContext.request.contextPath}/app/welcome.jsp ">商城首页</a> <b>|</b> <a
						href="# ">支付宝</a> <b>|</b> <a href="# ">物流</a>
				</p>
			</div>
			<div class="footer-bd ">
				<p>
					<a href="# ">关于恒望</a> <a href="# ">合作伙伴</a> <a href="# ">联系我们</a> <a
						href="# ">网站地图</a> <em>© 2015-2025 Hengwang.com 版权所有</em>
				</p>
			</div>
		</div>
</body>

</html>