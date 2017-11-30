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

				<!-- 相关书籍 -->
				<div id="demo" class="demolayout">

					<ul id="demo-nav" class="demolayout">
						<li><a class="active" href="#tab1">全部</a></li>
						<li><a class="" href="#tab2">IT</a></li>
						<li><a class="" href="#tab3">文学</a></li>
						<li><a class="" href="#tab4">小说</a></li>
						<li><a class="" href="#tab5">军事</a></li>
					</ul>

					<div class="new_products">
						<div style="display: block;" class="tab" id="tab1">
							<c:forEach items="${categoryBooks}" var="b" varStatus="n">
							<c:if test="${n.index<12 }">
								<div class="new_prod_box">
									<a href="/details?bookId=${b.bookId}"><font color="blue">${b.bookName}</font></a>
									<div class="new_prod_bg">
										<a href="/details?bookId=${b.bookId}"><img
											src="${b.bookInfo.imgurl}" width="70px" height="90px"
											alt="图片暂无" title="" class="thumb" border="0" /></a>
									</div>
								</div>
							</c:if>
							</c:forEach>
							<div class="clear"></div>
						</div>

						<!-- 第二个 -->
						<!-- 相关书籍 -->
						<div style="display: none;" class="tab" id="tab2">

							<c:forEach items="${categoryBooks}" var="b">
								<c:if test="${b.bookInfo.category=='IT类'}">
									<div class="new_prod_box">
										<a href="/details.action?bookId=${b.bookId}">${b.bookName}</a>
										<div class="new_prod_bg">
											<a href="/details.action?bookId=${b.bookId}"><img
												src="${app}${b.bookInfo.imgurl}" width="60px" height="90px"
												alt="" title="" class="thumb" border="0" /></a>
										</div>
									</div>
								</c:if>
							</c:forEach>
							<div class="clear"></div>
						</div>


						<div style="display: none;" class="tab" id="tab3">
							<c:forEach items="${categoryBooks}" var="b">
								<c:if test="${b.bookInfo.category=='文学类'}">
									<div class="new_prod_box">
										<a href="/details.action?bookId=${b.bookId}">${b.bookName}</a>
										<div class="new_prod_bg">
											<a href="/details.action?bookId=${b.bookId}"><img
												src="${app}${b.bookInfo.imgurl}" width="60px" height="90px"
												alt="" title="" class="thumb" border="0" /></a>
										</div>
									</div>
								</c:if>
							</c:forEach>
							<div class="clear"></div>
						</div>


						<div style="display: none;" class="tab">
							<c:forEach items="${categoryBooks}" var="b">
								<c:if test="${b.bookInfo.category=='小说类'}">
									<div class="new_prod_box">
										<a href="/details.action?bookId=${b.bookId}">${b.bookName}</a>
										<div class="new_prod_bg">
											<a href="/details.action?bookId=${b.bookId}"><img
												src="${app}${b.bookInfo.imgurl}" width="60px" height="90px"
												alt="" title="" class="thumb" border="0" /></a>
										</div>
									</div>
								</c:if>
							</c:forEach>
							<div class="clear"></div>
						</div>

						<div style="display: none;" class="tab">
							<c:forEach items="${categoryBooks}" var="b">
								<c:if test="${b.bookInfo.category=='军事类'}">
									<div class="new_prod_box">
										<a href="/details.action?bookId=${b.bookId}">${b.bookName}</a>
										<div class="new_prod_bg">
											<a href="/details.action?bookId=${b.bookId}"><img
												src="${app}${b.bookInfo.imgurl}" width="60px" height="90px"
												alt="" title="" class="thumb" border="0" /></a>
										</div>
									</div>
								</c:if>
							</c:forEach>
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