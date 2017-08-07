<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>订单管理</title>

		<link href="/eatApp/app/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/eatApp/app/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="/eatApp/app/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/eatApp/app/css/orstyle.css" rel="stylesheet" type="text/css">

		<script src="/eatApp/app/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="/eatApp/app/AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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

					<div class="user-order">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有订单</a></li>
								<li><a href="#tab2">待付款</a></li>
								<li><a href="#tab3">待发货</a></li>
								<li><a href="#tab4">待收货</a></li>
								<li><a href="#tab5">待评价</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										     <c:forEach  var="order" items="${pageBean.datas}">
										     <c:if test="${order.orderStatus==1 }">
										     <!--交易成功-->
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id }</a></div>
													<span>成交时间：${order.orderdate }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													<c:forEach var="orderDeatil" items="${order.orderDeatils }">
													
													
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p>${orderDeatil.snackName}</p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
                                                               </c:forEach><!-- 订单详情 -->
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/OrderServlet?method=showlogistics&orderid=${order.id}">查看物流</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	<a href="${pageContext.request.contextPath}/OrderServlet?method=delOrder&orderid=${order.id}">删除订单</a></div>
															</li>
														</div>
													</div>
												</div>
											</div>
										     </c:if><!-- 订单状态判断 -->
										     
										     <c:if test="${order.orderStatus==2 }">
										        
											<!--交易失败-->
											<div class="order-status0">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id}</a></div>
													<span>成交时间：${order.orderdate }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													
													  <c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p>${orderDeatil.snackName}</p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	
																</div>
															</li>
														</ul>
                                                            </c:forEach>
												
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易关闭</p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	<a href="${pageContext.request.contextPath}/OrderServlet?method=delOrder&orderid=${order.id}">删除订单</a></div>
															</li>
														</div>
													</div>
												</div>
											</div>	
										     </c:if><!-- 订单状态判断 -->
										     
										      <c:if test="${order.orderStatus==3 }">
										            <!--待发货-->
											<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id }</a></div>
													<span>成交时间：${order.orderdate }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													    <c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p>${orderDeatil.snackName}</p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款</a>
																</div>
															</li>
														</ul>
                                                       </c:forEach>
														
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	提醒发货</div>
															</li>
														</div>
													</div>
												</div>
											</div>
										       
										      
										      </c:if><!-- 订单状态判断 -->
										      
										     <c:if test="${order.orderStatus==4 }">
										         <!--待收货-->
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id}</a></div>
													<span>成交时间：${order.orderdate }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													     <c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p>${orderDeatil.snackName}</p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
                                                           </c:forEach>
														

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/OrderServlet?method=showlogistics&orderid=${order.id}">查看物流</a></p>
																	<p class="order-info"><a href="#">延长收货</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	<a href="${pageContext.request.contextPath }/OrderServlet?method=verifyOrder&id=${order.id}">确认收货</a></div>
															</li>
														</div>
													</div>
												</div>

											</div>
										     </c:if><!-- 订单状态判断 -->
										      <c:if test="${order.orderStatus==5 }">
										              <!-- 待付款 -->
										          <div class="order-status1">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id }</a></div>
													<span>成交时间：}${order.orderdate }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													    <c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image }" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p><p>${orderDeatil.snackName}</p></p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
                                                          </c:forEach>
														
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">等待买家付款</p>
																	<p class="order-info"><a href="#">取消订单</a></p>

																</div>
															</li>
															<li class="td td-change">
																<a href="pay.jsp">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>

												</div>
											</div>
										      
										      </c:if><!-- 订单状态判断 -->
										       <c:if test="${order.orderStatus==6 }">
											<!--不同状态的订单	-->
										<div class="order-status4">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id }</a></div>
													<span>成交时间：${order.orderdate }</span>

												</div>
												<div class="order-content">
													<div class="order-left">
													<c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p>${orderDeatil.snackName}</p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.jsp">退款/退货</a>
																</div>
															</li>
														</ul>
                                                           </c:forEach>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																	<p class="order-info"><a href="orderinfo.jsp">订单详情</a></p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/OrderServlet?method=showlogistics&orderid=${order.id}">查看物流</a></p>
																</div>
															</li>
															<li class="td td-change">
																<a href="${pageContext.request.contextPath}/OrderServlet?method=comment&orderid=${order.id}">
																	<div class="am-btn am-btn-danger anniu">
																		评价商品</div>
																</a>
															</li>
														</div>
													</div>
												</div>
											</div>
											</c:if>
											</c:forEach><!-- 订单 -->
											<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.current-1}">&laquo;</a></li>
								<li class="am-active"><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=1">首页</a></li>
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.total}">末页</a></li>			
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.current+1}">&raquo;</a></li>
							</ul>
										</div>
									</div>
								</div>
								
								
								
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										      <c:forEach  var="order" items="${pageBean.datas }">
										<c:if test="${order.orderStatus==5 }">
										              <!-- 待付款 -->
										          <div class="order-status1">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id }</a></div>
													<span>成交时间：${order.orderdate }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													    <c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image }" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p><p>${orderDeatil.snackName}</p></p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">

																</div>
															</li>
														</ul>
                                                          </c:forEach>
														
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">等待买家付款</p>
																	<p class="order-info"><a href="#">取消订单</a></p>

																</div>
															</li>
															<li class="td td-change">
																<a href="pay.jsp">
																<div class="am-btn am-btn-danger anniu">
																	一键支付</div></a>
															</li>
														</div>
													</div>

												</div>
											</div>
										      
										      </c:if><!-- 订单状态判断 -->
											</c:forEach><!-- 订单 -->
										</div>

									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<c:forEach  var="order" items="${pageBean.datas }">
											  <c:if test="${order.orderStatus==3 }">
										            <!--待发货-->
											<div class="order-status2">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id }</a></div>
													<span>成交时间：${order.orderdate }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													    <c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p>${orderDeatil.snackName}</p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款</a>
																</div>
															</li>
														</ul>
                                                       </c:forEach>
														
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	提醒发货</div>
															</li>
														</div>
													</div>
												</div>
											</div>
							      
										      </c:if><!-- 订单状态判断 -->
								
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<c:forEach  var="order" items="${pageBean.datas}">
											  <c:if test="${order.orderStatus==4 }">
										         <!--待收货-->
											<div class="order-status3">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id}</a></div>
													<span>成交时间：${order.orderdate }</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
													<div class="order-left">
													     <c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p>${orderDeatil.snackName}</p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.html">退款/退货</a>
																</div>
															</li>
														</ul>
                                                           </c:forEach>
														

													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
															
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																	<p class="order-info"><a href="orderinfo.html">订单详情</a></p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/OrderServlet?method=showlogistics&orderid=${order.id}">查看物流</a></p>
																	<p class="order-info"><a href="#">延长收货</a></p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu">
																	<a href="${pageContext.request.contextPath }/OrderServlet?method=verifyOrder&id=${order.id}" >确认收货</a></div>
															</li>
														</div>
													</div>
												</div>

											</div>
										     </c:if><!-- 订单状态判断 -->
										     
											</c:forEach>
												<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.current-1}">&laquo;</a></li>
								<li class="am-active"><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=1">首页</a></li>
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.total}">末页</a></li>			
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.current+1}">&raquo;</a></li>
							</ul>
										</div>
									</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">商品操作</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach  var="order" items="${pageBean.datas }">
											  <c:if test="${order.orderStatus==6 }">
											<!--不同状态的订单	-->
										<div class="order-status4">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${order.id }</a></div>
													<span>成交时间：${order.orderdate }</span>

												</div>
												<div class="order-content">
													<div class="order-left">
													<c:forEach var="orderDeatil" items="${order.orderDeatils }">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }" class="J_MakePoint">
																		<img src="${pageContext.request.contextPath}${orderDeatil.image}" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${orderDeatil.shopid }">
																			<p>${orderDeatil.snackName}</p>
																			<p class="info-little">口味：原味
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${orderDeatil.mktprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×</span>${orderDeatil.shopcount}
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																	<a href="refund.jsp">退款/退货</a>
																</div>
															</li>
														</ul>
                                                           </c:forEach>
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																合计：${order.totalprice }
																
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																	<p class="order-info"><a href="orderinfo.jsp">订单详情</a></p>
																	<p class="order-info"><a href="${pageContext.request.contextPath}/OrderServlet?method=showlogistics&orderid=${order.id}">查看物流</a></p>
																</div>
															</li>
															<li class="td td-change">
																<a href="${pageContext.request.contextPath}/OrderServlet?method=comment&orderid=${order.id}">
																	<div class="am-btn am-btn-danger anniu">
																		评价商品</div>
																</a>
															</li>
														</div>
													</div>
												</div>
											</div>
											</c:if>
											</c:forEach>
												<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.current-1}">&laquo;</a></li>
								<li class="am-active"><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=1">首页</a></li>
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.total}">末页</a></li>			
								<li><a href="${pageContext.request.contextPath }/OrderServlet?method=showOrders&currentPage=${pageBean.current+1}">&raquo;</a></li>
							</ul>
										</div>

									</div>

								</div>
							</div>

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
							<li class="active"><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders">订单管理</a></li>
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