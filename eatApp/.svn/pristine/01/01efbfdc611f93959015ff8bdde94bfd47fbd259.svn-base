<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
		<meta charset="UTF-8">
		<title>注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="${pageContext.request.contextPath}/app/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

	</head>
	<script type="text/javascript">
    //创建AJAX异步对象
    function createAJAX(){
        var ajax = null;
        try{
            //如果IE5=IE12的话
            ajax = new ActiveXObject("microsoft.xmlhttp");
        }catch(e1){
            try{
                //如果是非IE的话
                ajax = new XMLHttpRequest();
            }catch(e2){
                alert("你的浏览器中不支持异步对象，请换浏览器");
            }
        }
        return ajax;
    }
</script>
<script type="text/javascript">
//邮箱注册
//验证邮箱是否正确及验证邮箱是否已注册
  function checkEmail(){
	  var email=$("#email").val();
		  if(!/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(email)){ 
			  $("#emailspan").text("邮箱格式不正确，请重新填写") 
			 
			  return false; 
			  }	  
		  else{
			  //NO1)创建AJAX异步对象
		       var ajax = createAJAX();
		       //NO2)准备发送请求
		       var method = "GET";
		       var url = "${pageContext.request.contextPath}/UserServlet?method=checkEmail&email="+email+"&time=" + new Date().getTime();
		       ajax.open(method,url);
		       //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
		       ajax.send(null);
		       //-------------------------------------------------------------等待
		       ajax.onreadystatechange = function(){
		       	
		           if(ajax.readyState == 4){
		          	
		               if(ajax.status == 200){
		                   //NO5)
		                 
		                   var tip = ajax.responseText;
		                  
		                   //alert(tip);
		                   if(tip==1){
		                	   $("#emailspan").text("该邮箱已注册！请勿重复注册");
		                	   return false; 
		                   }
		                   else{
		                   
		     			  $("#sendEmailCode").attr("onclick","sendEmailCode()");
		     			 $("#emailspan").text("") ;
		     			  return true;
		                   }
		                 }
		           
		           }
		       } 
		       return true; 
			 
		  }
  }
  
//验证码
  var checkEmailcode;
//定时器
  var emailclock='';
  //总时间
  var sum=60;
  var but;
  //邮箱注册 点击获取的方法
  function sendEmailCode(){
	  $("#sendEmailCode").removeAttr("onclick");
	  but=$(".msg:eq(0)");
	  emailclock=setInterval(doEmailLoop,1000);
	   var email=$("#email").val();
	 //NO1)创建AJAX异步对象
      var ajax = createAJAX();
      //NO2)准备发送请求
      var method = "GET";
      var url = "${pageContext.request.contextPath}/UserServlet?method=emailCode&email="+email+"&time=" + new Date().getTime();
      ajax.open(method,url);
      //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
      ajax.send(null);
      //-------------------------------------------------------------等待
      ajax.onreadystatechange = function(){
      	
          if(ajax.readyState == 4){
         	
              if(ajax.status == 200){
                  //NO5)
                
                  var tip = ajax.responseText;
                 // alert(tip);
                  checkEmailcode=tip;
                 
                }
          
          }
      } 
  }
  
  function doEmailLoop(){
	        sum--;
		  if(sum>0){  
			  but.html(sum+'秒');		  
		  }else{
			  clearInterval(emailclock); //清除js定时器
			  checkEmailcode="";//验证码删除
			  $("#sendEmailCode").attr("onclick","sendEmailCode()");
			  but.html('获取') ;
			  sum = 60; //重置时间	  
		  }
		  
	  } 
  
