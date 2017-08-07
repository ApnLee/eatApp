<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>发表评论</title>

		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/app/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/app/js/jquery-1.7.2.min.js"></script>
	</head>

<script type="text/javascript">
  function getLevel(ordetailid,node) {
	    var level=$(node).text();  
	    $('#'+ordetailid).attr("action","${pageContext.request.contextPath}/OrderServlet?method=gotoComment&orderDeailid="+ordetailid+"&level="+level);
        
  }
  function submit(ordetailid) {
	  $('#'+ordetailid).submit();
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

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>
                        
						<div class="comment-main">
						
						<c:forEach items="${orderDeatils }" var="orderDeatil">
							<div class="comment-list">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic">
									</a>
								</div>

								<div class="item-title">

									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">${orderDeatil.snackName}</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
											<span>口味：原味</span>
										</div>
										<div class="item-price">
											价格：<strong>${orderDeatil.mktprice}元</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<div class="item-comment">
								<form  method="post" id="${orderDeatil.id}" name="form">
									<textarea  name="comm${orderDeatil.id}" id="comm" placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
								</form>
								</div>
								
								<div class="item-opinion">
									<li onclick="getLevel(${orderDeatil.id},this);"><i class="op1"></i>好评</li>
									<li onclick="getLevel(${orderDeatil.id},this);"><i class="op2"></i>中评</li>
									<li onclick="getLevel(${orderDeatil.id},this);"><i class="op3"></i>差评</li>
								</div>
							</div>
							<div class="info-btn">
									<div class="am-btn am-btn-danger"><a style="color: white;" id="s${orderDeatil.id}" onclick="submit(${orderDeatil.id});" >发表评论</a></div>
								</div>							
							</br></br>
					</c:forEach>						
												
							
						</div>

					</div>

				</div>
				<script type="text/javascript">
						$(document).ready(function() {
							$(".comment-list .item-opinion li").click(function() {	
								$(this).prevAll().children('i').removeClass("active");
								$(this).nextAll().children('i').removeClass("active");
								$(this).children('i').addClass("active");
								
							});
				     })
					</script>		
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="href="${pageContext.request.contextPath}/app/welcome.jsp"">商城首页</a>
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
						<a >个人资料</a>
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
							<li> <a href="change.jsp">退款售后</a></li>
						</ul>
					</li>
			
					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/CollectionServlet?method=showCollection">收藏</a></li>
							<li> <a href="${pageContext.request.contextPath}/FootServlet?method=showFoot">足迹</a></li>
							<li class="active"> <a href="${pageContext.request.contextPath}/OrderServlet?method=showComment">评价</a></li>
						</ul>
					</li>

				</ul>

			</aside>
		</div>

	</body>
<script type="text/javascript">
$("#uploadImage").on("change", function(){
    // Get a reference to the fileList
    var files = !!this.files ? this.files : [];
 
    // If no files were selected, or no FileReader support, return
    if (!files.length || !window.FileReader) return;
 
    // Only proceed if the selected file is an image
    if (/^image/.test( files[0].type)){
 
        // Create a new instance of the FileReader
        var reader = new FileReader();
 
        // Read the local file as a DataURL
        reader.readAsDataURL(files[0]);
 
        // When loaded, set image data as background of div
        reader.onloadend = function(){
  
       $("#uploadPreview").css("background-image", "url("+this.result+")");
        
        }
 
    }
 
});
</script>
</html>