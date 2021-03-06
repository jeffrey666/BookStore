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
					<a href="#" onclick="window.history.back();">返回</a> &gt;&gt; 书籍详情
				</div>
				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>${book.bookName }</div>

				<div class="feat_prod_box_details">

					<div class="prod_img">
						<a href="#"><img src="${app}${book.bookInfo.imgurl}"
							width="98px" height="150px" alt="" title="" border="0" /></a> <br />
						<br /> <a href="${app}${book.bookInfo.imgurl}" rel="lightbox"><img
							src="${app}/staticfile/images/zoom.gif" alt="" title=""
							border="0" /></a>
					</div>

					<div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">
							<div class="prod_title">
								<strong>作者:</strong> ${book.bookInfo.author}
							</div>


							<div class="price">
								<strong>搜索次数:</strong> ${book.bookInfo.searchVolume}

							</div>

							<div class="price">
								<strong>借阅次数:</strong> ${book.bookInfo.borrowCount}
							</div>

							<div class="price">
								<strong>书籍状态:</strong>
								<c:if test="${book.state==1}">
									<span style="color: red">借出</span>
								</c:if>
								<c:if test="${book.state==0}">
									<span style="color: blue">可借</span>
								</c:if>
							</div>

							<div class="price">
								<strong>书籍简介:</strong> ${book.bookInfo.descripe}
							</div>

							<c:if test="${book.state==0}">
								<a href="/search/toborrow?bookId=${book.bookId}" class="more"><img
									src="${app}/staticfile/images/order_now.gif" alt="" title=""
									border="0" /></a>
							</c:if>
							<div class="clear"></div>
						</div>

						<div class="box_bottom"></div>
					</div>
					<div class="clear"></div>
				</div>

				<!-- 相关书籍 -->
				<div id="demo" class="demolayout">

					<ul id="demo-nav" class="demolayout">
						<li><a class="active" href="#tab1">名言警句</a></li>
						<li><a class="" href="#tab2">相关书籍</a></li>
					</ul>

					<div class="tabs-container">
						<div style="display: block;" class="tab" id="tab1">
							<p class="more_details"
								style="text-align: center; font-size: 20px">欢迎来到书籍的海洋,以书会友,开启智慧人生</p>
							<ul class="list">
								<li><p style="font-family: 楷体; font-size: 15px">书籍是人类进步的阶梯,终生的伴侣,最诚挚的朋友。
										-----高尔基</p></li>
								<li><p style="font-family: 楷体; font-size: 15px">一个家庭中没有书籍,等于一间房子没有窗子。
										----- 约翰森</p></li>
								<li><p style="font-family: 楷体; font-size: 15px">人是活的,书是死的.活人读死书,可以把书读活.死书读活人,可以把人读死.
										-----郭沫若</p></li>
								<li><p style="font-family: 楷体; font-size: 15px">阅读一本不适合自己阅读的书，比不阅读还要坏。我们必须会这样一种本领，选择最有价值、最适合自己所需要的读物。
										-----别林斯基</p></li>
							</ul>
						</div>
						<!-- 相关书籍 -->
						<div style="display: none;" class="tab" id="tab2">

							<c:forEach items="${bookList}" var="b">
								<div class="new_prod_box">
									<a href="/details.action?bookId=${b.bookId}">${b.bookName}</a>
									<div class="new_prod_bg">
										<a href="/details.action?bookId=${b.bookId}"><img
											src="${app}${b.bookInfo.imgurl}" width="60px" height="90px"
											alt="" title="" class="thumb" border="0" /></a>
									</div>
								</div>
							</c:forEach>

							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<!--end of left content-->

			<!-- 右侧区域 -->
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
		</div>
		<!--end of right content-->

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