//邮箱提交之前检测
  function submitcheck(){
	 if(($("#code1").val())!=checkEmailcode){
			 $("#emailspan").text("请确认验证码！");
				return false;
		 }
	 var password1=$("#password1").val(); 
	 var passwordRepeat1=$("#passwordRepeat1").val();
	 if(password1=="" || passwordRepeat1==""){
		 $("#emailspan").text("密码不能为空") ;
		return false;
	 }
	 if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/.test(password1))){
		 $("#emailspan").text("密码必须由数字、字母组成  ,6-20长度") ;
		 return false;
	 }
	 if(password1!=passwordRepeat1){
		 $("#emailspan").text(" 两次密码输入不一致") ;
		return false;
	 }
	 else{
		
		 return true;
	 }
	 
  }
</script>
<script type="text/javascript">
//手机注册
$(function(){
    $("#email").get(0).focus();
    $("#sendMobileCode").removeAttr("onclick");  
    $("#sendEmailCode").removeAttr("onclick");  

})
    //用于接收验证码
    var checkcode;
    var clock='';
    var nums=60;
    var btn;
    function doLoop(){
		  nums--;
		  if(nums>0){  
			  btn.html(nums+'秒');		  
		  }else{
			  clearInterval(clock); //清除js定时器
			  checkcode="";//验证码删除
			  $("#sendMobileCode").attr("onclick","sendMobileCode()");
			  btn.html('获取') ;
			  nums = 60; //重置时间	  
		  }
		  
	  } 
   function sendMobileCode() {
	   $("#sendMobileCode").removeAttr("onclick");
	   btn=$(".msg:eq(1)");
	   
	   clock=setInterval(doLoop,1000);
	   var phone=$("#phone2").val();
	 //NO1)创建AJAX异步对象
       var ajax = createAJAX();
       //NO2)准备发送请求
       var method = "GET";
       var url = "${pageContext.request.contextPath}/UserServlet?method=mobileCode&phone="+phone+"&time=" + new Date().getTime();
       ajax.open(method,url);
       //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
       ajax.send(null);
       //-------------------------------------------------------------等待
       ajax.onreadystatechange = function(){
       	
           if(ajax.readyState == 4){
          	
               if(ajax.status == 200){
                   //NO5)
                 
                   var tip = ajax.responseText;
                   //alert(tip);
                   checkcode=tip;
                  
                 }
           
           }
       } 
}
   //检查手机号的输入格式 及验证手机是否已注册
  function checkphone(){
	  var phone=$("#phone2").val();
		  if(!(/^1[3|4|5|7|8]\d{9}$/.test(phone))){ 
			  $("#spanid").text("手机号码格式不正确，请重新填写") 
			 
			  return false; 
			  }	  
		  else{
			  //NO1)创建AJAX异步对象
		       var ajax = createAJAX();
		       //NO2)准备发送请求
		       var method = "GET";
		       var url = "${pageContext.request.contextPath}/UserServlet?method=checkPhone&phone="+phone+"&time=" + new Date().getTime();
		       ajax.open(method,url);
		       //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
		       ajax.send(null);
		       //-------------------------------------------------------------等待
		       ajax.onreadystatechange = function(){
		       	
		           if(ajax.readyState == 4){
		          	
		               if(ajax.status == 200){
		                   //NO5)
		                 
		                   var tip = ajax.responseText;
		                  
		                   //alert(tip);
		                   if(tip==1){
		                	   $("#spanid").text("该手机号已注册！请勿重复注册");
		                	   return false; 
		                   }
		                   else{
		                   $("#spanid").text("") ;
		     			  $("#sendMobileCode").attr("onclick","sendMobileCode()");
		     			  
		     			  return true;
		                   }
		                 }
		           
		           }
		       } 
		       return true; 
			 
		  }
  }
 //提交之前检测
   function check(){
	   if(($("#phone2").val())==""){
			 $("#spanid").text("请输入手机号！");
				return false;
		 }
	 if(($("#code2").val())!=checkcode){
			 $("#spanid").text("请确认验证码！");
				return false;
		 }
	 var password2=$("#password2").val(); 
	 var passwordRepeat2=$("#passwordRepeat2").val();
	 if(password2=="" || passwordRepeat2==""){
		 $("#spanid").text("密码不能为空") ;
		return false;
	 }
	 if(!(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/.test(password2))){
		 $("#spanid").text("密码必须由数字、字母组成  ,6-20长度") ;
		 return false;
	 }
	 if(password2!=passwordRepeat2){
		 $("#spanid").text(" 两次密码输入不一致") ;
		return false;
	 }
	 else{
		
		 return true;
	 }
	 
   }

