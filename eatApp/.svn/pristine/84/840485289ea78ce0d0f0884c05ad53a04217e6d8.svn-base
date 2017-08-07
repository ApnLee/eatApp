<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>验证邮箱</title>

		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/app/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="${pageContext.request.contextPath}/app/js/jquery-1.7.2.min.js"></script>
		<script src="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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
  //邮箱注册
  //验证邮箱是否正确及验证邮箱是否已注册
    function checkEmail(){
  	  var email=$("#user-email").val();
  		  if(!/^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(email)){ 
  			  $("#emailspan").text("");
  			  $("#emailspan").text("邮箱格式不正确，请重新填写") 
  			 
  			  return false; 
  			  }	  
  		  else{
  			 $("#emailspan").text("");
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
  		                	   $("#emailspan").text("");
  		                	   $("#emailspan").text("该邮箱已注册！请勿重复注册");
  		                	   return false; 
  		                   }
  		                   else{
  		                	 $("#emailspan").text("");
  		     			     $("#sendEmailCode").attr("onclick","sendEmailCode()");
  		     			  return true;
  		                   }
  		                 }
  		           
  		           }
  		       } 
  		      $("#emailspan").text("");
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
  	  but=$("#dyEmailButton");
  	  emailclock=setInterval(doEmailLoop,1000);
  	   var email=$("#user-email").val();
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
    function submit() {
    	if(($("#user-new-phone").val())==""){
			 $("#spanid").text("请输入手机号！");
				return false;
		 }
	 if(($("#user-code").val())!=checkEmailcode){
			 $("#emailspan").text("请确认验证码！");
				return false;
		 }else{
		
			 $("#emailform").submit();
	 }
    	
		
	}
</script>
	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a class="h">亲爱的${NickName}</a>&nbsp;&nbsp;
					                <a class="h" href="${pageContext.request.contextPath}/UserServlet?method=logout">退出</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="${pageContext.request.contextPath}/app/welcome.jsp" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
					<c:if test="${UserName!=null }">
						<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/PersonServlet?method=go" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</c:if>
					<c:if test="${UserName==null }">
						<div class="menu-hd MyShangcheng"><a href="${pageContext.request.contextPath}/app/login.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</c:if>
				</div>
							<div class="topMessage mini-cart">
									<c:if test="${UserName!=null }">
					<div class="menu-hd">
						<a id="mc-menu-hd" target="_top" href="${pageContext.request.contextPath}/app/shopcart.jsp"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
					</div>
					</c:if>
					<c:if test="${UserName==null }">
					<div class="menu-hd">
						<a id="mc-menu-hd" target="_top" href="${pageContext.request.contextPath}/app/login.jsp"><i
							class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong
							id="J_MiniCartNum" class="h">0</strong></a>
				  </div>
				  </c:if>
				  </div>
				<div class="topMessage favorite">
				<c:if test="${UserName!=null }">
					<div class="menu-hd">
						<a target="_top" href="${pageContext.request.contextPath}/CollectionServlet?method=showCollection"><i
							class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
					</div>
					</c:if>
					<c:if test="${UserName==null }">
					<div class="menu-hd">
						<a target="_top" href="${pageContext.request.contextPath}/app/login.jsp"><i
							class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a>
					</div>
					</c:if>
					</div>
				</ul>
						</div>

						<!--悬浮搜索框-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="${pageContext.request.contextPath}/app/images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form action="${pageContext.request.contextPath}/ShowServlet?method=search" method="post" >
									<input id="searchInput" name="searchValue" type="text" placeholder="搜索" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="${pageContext.request.contextPath}/app/welcome.jsp">首页</a></li>        
							</ul>

						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">绑定邮箱</strong> / <small>Email</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">验证邮箱</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					<form class="am-form am-form-horizontal" method="post" id="emailform" name="chageEamil"  action="${pageContext.request.contextPath}/PersonServlet?method=chageEmail">
						<div class="am-form-group">
							<label for="user-email" class="am-form-label">验证邮箱</label>
							<div class="am-form-content">
								<input type="text" name="user-email" id="user-email" placeholder="请输入邮箱地址" onblur="checkEmail();">
							</div>
						</div>
						<div class="am-form-group code">
							<label for="user-code" class="am-form-label">验证码</label>
							<div class="am-form-content">
								<input type="text" id="user-code" placeholder="验证码">
							</div>
							<a class="btn" href="javascript:void(0);" onClick="sendEmailCode();" id="sendEmailCode">
								<div class="am-btn am-btn-danger"><span id="dyEmailButton">获取</span></div>
							</a>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="emailspan" style="color: red"></span>
						<div class="info-btn">
							<div class="am-btn am-btn-danger"><a style="color: white;" onclick="submit();">保存修改</a></div>
						</div>

					</form>

				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="${pageContext.request.contextPath}/app/welcome.jsp">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有</em>
						</p>
					</div>
				</div>
			</div>

			<aside class="menu">
				<ul>
					<li class="person">
						<a href="${pageContext.request.contextPath}/PersonServlet?method=go">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人资料</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/PersonServlet?method=information">个人信息</a></li>
							<li> <a href="${pageContext.request.contextPath}/app/safety.jsp">安全设置</a></li>
							<li> <a href="${pageContext.request.contextPath}/PersonServlet?method=lookAddress">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的交易</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders">订单管理</a></li>
							<li> <a href="change.html">退款售后</a></li>
						</ul>
					</li>
					

					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/CollectionServlet?method=showCollection">收藏</a></li>
							<li> <a href="${pageContext.request.contextPath}/FootServlet?method=showFoot">足迹</a></li>
							<li> <a href="${pageContext.request.contextPath}/OrderServlet?method=showComment">评价</a></li>
							
						</ul>
					</li>

				</ul>

			</aside>
		</div>

	</body>

</html>