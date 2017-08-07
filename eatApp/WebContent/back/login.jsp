<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/back/css/style.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>
<script src="${pageContext.request.contextPath }/back/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/back/js/verificationNumbers.js"></script>
<script
	src="${pageContext.request.contextPath }/back/js/Particleground.js"></script>
<script>
	$(document).ready(function() {
		//粒子背景特效
		$('body').particleground({
			dotColor : '#5cbdaa',
			lineColor : '#5cbdaa'
		});
		//验证码
		createCode();
		//测试提交，对接程序删除即可
		//$(".submit_btn").click(function(){
		//location.href="../AdminLoginServlet?adName="+$('.login_txtbx').val();
		//});
	});
	//验证输入不为空的脚本代码
	function checkForm(form) {
		if (form.adName.value == "") {
			alert("帐号不能为空!");
			form.adName.focus();
			return false;
		}
		if (form.adPwd.value == "") {
			alert("密码不能为空!");
			form.adPwd.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="/eatApp/AdminLoginServlet" method="post" onsubmit="return checkForm(this);">
		<dl class="admin_login">
			<dt>
				<strong>后台管理系统</strong> <em>Management System</em>
			</dt>
			<dd class="user_icon">
				<input type="text" placeholder="账号" name="adName"
					class="login_txtbx" />
			</dd>
			<dd class="pwd_icon">
				<input type="password" placeholder="密码" name="adPwd"
					class="login_txtbx" />
			</dd>
			<!--  <dd class="val_icon">
  <div class="checkcode">
    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  </div>
  <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
 </dd>-->
			<dd>
				<input type="submit" value="立即登陆" class="submit_btn" />
			</dd>
			<dd>
				<p>© 20160910 版权所有ps lsm lkl yy lp</p>
				<p>1510</p>
			</dd>
		</dl>
	</form>
</body>
</html>