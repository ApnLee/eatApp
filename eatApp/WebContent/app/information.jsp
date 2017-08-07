<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人资料</title>

		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath}/app/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>		  
	<script type="text/javascript">
	 function saveInfo(){
	 $("#form").submit();
	 }
	</script>
	
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

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							 <div class="filePic">
								<input type="file"  class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" onchange="PreviewImage(this)" accept="image/*">
								<img class="am-circle am-img-thumbnail" src="${pageContext.request.contextPath}/app/images/getAvatar.do.jpg" alt="" />
							</div>
							
							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${User.nickname}</i></b></div>
								<div class="u-level">
									<span class="rank r2">
							             <s class="vip1"></s><a class="classes" href="#">铜牌会员</a>
						            </span>
								</div>
								<div class="u-safety">
									<a href="safety.jsp">
									 账户安全
									<span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">60分</i></span>
									</a>
								</div>
							</div>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form class="am-form am-form-horizontal" action="/eatApp/PersonServlet?method=saveInformation" id="form" method="post">

								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="nickname" name="nickname" value="${User.nickname}">

									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">姓名</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" placeholder="name" name="realname" value="${User.realname}">

									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
									<c:if test="${User.sex==0}">
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="1" data-am-ucheck> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="2" data-am-ucheck> 女
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="0" data-am-ucheck checked="checked"> 保密
										</label>
										</c:if>
										
									<c:if test="${User.sex==1}">
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="1" data-am-ucheck checked="checked"> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="2" data-am-ucheck> 女
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="0" data-am-ucheck > 保密
										</label>
										</c:if>
										
										<c:if test="${User.sex==2}">
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="1" data-am-ucheck> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="2" data-am-ucheck checked="checked"> 女
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="0" data-am-ucheck > 保密
										</label>
										</c:if>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content birth">
										<div class="birth-select">
											<select name="userYear">
									<c:forEach var="i" begin="1950" end="${year}">
											
												<c:choose>  
                                            <c:when test="${i==userYear}"> 
                                              <option  value="${i}" selected="selected">${i}</option>
                                                 </c:when>  
                                              <c:otherwise>
	                                          <option value="${i}">${i}</option>
                                               </c:otherwise>  
                                               </c:choose>  
												
									        </c:forEach>
											</select>
											<em>年</em>
										</div>
										<div class="birth-select2">
											<select name="userMonth" >
											<c:forEach var="i" begin="1" end="12">
												
												<c:choose>  
                                            <c:when test="${i==userMonth}"> 
                                              <option value="${i}" selected="selected">${i}</option>
                                                 </c:when>  
                                              <c:otherwise>
	                                          <option value="${i}">${i}</option>
                                               </c:otherwise>  
                                               </c:choose>  
												
											</c:forEach>
											</select>
											<em>月</em></div>
										<div class="birth-select2">
											<select name="userDay">
											<c:forEach var="i" begin="1" end="31">
												
												<c:choose>  
                                            <c:when test="${i==userDay}"> 
                                              <option value="${i}" selected="selected">${i}</option>
                                                 </c:when>  
                                              <c:otherwise>
	                                          <option value="${i}">${i}</option>
                                               </c:otherwise>  
                                               </c:choose>  
												
											 </c:forEach>
											</select>
											<em>日</em></div>
									</div>
							
								</div>
								
								<div class="info-btn">
									<div class="am-btn am-btn-danger" onclick="saveInfo();">保存修改</div>
								</div>

							</form>
						</div>

					</div>

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
						<a >个人资料</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/PersonServlet?method=information">个人信息</a></li>
							<li> <a href="${pageContext.request.contextPath}/app/safety.jsp">安全设置</a></li>
							<li> <a href="${pageContext.request.contextPath}/PersonServlet?method=lookAddress">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a >我的交易</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders">订单管理</a></li>
							<li> <a href="change.jsp">退款售后</a></li>
						</ul>
					</li>
					
		
					<li class="person">
						<a>我的小窝</a>
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