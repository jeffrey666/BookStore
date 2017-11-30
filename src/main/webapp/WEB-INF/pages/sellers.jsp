<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css"
	href="${app}/staticfile/css/style.css" />
<link rel="stylesheet" href="${app}/staticfile/css/lightbox.css"
	type="text/css" media="screen" />

<script src="${app}/staticfile/js/prototype.js" type="text/javascript"></script>
<script src="${app}/staticfile/js/scriptaculous.js?load=effects"
	type="text/javascript"></script>
<script src="${app}/staticfile/js/lightbox.js" type="text/javascript"></script>
<script type="text/javascript" src="${app}/staticfile/js/java.js"></script>
</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">

		<div class="center_content">
			<div class="left_content">
				<div class="crumb_nav">
					<a href="index.html">home</a> &gt;&gt; product name
				</div>
				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>Product
					name
				</div>

				<div class="feat_prod_box_details">

					<div class="prod_img">
						<a href="details.html"><img
							src="${app}/staticfile/images/prod1.gif" alt="" title=""
							border="0" /></a> <br /> <br /> <a
							href="${app}/staticfile/images/big_pic.jpg" rel="lightbox"><img
							src="${app}/staticfile/images/zoom.gif" alt="" title=""
							border="0" /></a>
					</div>

					<div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">
							<div class="prod_title">Details</div>
							<p class="details">
								Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
								enim ad minim veniam, quis nostrud exercitation.<br /> Lorem
								ipsum dolor sit amet, consectetur adipisicing elit, sed do
								eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
								enim ad minim veniam, quis nostrud exercitation.
							</p>
							<div class="price">
								<strong>PRICE:</strong> <span class="red">100 $</span>
							</div>
							<div class="price">
								<strong>COLORS:</strong> <span class="colors"><img
									src="${app}/staticfile/images/color1.gif" alt="" title=""
									border="0" /></span> <span class="colors"><img
									src="${app}/staticfile/images/color2.gif" alt="" title=""
									border="0" /></span> <span class="colors"><img
									src="${app}/staticfile/images/color3.gif" alt="" title=""
									border="0" /></span>
							</div>
							<a href="details.html" class="more"><img
								src="${app}/staticfile/images/order_now.gif" alt="" title=""
								border="0" /></a>
							<div class="clear"></div>
						</div>

						<div class="box_bottom"></div>
					</div>
					<div class="clear"></div>
				</div>


				<div id="demo" class="demolayout">

					<ul id="demo-nav" class="demolayout">
						<li><a class="" href="#tab2">Related books</a></li>
						<li><a class="active" href="#tab1">More details</a></li>
					</ul>

					<div class="tabs-container">

						<div style="display: block;" class="tab" id="tab1">
							<p class="more_details">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit, sed do eiusmod tempor incididunt
								ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
								nostrud exercitation.</p>
							<ul class="list">
								<li><a href="#">Lorem ipsum dolor sit amet, consectetur
										adipisicing elit</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, consectetur
										adipisicing elit</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, consectetur
										adipisicing elit</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, consectetur
										adipisicing elit</a></li>
							</ul>
							<p class="more_details">Lorem ipsum dolor sit amet,
								consectetur adipisicing elit, sed do eiusmod tempor incididunt
								ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
								nostrud exercitation.</p>
						</div>

						<div style="display: none;" class="tab" id="tab2">
							<div class="new_prod_box">
								<a href="details.html">product name</a>
								<div class="new_prod_bg">
									<a href="details.html"><img
										src="${app}/staticfile/images/thumb1.gif" alt="" title=""
										class="thumb" border="0" /></a>
								</div>
							</div>

							<div class="new_prod_box">
								<a href="details.html">product name</a>
								<div class="new_prod_bg">
									<a href="details.html"><img
										src="${app}/staticfile/images/thumb2.gif" alt="" title=""
										class="thumb" border="0" /></a>
								</div>
							</div>

							<div class="new_prod_box">
								<a href="details.html">product name</a>
								<div class="new_prod_bg">
									<a href="details.html"><img
										src="${app}/staticfile/images/thumb3.gif" alt="" title=""
										class="thumb" border="0" /></a>
								</div>
							</div>

							<div class="new_prod_box">
								<a href="details.html">product name</a>
								<div class="new_prod_bg">
									<a href="details.html"><img
										src="${app}/staticfile/images/thumb1.gif" alt="" title=""
										class="thumb" border="0" /></a>
								</div>
							</div>

							<div class="new_prod_box">
								<a href="details.html">product name</a>
								<div class="new_prod_bg">
									<a href="details.html"><img
										src="${app}/staticfile/images/thumb2.gif" alt="" title=""
										class="thumb" border="0" /></a>
								</div>
							</div>

							<div class="new_prod_box">
								<a href="details.html">product name</a>
								<div class="new_prod_bg">
									<a href="details.html"><img
										src="${app}/staticfile/images/thumb3.gif" alt="" title=""
										class="thumb" border="0" /></a>
								</div>
							</div>



							<div class="clear"></div>
						</div>

					</div>


				</div>



				<div class="clear"></div>
			</div>
			<!--end of left content-->

			<div class="right_content">
				<div class="cart">
					<div id="view_cart">
						<span><img src="${app}/staticfile/images/cart.gif" alt=""  /> &nbsp;&nbsp;<a href="/search/toborrow"
							style="text-align: center; font-family: 微软雅黑; font-size: 22px;color:#860606">我的借阅</a></span>
					</div>
				</div>
				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/bullet3.gif" alt="" title="" /></span>Welcome
					to our Book Store!
				</div>
				<div class="about">
					<p>
						<%@include file="graph.jsp"%>
					</p>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<!--end of center content-->
	</div>
</body>
<%@include file="_foot.jsp"%>
<script type="text/javascript">
	var tabber1 = new Yetii({
		id : 'demo'
	});
</script>
</html>