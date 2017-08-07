<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>个人中心</title>

		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath}/app/css/systyle.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="/eatApp/app/basic/js/jquery-1.7.min.js"></script>


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

function loadMore(){
	
	if($("#loadMore").text()=="到底啦"){
		return;
	}else{
		
	   var current=parseInt($("#hiddenCurrent").val())+1;
	    var ajax = createAJAX();
	    var method = "GET";
	    var url = "${pageContext.request.contextPath}/PersonServlet?method=loadMore&currentPage="+current+"&time=" + new Date().getTime();
	    ajax.open(method,url);
	    //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
	    ajax.send(null);
	    ajax.onreadystatechange = function(){
	        if(ajax.readyState == 4){
	            if(ajax.status == 200){
	                //NO5)
					var str = ajax.responseText;
					if(str=="到底啦"){
						$("#loadMore").text("到底啦")
						return;
					}
//[{"total":2,"datas":[{"id":17,"evaluate":1113,"price":25,"totalSales":3333,"snackName":"手剥松子218g 坚果炒货零食新货巴西松子包邮","userid":1,"image":"/app/images/imgsearch1.jpg","snackid":4,"mktprice":35}],"totalCount":2,"current":2,"maxResult":1,"url":""}]					
					var arrsJson = eval("("+str+")");
					for(var i=0 ; i<arrsJson.length;i++){
						$("#hiddenCurrent").val(arrsJson[i].current);
						var data= arrsJson[i].datas;
		     
						for(j=0;j<data.length;j++){
						var snackName=data[j].snackName;
						var price=data[j].price;
						var evaluate=data[j].evaluate;
						var totalSales=data[j].totalSales;
						var image=data[j].image;
						var mktprice=data[j].mktprice;
						
						var div=$("<div class='s-item-wrap'></div>");
						var div1=$("<div class='s-item'></div>");
						var div2=$("<div class='s-pic'></div>");
						var a1=$("<a href='#' class='s-pic-link'></a>");
						var img=$("<img  class='s-pic-img s-guess-item-img'>");
						img.attr("src","${pageContext.request.contextPath}"+image);
						img.attr("alt",snackName);
						img.attr("title",snackName);
						a1.append(img);
						div2.append(a1);
						var div3=$("<div class='s-price-box'></div>");
						var span1=$("<span class='s-price'></span>");
						var em1=$("<em class='s-price-sign'></em>");em1.text("¥");
						var em2=$("<em class='s-value'></em>");em1.text(price);
						span1.append(em1);span1.append(em2);
						var span2=$("<span class='s-history-price'></span>");
						var em3=$("<em class='s-price-sign'></em>");em3.text("¥");
						var em4=$("<em class='s-value'></em>");em4.text(mktprice);
						span2.append(em3);span2.append(em4);
						div3.append(span1);div3.append(span2);
						var div4=$("<div class='s-title'></div>");
						var a2=$("<a href=''#'></a>");
						a2.attr("title",snackName);a2.text(snackName);
						div4.append(a2);
						var div5=$("<div class='s-extra-box'></div>");
						var span3=$("<span class='s-comment'></span>");span3.text("评价:"+evaluate);
						var span4=$("<span class='s-sales'></span>");span4.text("销量:"+totalSales);
						div5.append(span3);div5.append(span4);
						div1.append(div2);div1.append(div3);div1.append(div4);div1.append(div5);
						div.append(div1);
						$("#adddiv").append(div);
						
						
						}
						}
}
       }
}
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
								<li class="index"><a href="#">首页</a></li>
                          
							</ul>
						   
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="wrap-left">
						<div class="wrap-list">
							<div class="m-user">
								<!--个人信息 -->
								<div class="m-bg"></div>
								<div class="m-userinfo">
									<div class="m-baseinfo">
										<a href="information.jsp">
											<img src="${pageContext.request.contextPath}/app/images/getAvatar.do.jpg">
										</a>
										<em class="s-name">${NickName }<span class="vip1"></em>
										
									</div>
									<div class="m-right">
										<div class="m-address">
											<a href="${pageContext.request.contextPath}/PersonServlet?method=lookAddress" class="i-trigger">我的收货地址</a>
										</div>
									</div>
								</div>

								<!--个人资产-->
								<div class="m-userproperty">
									
									<p class="m-bonus">
											
									</p>
									<p class="m-coupon">
										
									</p>
									<p class="m-bill">
										
									</p>
									<p class="m-big">
										
									</p>
									<p class="m-big">
										
									</p>
								</div>
							</div>
							<div class="box-container-bottom"></div>

							<!--订单 -->
							<div class="m-order">
								<div class="s-bar">
									<i class="s-icon"></i>我的订单
									<a class="i-load-more-item-shadow" href="${pageContext.request.contextPath}/OrderServlet?method=showOrders"">全部订单</a>
								</div>
								<ul>
									<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders"><i><img src="${pageContext.request.contextPath}/app/images/pay.png"/></i><span>待付款<em class="m-num">${statu5 }</em></span></a></li>
									<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders"><i><img src="${pageContext.request.contextPath}/app/images/send.png"/></i><span>待发货<em class="m-num">${statu3 }</em></span></a></li>
									<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders"><i><img src="${pageContext.request.contextPath}/app/images/receive.png"/></i><span>待收货<em class="m-num">${statu4 }</em></span></a></li>
									<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders"><i><img src="${pageContext.request.contextPath}/app/images/comment.png"/></i><span>待评价<em class="m-num">${statu6 }</em></span></a></li>
									<li><a href="change.jsp"><i><img src="${pageContext.request.contextPath}/app/images/refund.png"/></i><span>退换货</span></a></li>
								</ul>
							</div>


							<!--收藏夹 -->
							<div class="you-like">
								<div class="s-bar">我的收藏
									
								</div>
								<div id="adddiv" class="s-content">
								<c:forEach items="${pageBean.datas}" var="pageBean">
									<div class="s-item-wrap">
										<div class="s-item">

											<div class="s-pic">
												<a href="#" class="s-pic-link">
													<img src="${pageContext.request.contextPath}${pageBean.image}" alt="${pageBean.snackName}" title="${pageBean.snackName}" class="s-pic-img s-guess-item-img">
												</a>
											</div>
											<div class="s-price-box">
												<span class="s-price"><em class="s-price-sign">¥</em><em class="s-value">${pageBean.price}</em></span>
												<span class="s-history-price"><em class="s-price-sign">¥</em><em class="s-value">${pageBean.mktprice}</em></span>

											</div>
											<div class="s-title"><a href="#" title="${pageBean.snackName}">${pageBean.snackName}</a></div>
											<div class="s-extra-box">
												<span class="s-comment">评价:${pageBean.evaluate}</span>
												<span class="s-sales">销量:${pageBean.totalSales}</span>

											</div>
										</div>
									</div>
                          </c:forEach>
								</div>

								<div  class="s-more-btn i-load-more-item" data-screen="0"><i class="am-icon-refresh am-icon-fw"></i><a id="loadMore"  onclick="loadMore();">${flag}</a></div>
                                   <input id="hiddenCurrent" type="hidden" value="${pageBean.current}">
							</div>

						</div>
					</div>
					<div class="wrap-right">

						<!-- 日历-->
						<div class="day-list">
							<div class="s-bar">
								<a class="i-history-trigger s-icon" href="#"></a>我的日历
								<a class="i-setting-trigger s-icon" href="#"></a>
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
									<em id="dayspan">21</em>
									<span id="weekspan">星期一</span>
									<span id="yearspan">2015.12</span>
								</div>
							</div>
						</div>
						<!--新品 -->
						<div class="new-goods">
							<div class="s-bar">
								<i class="s-icon"></i>最新商品
							</div>
							<div class="new-goods-info">
								<a class="shop-info" href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${snack.id}" target="_blank">
									<div class="face-img-panel">
										<img src="${pageContext.request.contextPath}${snack.image}" alt="">
									</div>
									
									<span class="shop-title">${snack.snackName}</span>
								</a>
								<a href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${snack.id}" class="follow " target="_blank">进入</a>
							</div>
						</div>

						<!--热卖推荐 -->
						<div class="new-goods">
							<div class="s-bar">
								<i class="s-icon"></i>热卖推荐
							</div>
							<div class="new-goods-info">
								<a class="shop-info" href="${pageContext.request.contextPath}/ShowServlet?method=introduction&id=${snackCount.id}" target="_blank">
									<div >
										<img src="${pageContext.request.contextPath}${snackCount.image}" alt="">
									</div>
                                    <span class="one-hot-goods">￥${snackCount.price}</span>
								</a>
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
					<li class="person active">
						<a href="${pageContext.request.contextPath}/PersonServlet?method=go">个人中心</a>
					</li>
					<li class="person">
						<a>个人资料</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/PersonServlet?method=information">个人信息</a></li>

							<li> <a href="${pageContext.request.contextPath}/app/safety.jsp">安全设置</a></li>
							<li> <a href="${pageContext.request.contextPath}/PersonServlet?method=lookAddress">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a>我的交易</a>
						<ul>
							<li><a href="${pageContext.request.contextPath}/OrderServlet?method=showOrders">订单管理</a></li>
							<li> <a href="change.jsp">退款售后</a></li>
						</ul>
					</li>
					<!--  <li class="person">
						<a>我的资产</a>
						<ul>
							<li> <a href="coupon.jsp">优惠券 </a></li>
							<li> <a href="bonus.jsp">红包</a></li>
							<li> <a href="bill.jsp">账单明细</a></li>
						</ul>
					</li>-->

					<li class="person">
						<a>我的小窝</a>
						<ul>
							<li> <a href="${pageContext.request.contextPath}/CollectionServlet?method=showCollection">收藏</a></li>
							<li> <a href="${pageContext.request.contextPath}/FootServlet?method=showFoot">足迹</a></li>
							<li> <a href="${pageContext.request.contextPath}/OrderServlet?method=showComment">评价</a></li>
							<!-- <li> <a href="news.jsp">消息</a></li> -->
						</ul>
					</li>

				</ul>

			</aside>
		</div>
		<!--引导 -->
		<div class="navCir">
			<li><a href="${pageContext.request.contextPath}/app/welcome.jsp"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="home/sort.jsp"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="home/shopcart.jsp"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li class="active"><a href="index.jsp"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>
	<script type="text/javascript">
	var date=new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
     var weekend=date.getDay();  
 	 var Week = ['日','一','二','三','四','五','六']; 
 	 document.getElementById("yearspan").innerHTML=year+"."+month;
 	document.getElementById("dayspan").innerHTML=day;
 	document.getElementById("weekspan").innerHTML="星期"+Week[weekend];
	</script>
	</html>
