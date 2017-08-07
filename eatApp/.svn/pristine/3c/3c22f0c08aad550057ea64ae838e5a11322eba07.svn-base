<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/back/css/style.css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->

<style type="text/css">
body {
	overflow-x: hidden;
	overflow-y: auto;
}
</style>

<script src="${pageContext.request.contextPath }/back/js/jquery.js"></script>
<script
	src="${pageContext.request.contextPath }/back/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script>
	(function($) {
		$(window).load(
				function() {

					$("a[rel='load-content']").click(
							function(e) {
								e.preventDefault();
								var url = $(this).attr("href");
								$.get(url, function(data) {
									$(".content .mCSB_container").append(data); //load new content inside .mCSB_container
									//scroll-to appended content 
									$(".content").mCustomScrollbar("scrollTo",
											"h2:last");
								});
							});

					$(".content").delegate(
							"a[href='top']",
							"click",
							function(e) {
								e.preventDefault();
								$(".content").mCustomScrollbar("scrollTo",
										$(this).attr("href"));
							});

				});
	})(jQuery);
</script>
</head>
<body>
	<script>
		function checked() {
			
			snackName = $("*[name='snackName']").val();
			mktprice = $("*[name='mktprice']").val();
			image = $("*[name='image']").val();
			stock = $("*[name='stock']").val();
			
			type = $("*[name='type']").val();
			materialArea = $("*[name='materialArea']").val();
			productionArea = $("*[name='productionArea']").val();
			dosing = $("*[name='dosing']").val();
			weight = $("*[name='weight']").val();
			expirationDate = $("*[name='expirationDate']").val();
			storeMethod = $("*[name='storeMethod']").val();
			edibleMethod = $("*[name='edibleMethod']").val();

			if (snackName == "") {
				alert("商品名称不能为空！");
				return false;
			} else if (mktprice == "") {
				alert("商品价格不能为空！");
				return false;
			} else if (image == "") {
				alert("请选择要上传的图片！");
				return false;
			}else if (stock == "") {
				alert("库存不能为空！");
				return false;
			} else if (type == "") {
				alert("产品类型不能为空！");
				return false;
			} else if (materialArea == "") {
				alert("原料产地不能为空！");
				return false;
			} else if (productionArea == "") {
				alert("产地不能为空！");
				return false;
			} else if (dosing == "") {
				alert("配料表不能为空！");
				return false;
			} else if (weight == "") {
				alert("产品规格不能为空！");
				return false;
			} else if (expirationDate == "") {
				alert("保质期不能为空！");
				return false;
			} else if (storeMethod == "") {
				alert("储存方法不能为空！");
				return false;
			} else if (edibleMethod == "") {
				alert("食用方法不能为空！");
				return false;
			} else {
				return true;
			}
		}
	</script>
	<form action="${pageContext.request.contextPath}/BackSnackServlet?method=update" enctype="multipart/form-data" name="f" onSubmit="return checked()">
	<input type="hidden" name="id" value="${snack.id}">
	<h2>
		<strong style="color: grey;">修改商品信息页面</strong>
	</h2>
	<ul class="ulColumn2">
		<li>
			<span class="item_name" style="width: 120px;">商品名称：</span> 
			<input type="text" name="shopName" class="textbox textbox_295" placeholder="请输入商品名称" value="${snack.snackName}"/>
		</li>
		<li>
			<span class="item_name" style="width: 120px;">商品价格：</span> 
			<input type="text" name="mktprice" class="textbox textbox_295" placeholder="请输入商品价格" value="${snack.mktprice}"/>
		</li>
		<li>
			<span class="item_name" style="width: 120px;">促销价格：</span> 
			<input type="text" name="price" class="textbox textbox_295" placeholder="不促销可以不填" value="${snack.price}"/>
		</li>
		<li>
			<span class="item_name" style="width: 120px;">上传图片：</span> 
			<label class="uploadImg"> 
			<input type="file" name="image" value="${snack.image}" /> 
			<span>上传图片</span>
			</label>
		</li>
		<li>
			<span class="item_name" style="width: 120px;">库存：</span> 
			<input type="text" name="stock" class="textbox textbox_295" placeholder="请输入库存" value="${snack.stock}"/>
		</li>
		<li>
			<span class="item_name" style="width: 120px;">产品类型：</span> 
			<input type="text" name="type" class="textbox textbox_295" placeholder="请输入产品类型" value="${snack.type}"/>
		</li>
		<li>
		<span class="item_name" style="width: 120px;">原料产地：</span> 
		<input type="text" name="materialArea" class="textbox textbox_295" placeholder="请输入原料产地" value="${snack.materialArea}"/>
		</li>
		<li>
		<span class="item_name" style="width: 120px;">产地：</span> 
		<input type="text" name="productionArea" class="textbox textbox_295" placeholder="请输入产地" value="${snack.productionArea}"/>
		</li>
		<li>
		<span class="item_name" style="width: 120px;">配料表：</span> 
		<input type="text" name="dosing" class="textbox textbox_295" placeholder="请输入配料表" value="${snack.dosing}"/>
		</li>
		<li>
		<span class="item_name" style="width: 120px;">产品规格：</span> 
		<input type="text" name="weight" class="textbox textbox_295" placeholder="请输入产品规格" value="${snack.weight}"/>
		</li>
		<li>
		<span class="item_name" style="width: 120px;">保质期：</span> 
		<input type="text" name="expirationDate" class="textbox textbox_295" placeholder="请输入保质期" value="${snack.expirationDate}"/>
		</li>
		<li>
		<span class="item_name" style="width: 120px;">储存方法：</span> 
		<input type="text" name="storeMethod" class="textbox textbox_295" placeholder="请输入储存方法" value="${snack.storeMethod}"/>
		</li>
		<li>
		<span class="item_name" style="width: 120px;">食用方法：</span> 
		<input type="text" name="edibleMethod" class="textbox textbox_295" placeholder="请输入使用方法" value="${snack.edibleMethod}"/> 
		</li>
				
		<li>
			<span class="item_name" style="width: 120px;"></span> 
			<input type="submit" class="link_btn" value="修改" />
			<input type="reset" class="link_btn">
		</li>
	</ul>
	</form>
</body>
</html>