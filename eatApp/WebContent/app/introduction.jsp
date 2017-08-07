<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>商品页面</title>

		<link href="/eatApp/app/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="/eatApp/app/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="/eatApp/app/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link type="text/css" href="/eatApp/app/css/optstyle.css" rel="stylesheet" />
		<link type="text/css" href="/eatApp/app/css/style.css" rel="stylesheet" />

		<script type="text/javascript" src="/eatApp/app/basic/js/jquery-1.7.min.js"></script>
		<script type="text/javascript" src="/eatApp/app/basic/js/quick_links.js"></script>

		<script type="text/javascript" src="/eatApp/app/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
		<script type="text/javascript" src="/eatApp/app/js/jquery.imagezoom.min.js"></script>
		<script type="text/javascript" src="/eatApp/app/js/jquery.flexslider.js"></script>
		<script type="text/javascript" src="/eatApp/app/js/list.js"></script>

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
function collect(){
	if($("#collectId").text()=="点击收藏"){
	$("#collectId").text("取消收藏");
	var snackid= $("#snackid").val();

	//NO1)创建AJAX异步对象
    var ajax = createAJAX();
    //NO2)准备发送请求
    var method = "GET";
    var url = "${pageContext.request.contextPath}/CollectionServlet?method=clickCollection&&id="+snackid+"&time=" + new Date().getTime();
    ajax.open(method,url);
    //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
    ajax.send(null);
    ajax.onreadystatechange = function(){
        if(ajax.readyState == 4){
            if(ajax.status == 200){
                //NO5)
				var tip = ajax.responseText;
                if(tip=="未登录"){
                window.location.href="${pageContext.request.contextPath}/app/login.jsp";
                }

            }



		}	

     }
	}else{
		$("#collectId").text("点击收藏");
		var snackid= $("#snackid").val();
		//NO1)创建AJAX异步对象
	    var ajax = createAJAX();
	    //NO2)准备发送请求
	    var method = "GET";
	    var url = "${pageContext.request.contextPath}/CollectionServlet?method=deleteCollection&&id="+snackid+"&time=" + new Date().getTime();
	    ajax.open(method,url);
	    //NO3)真正发送请求体的数据到服务器，如果请求体中无数据的话，就用null表示
	    ajax.send(null);

	}

 }


	function getCount(){
		var stockNum = $("#text_box").val();
		
		 var taste=$("#hiddenTaste").val();
		location.href = "${pageContext.request.contextPath}/CartServlet?method=putcart&snackId="+${snack.id}+"&stockNum="+stockNum+"&taste="+taste;
	}
	
	function decide(){
		var textNum = $("#text_box").val();
		var stockNum= $("#Stock").val();
		if (textNum > stockNum) {
			alert("库存不足，请重新输入！");
			location.href = "${pageContext.request.contextPath}/ShowServlet?method=introduction&id="+${snack.id};
		}
	}

	
	function loadMore(){
		if($("#loadMore").text()=="到底啦"){
			return;
		}else{
		   var current=parseInt($("#hiddenCurrent").val())+1;
		    var ajax = createAJAX();
		    var method = "GET";
		    var url = "${pageContext.request.contextPath}/ShowServlet?method=clickMore&currentPage="+current+"&snackid="+${snack.id}+"&time=" + new Date().getTime();
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
						var arrsJson = eval("("+str+")");
//[{"total":1,"datas":[{"id":5,"shopcunt":3,"shopcount":3,"shopid":4,"commentDate":null,"nickname":"史上最伟大的程序员","snackName":"","image":"","orderid":4,"comment":"挺好的","taste":"咸香","valuationlevel":1,"mktprice":0}],"totalCount":1,"current":1,"maxResult":1,"url":""}]
						for(var i=0 ; i<arrsJson.length;i++){
							$("#hiddenCurrent").val(arrsJson[i].current);
							var data= arrsJson[i].datas;
			     
							for(j=0;j<data.length;j++){
							var nickName=data[j].nickname;
							var time=data[j].commentDate;
							var comment=data[j].comment;
							var taste=data[j].taste
						
						var createli=$("<li class='am-comment'></li>");
						
						var creatediv=$("<div class='am-comment-main'></div>");
						var createHeader=$("<header class='am-comment-hd'></header>");
						var cteatediv2=$("<div class='am-comment-meta'></div>");
						var cteateA=$("<a href='#link-to-user' class='am-comment-author'></a>");
						cteateA.text(nickName);
						var createTime=$("<time datetime=''></time>");
						createTime.text(time);
						cteatediv2.append(cteateA);cteatediv2.append("  评论于    ");cteatediv2.append(createTime);
						createHeader.append(cteatediv2);
						creatediv.append(createHeader);
						var creatediv3=$("<div class='am-comment-bd'></div>")
						var creatediv6=$("<div class='tb-rev-item' data-id='255776406962'></div>")
						var creatediv4=$("<div class='J_TbcRate_ReviewContent tb-tbcr-content'></div>")
						creatediv4.text(comment);
						var creatediv5=$("<div class='tb-r-act-bar'></div>");
						creatediv5.text("口味:"+taste);
						creatediv6.append(creatediv4);creatediv6.append(creatediv5);
						creatediv3.append(creatediv6);
						createli.append($("<a><img class='am-comment-avatar' src='${pageContext.request.contextPath}/app/images/hwbn40x40.jpg' /></a>"));
						creatediv.append(creatediv3);
						createli.append(creatediv);
						$("#commentul").append(createli);
						}
						}
		            }



				}	

		     }
		}
	}
	
	function changeTaste(taste){
		var tasteVal=$(taste).text();
		$("#hiddenTaste").val(tasteVal);
	}
