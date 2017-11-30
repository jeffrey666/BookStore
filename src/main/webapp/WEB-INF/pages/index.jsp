<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css"
	href="${app}/staticfile/css/style.css" />
	
</head>

<%@include file="_head.jsp"%>
<body>
	<div id="wrap">
<div class="Ad1" style="color:red">没钱吗？没有女朋友吗,<br/>那你来找我,就好办了,你就有钱了,10分钟秒成高富帅,请咨询b哥热线客服:10066<br/><br/>
  <img src="${app}/staticfile/images/daikuan.jpg" alt="" />
</div>
		
		<div class="center_content">
			<div class="left_content">

				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>新书上架
				</div>

				<c:forEach items="${BookList}" var="book">
					<div class="feat_prod_box">

						<div class="prod_img">
							<a href="/details.action?bookId=${book.bookId}"><img
								src="${app}${book.bookInfo.imgurl}" width="98px" height="150px"
								alt="暂无图片" title="" border="0" /></a>
						</div>

						<div class="prod_det_box">
							<div class="box_top"></div>
							<div class="box_center">
								<div class="prod_title">
									<span style="font-size: 25px">${book.bookName}</span>
								</div>
								<p class="details">
									<span style="font-size: 15px"><strong>作者:</strong>${book.bookInfo.author}</span>
								</p>
								<p class="details">
									<span style="font-size: 15px"><strong>出版社:</strong>${book.bookInfo.bookPub}</span>
								</p>
								<p class="details">
									<span style="font-size: 15px"><strong>上传日期:</strong>
									<fmt:formatDate value="${book.bookInfo.updateTime}"
											pattern="yyyy-MM-dd" /></span>
								</p>

								<span style="font-size: 10px"> <a
									href="/details.action?bookId=${book.bookId}" class="more">-书籍详情
										-</a></span>
								<div class="clear"></div>
							</div>
							<div class="box_bottom"></div>
						</div>
						<div class="clear"></div>
					</div>
				</c:forEach>

				<%-- <div class="feat_prod_box">
<%@include file="_head.jsp"%>
<div id="wrap">

	<div class="center_content">
		<div class="left_content">

			<div class="title">
				<span class="title_icon"><img
					src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>新书上架
			</div>

			<c:forEach items="${BookList}" var="book">
				<div class="feat_prod_box">

					<div class="prod_img">
						<a href="/details.action?bookId=${book.bookId}"><img
							src="${app}${book.bookInfo.imgurl}" width="98px" height="150px"
							alt="" title="" border="0" /></a>
					</div>

					<div class="prod_det_box">
						<div class="box_top"></div>
						<div class="box_center">
							<div class="prod_title">
								<span style="font-size: 25px">${book.bookName}</span>
							</div>
							<p class="details">
								<span style="font-size: 15px"><strong>作者:</strong>${book.bookInfo.author}</span>
							</p>
							<p class="details">
								<span style="font-size: 15px"><strong>出版社:</strong>${book.bookInfo.bookPub}</span>
							</p>
							<p class="details">
								<span style="font-size: 15px"><strong>上传日期:</strong>
								<fmt:formatDate value="${book.bookInfo.updateTime}"
										pattern="yyyy-MM-dd" /></span>
							</p>

							<span style="font-size: 10px"> <a
								href="/details.action?bookId=${book.bookId}" class="more">-书籍详情
									-</a></span>
							<div class="clear"></div>
						</div>
						<div class="box_bottom"></div>
					</div>
					<div class="clear"></div>
				</div>
			</c:forEach>

			<%-- <div class="feat_prod_box">
>>>>>>> master
            
            	<div class="prod_img"><a href="details.html"><img src="${app}/staticfile/images/prod2.gif" alt="" title="" border="0" /></a></div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">Product name</div>
                    <p class="details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.</p>
                    <a href="/details" class="more">- more details -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>  --%>



				<%--  <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet2.gif" alt="" title="" /></span>New books</div> 
           
           <div class="new_products">
           
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/new_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/new_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/new_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>          
            
            </div>  --%>



				<!-- 主页右侧 -->
				<div class="clear"></div>
			</div>
			<!--end of left content-->

			<div class="right_content">


<<<<<<< HEAD
				<div class="cart">
					<div class="title">
						<span class="title_icon"><img
							src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My
						cart
					</div>
					<div class="home_cart_content">
						3 x items | <span class="red">TOTAL: 100$</span>
					</div>
					<a href="/toborrowCart" class="view_cart">view cart</a>
=======
			<div class="cart">
				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My cart
				</div>
				<div class="home_cart_content">
					3 x items | <span class="red">TOTAL: 100$</span>
				</div>
				<a href="/search/toborrow" class="view_cart">我的借阅</a>
>>>>>>> master

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
	<div class="Ad2" style="color:red">没有新鲜蔬菜吗？没有新鲜肉吗?还怕地沟油吗?还怕注水猪肉吗?欢迎来电:10088,只提供3绿产品<br/><br/><br/><br/><br/><br/><br/>
	<img src="${app}/staticfile/images/guoshu.jpg" alt="" />
	</div>
</body>
<%@include file="_foot.jsp"%>
</html>