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
<body>
<%@include file="_head.jsp" %>
<div id="wrap">    
       
       <div class="center_content">
       	<div class="left_content">
        	
            <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>新书上架</div>
        
        	<c:forEach items="${BookList}" var="book">
        	<div class="feat_prod_box">
            
            	<div class="prod_img"><a href="/details.action?bookId=${book.bookId}"><img src="${app}${book.bookInfo.imgurl}" width="98px" height="150px" alt="暂无图片" title="" border="0" /></a></div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title"><span style="font-size:25px">${book.bookName}</span></div>
                    <p class="details"><span style="font-size:15px"><strong>作者:</strong>${book.bookInfo.author}</span></p>
                     <p class="details"><span style="font-size:15px"><strong>出版社:</strong>${book.bookInfo.bookPub}</span></p>
                    <p class="details"><span style="font-size:15px"><strong>上传日期:</strong><fmt:formatDate value="${book.bookInfo.updateTime}" pattern="yyyy-MM-dd" /></span></p>
                     
                   <span style="font-size:10px"> <a href="/details.action?bookId=${book.bookId}" class="more">-书籍详情 -</a></span>
                    <div class="clear"></div>
                    </div>
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            </c:forEach>

			<!-- 主页右侧 -->
			<div class="clear"></div>
		</div>
		<!--end of left content-->

		<div class="right_content">


			<div class="cart">
				<div class="title">
					<span class="title_icon"><img
						src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My
						cart
				</div>
				<div class="home_cart_content">
					3 x items | <span class="red">TOTAL: 100$</span>
				</div>

				<a href="/search/toborrow" class="view_cart">我的借阅</a>
			</div>

			<div class="title">
				<span class="title_icon"><img
					src="${app}/staticfile/images/bullet3.gif" alt="" title="" /></span>Welcome to our Book Store!
			</div>
			<div class="about">
				<p>
					<%@include file="graph.jsp" %>
				</p>

			</div>
			</div>

		</div>
		<!--end of right content-->

		<div class="clear"></div>
	</div>
	<!--end of center content-->
</body>
<%@include file="_foot.jsp"%>
</html>