</script>
	</head>

	<body>

<input id="hiddenCurrent" type="hidden" value="${pageBean.current}">
		<!--顶部导航条 -->
		<div class="am-container header">
			<ul class="message-l">
				<div class="topMessage">
						  <c:if test="${UserName!=null}">
					       <div class="menu-hd">
					           <a class="h">亲爱的${NickName}</a>&nbsp;&nbsp;
					           <a class="h" href="${pageContext.request.contextPath}/UserServlet?method=logout">退出</a>
					       </div>
					    </c:if>
					      <c:if test="${UserName==null}">
						<div class="menu-hd">
							<a href="${pageContext.request.contextPath}/app/login.jsp" target="_top" class="h">亲，请登录</a>
							<a href="${pageContext.request.contextPath}/app/register.jsp" target="_top">免费注册</a>
						</div>
						</c:if>
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
				<div class="logo"><img src="${pageContext.request.contextPath}/app/images/logo.png" /></div>
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
            <b class="line"></b>
			<div class="listMain">

				<!--分类-->
			<div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="${pageContext.request.contextPath}/app/welcome.jsp">首页</a></li>
                                
							</ul>
						   
						</div>
			</div>
				<ol class="am-breadcrumb am-breadcrumb-slash">
					<li><a href="${pageContext.request.contextPath}/app/welcome.jsp">首页</a></li>
					<li><a href="#">分类</a></li>
					<li class="am-active">内容</li>
				</ol>
				<script type="text/javascript">
					$(function() {});
					$(window).load(function() {
						$('.flexslider').flexslider({
							animation: "slide",
							start: function(slider) {
								$('body').removeClass('loading');
							}
						});
					});
				</script>
				<div class="scoll">
					<section class="slider">
						<div class="flexslider">
							<ul class="slides">
							<c:forEach items="${sampleImage}" var="image" varStatus="count">
							   <c:if test="${count.index==0}">
								<li>
									<img src="${pageContext.request.contextPath}${image.image}" title="pic" />
								</li>
								</c:if>
								<c:if test="${count.index!=0}">
								<li>
									<img src="${pageContext.request.contextPath}${image.image}" />
								</li>
								</c:if>
								
								</c:forEach>
							</ul>
						</div>
					</section>
				</div>

				<!--放大镜-->