</script>

	<body>
     ${MobileCode}
		<div class="login-boxtitle">
			<a href="home/demo.html"><img alt="" src="${pageContext.request.contextPath}/app/images/logobig.png" /></a>
		</div>

		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="${pageContext.request.contextPath}/app/images/big.jpg" /></div>
				<div class="login-box">

						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active"><a href="">邮箱注册</a></li>
								<li><a href="">手机号注册</a>
								</li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-active">
									<form method="post" onsubmit=" return submitcheck();" action="${pageContext.request.contextPath}/UserServlet?method=register">
										
							   <div class="user-email">
										<label for="email"><i class="am-icon-envelope-o"></i></label>
										<input type="email" name="email" id="email" onblur="checkEmail();" placeholder="请输入邮箱账号">
                 </div>		
                 <div class="verification">
											<label for="code"><i class="am-icon-code-fork"></i></label>
											<input type="text" name="" id="code1" placeholder="请输入验证码">
											<a class="btn" href="javascript:void(0);" onClick="sendEmailCode();" id="sendEmailCode">
												<span class="msg" id="dyMobileButton">获取</span></a>
										</div>								
                 <div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" id="password1" placeholder="设置密码">
                 </div>										
                 <div class="user-pass">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="" id="passwordRepeat1" placeholder="确认密码">
                 </div>	
                  <span id="emailspan" style="color: red"></span>
                  <div class="am-cf">
											<input type="submit" name="" value="同意协议并注册"  class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>
                 </form>
                 
								 <div class="login-links">
										<label for="reader-me">
											 点击注册，表示您同意悦桔拉拉商城<a href="#">《服务协议》</a>
										</label>
							  	</div>
										

								</div>

								<div class="am-tab-panel">
									<form method="post" onsubmit="return check()" action="${pageContext.request.contextPath}/UserServlet?method=register">
                 <div class="user-phone">
								    <label for="phone"><i class="am-icon-mobile-phone am-icon-md"></i></label>
								    <input type="text" name="phone2" id="phone2" onblur="checkphone();"  placeholder="请输入手机号">
                	
                 </div>																			
										<div class="verification">
											<label for="code"><i class="am-icon-code-fork"></i></label>
											<input type="text" name="" id="code2" placeholder="请输入验证码">
											<a class="btn" href="javascript:void(0);" onClick="sendMobileCode();" id="sendMobileCode">
												<span class="msg" id="dyMobileButton">获取</span></a>
										</div>
                 <div class="user-pass">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" id="password2" placeholder="设置密码">
                 </div>										
                 <div class="user-pass">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="" id="passwordRepeat2" onblur="checkpsw()"  placeholder="确认密码">
                 </div>	
                         <span id="spanid" style="color: red"></span>
                                       <div class="am-cf">
											<input type="submit" name="" value="同意协议并注册"  class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>
									</form>
								 <div class="login-links">
										<label for="reader-me">
											点击 注册，表示您同意悦桔拉拉商城<a href="#">《服务协议》</a>
										</label>
							  	</div>
										
								
									<hr>
								</div>

								<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  })
								</script>

							</div>
						</div>

				</div>
			</div>
			
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">恒望科技</a>
								<b>|</b>
								<a href="${pageContext.request.contextPath}/app/welcome.jsp">商城首页</a>
								<b>|</b>
								<a href="# ">支付宝</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于恒望</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
								<em>© 2015-2025 Hengwang.com 版权所有</em>
							</p>
						</div>
					</div>
	</body>

</html>