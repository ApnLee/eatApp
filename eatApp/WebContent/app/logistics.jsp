<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>物流</title>

		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/app/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/css/lostyle.css" rel="stylesheet" type="text/css">

	</head>

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
								<div class="menu-hd"><a href="#" target="_top" class="h">商城首页</a></div>
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
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
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
								<li class="index"><a href="#">首页</a></li>
							</ul>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="user-logistics">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">物流跟踪</strong> / <small>Logistics&nbsp;History</small></div>
						</div>
						<hr/>
						<div class="package-title">
							<div class="m-item">
								<div class="item-pic">
								
								</div>
								<div class="item-info">
									<p class="log-status">物流状态： </p>
									
								</div>
							</div>
                         <div class="clear"></div>
						</div>
						<div class="package-status">
							<ul class="status-list">
							<c:forEach items="${list}" var="s">
							
									<p>${s}</p>
						
							</c:forEach>	
							</ul>
						</div>
					</div>
				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
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