<div class="item-inform">
					<div class="clearfixLeft" id="clearcontent">

						<div class="box">
							<script type="text/javascript">
								$(document).ready(function() {
									$(".jqzoom").imagezoom();
									$("#thumblist li a").click(function() {
										$(this).parents("li").addClass("tb-selected").siblings().removeClass("tb-selected");
										$(".jqzoom").attr('src', $(this).find("img").attr("mid"));
										$(".jqzoom").attr('rel', $(this).find("img").attr("big"));
									});
								});
							</script>

							<div class="tb-booth tb-pic tb-s310">
								<a href="${pageContext.request.contextPath}${firstImage.image}"><img src="${pageContext.request.contextPath}${firstImage.image}" alt="细节展示放大镜特效" rel="${pageContext.request.contextPath}${firstImage.image}" class="jqzoom" /></a>
							</div>
							<ul class="tb-thumb" id="thumblist">
							<c:forEach items="${sampleImage}" var="image">
								<li class="tb-selected">
									<div class="tb-pic tb-s40">
										<a href="#"><img src="${pageContext.request.contextPath}${image.image}" mid="${pageContext.request.contextPath}${image.image}" big="${pageContext.request.contextPath}${image.image}"></a>
									</div>
								</li>
							</c:forEach>
								
							</ul>
						</div>

						<div class="clear"></div>
					</div>

					<div class="clearfixRight">



						<!--规格属性-->
						<!--名称-->
						<div class="tb-detail-hd">
							<h1>${snack.snackName }</h1>
						</div>
						<div class="tb-detail-list">
							<!--价格-->
							<div class="tb-detail-price">
								<!-- 隐藏的文本域 -->
                              <input id="snackid" type="hidden" value=${ requestScope.snack.id}>
								<li class="price iteminfo_price">
									<dt>促销价</dt>
									<dd><em>¥</em><b class="sys_item_price">${requestScope.snack.price }</b>  </dd>                                 
								</li>
								<li class="price iteminfo_mktprice">
									<dt>原价</dt>
									<dd><em>¥</em><b class="sys_item_mktprice">${requestScope.snack.mktprice }</b></dd>									
								</li>
								<div class="clear"></div>
							</div>

							
							
							<div class="clear"></div>

							<!--销量-->
							<ul class="tm-ind-panel">
						
								<li class="tm-ind-item tm-ind-sumCount canClick">
									<div class="tm-indcon"><span class="tm-label">累计销量</span><span class="tm-count">${requestScope.snack.totalSales }</span></div>
								</li>
								<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
									<div class="tm-indcon"><span class="tm-label">累计评价</span><span class="tm-count">${requestScope.snack.evaluate }</span></div>
								</li>
							</ul>
							<div class="clear"></div>

							<!--各种规格-->
							<dl class="iteminfo_parameter sys_item_specpara">
								<dt class="theme-login"><div class="cart-title">可选规格<span class="am-icon-angle-right"></span></div></dt>
								<dd>
									<!--操作页面-->

									<div class="theme-popover-mask"></div>

									<div class="theme-popover">
										<div class="theme-span"></div>
										<div class="theme-poptit">
											<a href="javascript:;" title="关闭" class="close">×</a>
										</div>
										<div class="theme-popbod dform">
											<form class="theme-signin" name="loginform" action="" method="post">

												<div class="theme-signin-left">

													<div class="theme-options">
														<div class="cart-title">口味</div>
														<ul>
														<c:forEach items="${taste}" var="taste" varStatus="count">
													     <c:if test="${count.index==0}">
													     <input id="hiddenTaste" type="hidden" value="${taste.name}">
															<li class="sku-line selected" onclick="changeTaste(this);">${taste.name}<i></i></li></c:if>
														<c:if test="${count.index!=0}">
															<li class="sku-line" onclick="changeTaste(this);">${taste.name}<i></i></li></c:if>
															</c:forEach>
														</ul>
													</div>
													
													<div class="theme-options">
														<div class="cart-title number">数量</div>
														<dd>
															<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
															<input id="text_box" name="stockNum" type="text" value="1" style="width:30px;" onblur="decide();" />
															<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
															<span id="Stock" class="tb-hidden">库存<span class="stock">${requestScope.snack.stock}</span>件</span>
														</dd>

													</div>
													<div class="clear"></div>

													<div class="btn-op">
														<div class="btn am-btn am-btn-warning">确认</div>
														<div class="btn close am-btn am-btn-warning">取消</div>
													</div>
												</div>
												<div class="theme-signin-right">
													<div class="img-info">
														<img src="${pageContext.request.contextPath}/app/images/songzi.jpg" />
													</div>
													<div class="text-info">
														<span class="J_Price price-now">¥39.00</span>
														<span id="Stock" class="tb-hidden">库存<span class="stock">${requestScope.snack.stock}</span>件</span>
													</div>
												</div>

											</form>
										</div>
									</div>

								</dd>
							</dl>
							<div class="clear"></div>
							<!--活动	-->
						<!--  	<div class="shopPromotion gold">
								<div class="hot">
									<dt class="tb-metatit">店铺优惠</dt>
									<div class="gold-list">
										<p>购物满2件打8折，满3件7折<span>点击领券<i class="am-icon-sort-down"></i></span></p>
									</div>
								</div>
								<div class="clear"></div>
								<div class="coupon">
									<dt class="tb-metatit">优惠券</dt>
									<div class="gold-list">
										<ul>
											<li>125减5</li>
											<li>198减10</li>
											<li>298减20</li>
										</ul>
									</div>
								</div>
							</div>
							-->
						</div>

						<div class="pay">
						
							<li>
								<div class="clearfix tb-btn tb-btn-buy theme-login">
									<a id="LikBuy" title="点此按钮到下一步确认购买信息" href="#">立即购买</a>
								</div>
							</li>
							<li>
								<div class="clearfix tb-btn tb-btn-basket theme-login">
									<a id="LikBasket" title="加入购物车" onclick="getCount();"><i></i>加入购物车</a>
								</div>
							</li>
							<li>
							<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>	
							</li>
							<li>
							<div class="clearfix tb-btn tb-btn-basket theme-login">
							
						<a id="collectId" title="喜欢可以先收藏哦" onclick="collect();"><i></i>${collection}</a>
							
							</div>
							</li>
						</div>

					</div>

					<div class="clear"></div>

				</div>

				<!--优惠套装
				<div class="match">
					<div class="match-title">优惠套装</div>
					<div class="match-comment">
						<ul class="like_list">
							<li>
								<div class="s_picBox">
									<a class="s_pic" href="#"><img src="${pageContext.request.contextPath}/app/images/cp.jpg"></a>
								</div> <a class="txt" target="_blank" href="#">萨拉米 1+1小鸡腿</a>
								<div class="info-box"> <span class="info-box-price">¥ 29.90</span> <span class="info-original-price">￥ 199.00</span> </div>
							</li>
							<li class="plus_icon"><i>+</i></li>
							<li>
								<div class="s_picBox">
									<a class="s_pic" href="#"><img src="${pageContext.request.contextPath}/app/images/cp2.jpg"></a>
								</div> <a class="txt" target="_blank" href="#">ZEK 原味海苔</a>
								<div class="info-box"> <span class="info-box-price">¥ 8.90</span> <span class="info-original-price">￥ 299.00</span> </div>
							</li>
							<li class="plus_icon"><i>=</i></li>
							<li class="total_price">
								<p class="combo_price"><span class="c-title">套餐价:</span><span>￥35.00</span> </p>
								<p class="save_all">共省:<span>￥463.00</span></p> <a href="#" class="buy_now">立即购买</a> </li>
							<li class="plus_icon"><i class="am-icon-angle-right"></i></li>
						</ul>
					</div>
				</div>-->
				<div class="clear"></div>
				
							
				<!-- introduce-->

				<div class="introduce">
					<div class="browse">
					    <div class="mc"> 
						     <ul>					    
						     	<div class="mt">            
						            <h2>看了又看</h2>        
					            </div>
					            <c:if test="${list==null}">
					            <h2>亲，您还没有登录哦~</h2>
					            </c:if>
						     	<c:forEach items="${list}" var="obj">
							      <li >
							      	<div class="p-img">                    
							      		<a  href="#"> <img class="" src="${pageContext.request.contextPath}${obj.image}"> </a>               
							      	</div>
							      	<div class="p-name"><a href="#">
							      		${obj.snackName}
							      	</a>
							      	</div>
							      	<div class="p-price"><strong>${obj.price}</strong></div>
							      </li>
							      </c:forEach>
							      
						     </ul>					
					    </div>
					</div>
					<div class="introduceMain">
						<div class="am-tabs" data-am-tabs>
							<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active">
									<a href="#">

										<span class="index-needs-dt-txt">宝贝详情</span></a>

								</li>

								<li>
									<a href="#">

										<span class="index-needs-dt-txt">全部评价</span></a>

								</li>

								<!--<li>
									<a href="#">

										<span class="index-needs-dt-txt">猜你喜欢</span></a>
								</li>-->
							</ul>

							<div class="am-tabs-bd">

								<div class="am-tab-panel am-fade am-in am-active">
									<div class="J_Brand">

										<div class="attr-list-hd tm-clear">
											<h4>产品参数：</h4></div>
										<div class="clear"></div>
										<ul id="J_AttrUL">
											<li title="">产品类型:&nbsp;${snack.type}</li>
											<li title="">原料产地:&nbsp;${snack.materialArea}</li>
											<li title="">产地:&nbsp;${snack.productionArea}</li>
											<li title="">配料表:&nbsp;${snack.dosing}</li>
											<li title="">产品规格:&nbsp;${snack.weight}</li>
											<li title="">保质期:&nbsp;${snack.expirationDate}</li>
											<li title="">储存方法：&nbsp;${snack.storeMethod} </li>
											<li title="">食用方法：&nbsp;${snack.edibleMethod}</li>
										</ul>
										<div class="clear"></div>
									</div>

									<div class="details">
										<div class="attr-list-hd after-market-hd">
											<h4>商品细节</h4>
										</div>
										<div class="twlistNews">
										<c:forEach items="${image}" var="obj">
											<img src="${pageContext.request.contextPath}${obj.image}" />
											</c:forEach>
										</div>
									</div>
									<div class="clear"></div>

								</div>

								<div class="am-tab-panel am-fade">
									
                                   
                                    <div class="clear"></div>
									<div class="tb-r-filter-bar">
										<ul class=" tb-taglist am-avg-sm-4">
											<li class="tb-taglist-li tb-taglist-li-current">
												<div class="comment-info">
													<span>全部评价</span>
													<span class="tb-tbcr-num">(${goodComment+middleComment+badComment})</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-1">
												<div class="comment-info">
													<span>好评</span>
													<span class="tb-tbcr-num">(${goodComment})</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li-0">
												<div class="comment-info">
													<span>中评</span>
													<span class="tb-tbcr-num">(${middleComment})</span>
												</div>
											</li>

											<li class="tb-taglist-li tb-taglist-li--1">
												<div class="comment-info">
													<span>差评</span>
													<span class="tb-tbcr-num">(${badComment})</span>
												</div>
											</li>
										</ul>
									</div>
									<div class="clear"></div>

									<ul id="commentul" class="am-comments-list am-comments-list-flip">
									<c:forEach items="${pageBean.datas}" var="data">
									
										<li class="am-comment">
											<!-- 评论容器 -->
											<a href="">
												<img class="am-comment-avatar" src="${pageContext.request.contextPath}/app/images/hwbn40x40.jpg" />
												<!-- 评论者头像 -->
											</a>

											<div class="am-comment-main">
												<!-- 评论内容容器 -->
												<header class="am-comment-hd">
													<!--<h3 class="am-comment-title">评论标题</h3>-->
													<div class="am-comment-meta">
														<!-- 评论元数据 -->
														<a href="#link-to-user" class="am-comment-author">${data.nickname}</a>
														<!-- 评论者 -->
														评论于
														<time datetime="">${data.commentDate}</time>
													</div>
												</header>

												<div class="am-comment-bd">
													<div class="tb-rev-item " data-id="255776406962">
														<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
															${data.comment}
														</div>
														<div class="tb-r-act-bar">
															口味：${data.taste}&nbsp;&nbsp;
														</div>
													</div>

												</div>
												<!-- 评论内容 -->
											</div>
										</li>
							
										</c:forEach>

									</ul>

									<div class="clear"></div>
                                      
									<!--分页
									<ul class="am-pagination am-pagination-right">
							<li><a href="#">${pageBean.current}/${pageBean.total}页</a></li>
								<li><a href="${pageContext.request.contextPath }/ShowServlet?method=introduction&currentPage=${pageBean.current-1}&id=${snack.id}">&laquo;</a></li>
								<li class="am-active"><a href="${pageContext.request.contextPath }/CollectionServlet?method=introduction&currentPage=1&id=${snack.id}">首页</a></li>
								<li><a href="${pageContext.request.contextPath }/ShowServlet?method=introduction&currentPage=${pageBean.total}&id=${snack.id}">末页</a></li>			
								<li><a href="${pageContext.request.contextPath }/ShowServlet?method=introduction&currentPage=${pageBean.current+1}&id=${snack.id}">&raquo;</a></li>
							</ul> -->
							 </br>
							
							 <div class="am-comment-bd"><i class="am-icon-refresh am-icon-fw"></i><a id="loadMore" onclick="loadMore();">${flag}</a></div>
							 
									<div class="clear"></div>

									<div class="tb-reviewsft">
										<div class="tb-rate-alert type-attention">购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。</div>
									</div>

								</div>

								<div class="am-tab-panel am-fade">
									<div class="like">
										<!-- <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
											<li>
												<div class="i-pic limit">
													<img src="${pageContext.request.contextPath}/app/images/imgsearch1.jpg" />
													<p>【良品铺子_开口松子】零食坚果特产炒货
														<span>东北红松子奶油味</span></p>
													<p class="price fl">
														<b>¥</b>
														<strong>298.00</strong>
													</p>
												</div>
											</li>
											
										</ul> -->
									</div>
									<div class="clear"></div>

									<!--分页 
									<ul class="am-pagination am-pagination-right">
										<li class="am-disabled"><a href="#">&laquo;</a></li>
										<li class="am-active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#">&raquo;</a></li>
									</ul>-->
									<div class="clear"></div>

								</div>

							</div>

						</div>

						<div class="clear"></div>

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

				</div>
			</div>
			<!--菜单 -->
			<div class=tip>
				<div id="sidebar">
					<div id="wrap">
						<div id="prof" class="item">
							<a href="#">
								<span class="setting"></span>
							</a>
							<div class="ibar_login_box status_login">
								<div class="avatar_box">
									<p class="avatar_imgbox"><img src="${pageContext.request.contextPath}/app/images/no-img_mid_.jpg" /></p>
									<ul class="user_info">
										<li>用户名：sl1903</li>
										<li>级&nbsp;别：普通会员</li>
									</ul>
								</div>
								<div class="login_btnbox">
									<a href="#" class="login_order">我的订单</a>
									<a href="${pageContext.request.contextPath}/CollectionServlet?method=showCollection" class="login_favorite">我的收藏</a>
								</div>
								<i class="icon_arrow_white"></i>
							</div>

						</div>
						<c:if test="${UserName!=null }">
					<div id="shopCart " class="item ">
						<a href="${pageContext.request.contextPath}/app/shopcart.jsp">
							<span class="message "></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num ">0</p>
					</div>
					</c:if>
					<c:if test="${UserName==null }">
					<div id="shopCart " class="item ">
						<a href="${pageContext.request.contextPath}/app/login.jsp">
							<span class="message "></span>
						</a>
						<p>
							购物车
						</p>
						<p class="cart_num ">0</p>
					</div>
					</c:if>
						<div id="asset" class="item">
							<a href="#">
								<span class="view"></span>
							</a>
							<div class="mp_tooltip">
								我的资产
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="foot" class="item">
							<a href="${pageContext.request.contextPath}/FootServlet?method=showFoot">
								<span class="zuji"></span>
							</a>
							<div class="mp_tooltip">
								我的足迹
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

						<div id="brand" class="item">
							<a href="${pageContext.request.contextPath}/CollectionServlet?method=showCollection">
								<span class="wdsc"><img src="${pageContext.request.contextPath}/app/images/wdsc.png" /></span>
							</a>
							<div class="mp_tooltip">
								我的收藏
								<i class="icon_arrow_right_black"></i>
							</div>
						</div>

					<!-- <div id="broadcast" class="item">
							<a href="#">
								<span class="chongzhi"><img src="${pageContext.request.contextPath}/app/images/chongzhi.png" /></span>
							</a>
							<div class="mp_tooltip">
								我要充值
								<i class="icon_arrow_right_black"></i>
							</div>
						</div> -->	

						<!--<div class="quick_toggle">
							<li class="qtitem">
								<a href="#"><span class="kfzx"></span></a>
								<div class="mp_tooltip">客服中心<i class="icon_arrow_right_black"></i></div>
							</li>-->
							<!--二维码 -->
							<!-- <li class="qtitem">
								<a href="#none"><span class="mpbtn_qrcode"></span></a>
								<div class="mp_qrcode" style="display:none;"><img src="${pageContext.request.contextPath}/app/images/weixin_code_145.png" /><i class="icon_arrow_white"></i></div>
							</li>
							<li class="qtitem">
								<a href="#top" class="return_top"><span class="top"></span></a>
							</li> -->
						</div>
                               
						<!--回到顶部 -->
						<div id="quick_links_pop" class="quick_links_pop hide"></div>

					</div>

				</div>
				<div id="prof-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						我
					</div>
				</div>
				<div id="shopCart-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						购物车
					</div>
				</div>
				<div id="asset-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						资产
					</div>

					

				</div>
				<div id="foot-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						足迹
					</div>
				</div>
				<div id="brand-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						收藏
					</div>
				</div>
				<div id="broadcast-content" class="nav-content">
					<div class="nav-con-close">
						<i class="am-icon-angle-right am-icon-fw"></i>
					</div>
					<div>
						充值
					</div>
				</div>
			</div>

	</body>

</html>