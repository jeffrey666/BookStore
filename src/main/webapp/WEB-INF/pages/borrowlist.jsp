<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
<title>借阅次数榜单</title>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/staticfile/css/bookupload.css" />
<script
	src="<%=request.getContextPath()%>/staticfile/js/jquery-1.6.2.js"></script>
<script src="<%=request.getContextPath()%>/staticfile/js/bookupload.js"></script>
<style type="text/css">
	body{
		font-family: "微软雅黑";
		background-color: #EDEDED;
	}
	h2{
		text-align: center;
	}
	table{ 
		margin: 0 auto; 
		/* width: 96%; */
		text-align: center;
		border-collapse:collapse;
	}
	td, th{ padding: 7px;}
	th{
		background-color: #DCDCDC;
	}
	th.ths{
		width: 100px;
	} 
	input.pnum{
		width:80px;
		height:25px;
		font-size: 18px;
		text-align:center;
	}
	
</style>
</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">
		<div class="center_content">
			<div class="left_content">
					<h2>借阅榜单</h2>
	<table border="1">
		<tr>
			<th class="ths">书籍图片</th>
			<th class="ths">书籍名称</th>
			<th class="ths">书籍作者</th>
			<th class="ths">书籍状态</th>
			<th class="ths">书籍借阅次数</th>
		</tr>
		<!-- 模版数据 -->
<%-- 通过jstl+el获取所有书籍组成的list集合, 遍历显示 --%>
	<c:forEach items="${xx.list}" var="prod">	
		<tr>
			<td>
				<a href="xxxx"><img width="120px" height="120px" src="${app}/xx.${imgurl}" alt="图片暂无" ></a>
			</td>
			<td>${xx}</td>
			<td><a href="xxxxxxx">${xx}</a></td>
			<td>${xx}</td>
			<td>${xx}</td>
			<td>${xx}</td>
			<td>${xxx}</td>
			<td></td>
		</tr>
		</c:forEach>
	</table>
				
			</div>
			<!--end of left content-->

			<div class="right_content">

				<div class="languages_box">

					<span class="red">Languages:</span> <a href="#"><img
						src="${app}/staticfile/images/gb.gif" alt="" title="" border="0" /></a>
					<a href="#"><img src="${app}/staticfile/images/fr.gif" alt=""
						title="" border="0" /></a> <a href="#"><img
						src="${app}/staticfile/images/de.gif" alt="" title="" border="0" /></a>

				</div>
				<div class="currency">
					<span class="red"> </span> <a href="#"></a> <a href="#"></a> <a
						href="#"><strong></strong></a>
				</div>


				<div class="cart">

					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My
						cart
					</div>

					<div class="home_cart_content">
						<span class="red"></span>
					</div>

					<a href="/tocart" class="view_cart">view cart</a>

				</div>

				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/bullet3.gif" alt="" title="" /></span>About
					Our Store
				</div>
				<div class="about">
					<p>
						<img src="images/about.gif" alt="" title="" class="right" />

					</p>

				</div>

				<div class="right_box">


					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/bullet4.gif" alt="" title="" /></span>Promotions
					</div>

					<div class="new_prod_box">
						<a href="details.html"></a>
						<div class="new_prod_bg">
							<span class="new_icon"><img
								src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
							<a href="details.html"><img
								src="${app}/staticfile/images/thumb1.gif" alt="" title=""
								class="thumb" border="0" /></a>
						</div>
					</div>

					<div class="new_prod_box">
						<a href="details.html"></a>
						<div class="new_prod_bg">
							<span class="new_icon"><img
								src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
							<a href="details.html"><img
								src="${app}/staticfile/images/thumb2.gif" alt="" title=""
								class="thumb" border="0" /></a>
						</div>
					</div>

					<div class="new_prod_box">
						<a href="details.html"></a>
						<div class="new_prod_bg">
							<span class="new_icon"><img
								src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
							<a href="details.html"><img
								src="${app}/staticfile/images/thumb3.gif" alt="" title=""
								class="thumb" border="0" /></a>
						</div>
					</div>

				</div>

				<div class="right_box">


					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/bullet5.gif" alt="" title="" /></span>Categories
					</div>

					<ul class="list">
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
					</ul>


					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/bullet6.gif" alt="" title="" /></span>Partners
					</div>


					<ul class="list">
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
						<li><a href="#"></a></li>
					</ul>

				</div>


			</div>
			<!--end of right content-->




			<div class="clear"></div>
		</div>
		<!--end of center content-->


		<%--        
       <div class="footer">

       	<div class="left_footer"><img src="${app}/staticfile/images/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>

        <div class="right_footer">
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
        <a href="#"></a>
       
        </div>
        
       
       </div> --%>



	</div>
</body>
<%@include file="_foot.jsp"%>
</html>




