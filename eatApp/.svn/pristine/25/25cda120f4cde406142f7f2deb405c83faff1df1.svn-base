<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

<link
	href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/app/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/app/css/addstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

<script type="text/javascript">
function submit() {
	 if($("#user-name").val()==""){
		 $("#addressSpan").text("请输入收货人姓名！") ;
		 return;
	 } 
	 var addressPhone=$("#addressPhone").val();
	 if(addressPhone==""){
		 $("#addressSpan").text("请输入手机号！") ;
		  return;
	 }
	 
	 if(!(/^1[3|4|5|7|8]\d{9}$/.test(addressPhone))){
		 $("#addressSpan").text("请输入正确的手机号！") ;
		 return;
	 }
	if($("#s_province").val()=="省份"){
		$("#addressSpan").text("请选择省份地址") ;
		return;
	}
	if($("#s_city").val()=="地级市"){
		$("#addressSpan").text("请选择市级地址") ;
		return;
	}
	if($("#s_county").val()=="市、县级市"){
		$("#addressSpan").text("请选择县级地址") ;
		return;
	}
 

	$("#addressform").submit();
}
</script>

</head>

<body>
<input id="addressProvince" type="hidden" value=${address.province}>
<input id="addressCity" type="hidden" value=${address.city}>
<input id="addressCounty" type="hidden" value=${address.county}>
	<!--头 -->
	<header> <article>
	<div class="mt-logo">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
					<div class="menu-hd">
						<a class="h">亲爱的${NickName}</a>&nbsp;&nbsp; <a class="h"
							href="${pageContext.request.contextPath}/UserServlet?method=logout">退出</a>
					</div>
				</div>
			</ul>
			<ul class="message-r">
				<div class="topMessage home">
					<div class="menu-hd">
						<a target="_top" class="h" href="${pageContext.request.contextPath}/app/welcome.jsp">商城首页</a>
					</div>
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
				<li><img
					src="${pageContext.request.contextPath}/app/images/logobig.png" /></li>
			</div>

			<div class="search-bar pr">
				<a name="index_none_header_sysc"></a>
				<form action="${pageContext.request.contextPath}/ShowServlet?method=search" method="post">
					<input id="searchInput" name="searchValue" type="text"
						placeholder="搜索" autocomplete="off"> <input
						id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
						type="submit">
				</form>
			</div>
		</div>

		<div class="clear"></div>
	</div>
	</div>
	</article> </header>

	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
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

				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
                       <c:if test="${list!=null}">
                       <c:forEach items="${list}" var="obj">
                       <c:if test="${obj.isdefault==1}">
						<li class="user-addresslist defaultAddr "><span id="span"
							class="new-option-r" ><i class="am-icon-check-circle" ></i><a  href="${pageContext.request.contextPath}/PersonServlet?method=setDefaultAddress&&id=${obj.id}" onclick="addclick();" style="color: black">默认地址</a></span>
							<p class="new-tit new-p-re">
								<span class="new-txt">${obj.consignee}</span> <span class="new-txt-rd2">${obj.phone}</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">${obj.province}</span>
									<span class="city">${obj.city}</span> <span class="dist">${obj.county}</span> &nbsp;&nbsp;<span
										class="street">${obj.address}</span>
								</p>
							</div>
							<div class="new-addr-btn">
							<a href="${pageContext.request.contextPath}/PersonServlet?method=updateAddress&&id=${obj.id}"><i class="am-icon-edit"></i>编辑</a> <span class="new-addr-bar">|</span>
								<a href="${pageContext.request.contextPath}/PersonServlet?method=deleteAddress&&id=${obj.id}" onClick="delClick(this);"><i
									class="am-icon-trash"></i>删除</a>
							</div></li>
							</c:if>
                         </c:forEach>
                         <c:forEach items="${list}" var="obj">
                       <c:if test="${obj.isdefault==0}">
						<li class="user-addresslist  "><span id="span"
							class="new-option-r" ><i class="am-icon-check-circle" ></i><a  href="${pageContext.request.contextPath}/PersonServlet?method=setDefaultAddress&&id=${obj.id}" onclick="addclick();" style="color: black">默认地址</a></span>
							<p class="new-tit new-p-re">
								<span class="new-txt">${obj.consignee}</span> <span class="new-txt-rd2">${obj.phone}</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：</span> <span class="province">${obj.province}</span>
									<span class="city">${obj.city}</span> <span class="dist">${obj.county}</span> &nbsp;&nbsp;<span
										class="street">${obj.address}</span>
								</p>
							</div>
							<div class="new-addr-btn">
							<a href="${pageContext.request.contextPath}/PersonServlet?method=updateAddress&&id=${obj.id}"><i class="am-icon-edit"></i>编辑</a> <span class="new-addr-bar">|</span>
								<a href="${pageContext.request.contextPath}/PersonServlet?method=deleteAddress&&id=${obj.id}" onClick="delClick(this);"><i
									class="am-icon-trash"></i>删除</a>
							</div></li>
							</c:if>
                         </c:forEach>
                         </c:if>
                         
					</ul>
					<div class="clear"></div>
					<a class="new-abtn-type"
						data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">

						<div class="add-dress">

							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal" id="addressform"
									name="form" method="post"
									action="/eatApp/PersonServlet?method=saveAddress">

									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" name="consignee" placeholder="收货人" value=${address.consignee}>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="addressPhone" name="phone" placeholder="手机号必填" type="text" value=${address.phone}>
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">


											<div class="info">
												<div>
													<select id="s_province" name="s_province" ></select> 
													<select	id="s_city" name="s_city"></select> 
													<select id="s_county" name="s_county"></select>
													<script class="resources library"
														src="${pageContext.request.contextPath}/app/js/area.js"
														type="text/javascript"></script>

												</div>
												<div id="show"></div>
											</div>



										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro" name="address"
												placeholder="输入详细地址" >${address.address}</textarea>
											<small>100字以内写出你的详细地址...</small>
										</div>
									</div>
                                    <span id="addressSpan" style="color: red"></span>
									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<a class="am-btn am-btn-danger" onclick="submit()">保存</a> <a href="javascript: void(0)"
												class="am-close am-btn am-btn-danger" onclick="history.go(-1)" data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>

						</div>

					</div>

				</div>

				<script type="text/javascript">
					$(document).ready(
							function() {
								$(".new-option-r").click(
										function() {
											$(this).parent('.user-addresslist')
													.addClass("defaultAddr")
													.siblings().removeClass(
															"defaultAddr");
										});

								var $ww = $(window).width();
								if ($ww > 640) {
									$("#doc-modal-1").removeClass(
											"am-modal am-modal-no-btn")
								}

							})
				</script>

				<div class="clear"></div>

			</div>
			<!--底部-->
			<div class="footer">
				<div class="footer-hd">
					<p>
						
					</p>
				</div>
				<div class="footer-bd">
					<p>
					 
					</p>
				</div>
			</div>
		</div>

		<aside class="menu">
		<ul>
			<li class="person"><a href="${pageContext.request.contextPath}/PersonServlet?method=go">个人中心</a></li>
			<li class="person"><a>个人资料</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/PersonServlet?method=information">个人信息</a></li>
					<li><a href="${pageContext.request.contextPath}/app/safety.jsp">安全设置</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/PersonServlet?method=lookAddress">收货地址</a></li>
				</ul></li>
			<li class="person"><a>我的交易</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders">订单管理</a></li>
					<li><a href="change.jsp">退款售后</a></li>
				</ul></li>
			

			<li class="person"><a>我的小窝</a>
				<ul>
					<li><a href="${pageContext.request.contextPath}/CollectionServlet?method=showCollection">收藏</a></li>
					<li><a href="${pageContext.request.contextPath}/FootServlet?method=showFoot">足迹</a></li>
					<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showComment">评价</a></li>
				</ul></li>

		</ul>

		</aside>
	</div>

</body>
<script type="text/javascript">
	_init_area();
</script>
<script type="text/javascript">
	var Gid = document.getElementById;
	var showArea = function() {
		Gid('show').innerHTML = "<h3>省" + Gid('s_province').value + " - 市"
				+ Gid('s_city').value + " - 县/区" + Gid('s_county').value
				+ "</h3>"
	}
	Gid('s_county').setAttribute('onchange', 'showArea()');
</script>

</html>