<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />
<script src="${app }/staticfile/js/jquery-1.6.2.js"></script>

<script src="${app }/staticfile/js/common.js"></script>
</head>
<%@include file="_head.jsp"%>
<body>

<form action="">
	<div id="wrap">

		<div class="center_content">
			<div class="left_content2">
				<div class="title1" align="center"
					style="font-size: 15px; color: #F00">我的仓库--当前第${num}页</div>

				<div class="feat_prod_box_details">

					<table class="cart_table1" align="center" cellspacing="0" cellpadding="5px" border="1">
						
						<tr class="cart_title">
							<td width="40px" class="tableHeader"><input type="checkbox" name="bookId" onclick="checkAll('bookId',this)"></td>
							<td width="40px">商品序号:</td>
							<td width="88px">商品图片:</td>
							<td width="40px">商品名称:</td>
							<td width="40px">商品作者:</td>
							<td width="40px">图书类别:</td>
							<td width="60px">图书出版社:</td>
							<td width="80px">出版日期</td>
							<td width="80px">状态</td>
							<td width="80px">借出时间:</td>
							<td width="80px">归还时间:</td>
						</tr>
						<%-- <c:set var="bookId" value="0"></c:set> --%>
						<c:forEach items="${books}" var="b" varStatus="v">
							<tr>
								<td width="40px">
								<c:if test="${b.state==0}"><input type="checkbox" name="bookId" value="${b.bookId}"/></c:if>
								<c:if test="${b.state==1}"></c:if>
								</td>
								<td>${v.index+1}</td>
								<td><a><img src="${b.bookInfo.imgurl}" alt="暂无图片"
										height="150px" width="98px" /> </a></td>
								<td>${b.bookName}</td>
								<td>${b.bookInfo.author}</td>
								<td>${b.bookInfo.category }</td>
								<td>${b.bookInfo.bookPub }</td>
								<%-- <td width="50">${b.bookInfo.pubDate}</td> --%>
								<td width="50"><fmt:formatDate value="${b.bookInfo.pubDate}" pattern="yyyy/MM/dd" /></td>
								<td>
									<c:if test="${b.state==0}">未借出</c:if>
									<c:if test="${b.state==1}">已借出</c:if>
								</td>
								<td width="50"><fmt:formatDate value="${b.bookInfo.borrowDate }" pattern="yyyy/MM/dd" /></td>
								<td width="50"><fmt:formatDate value="${b.bookInfo.returnDate }" pattern="yyyy/MM/dd" /></td>
							</tr>
						<%-- <c:set var="bookId" value="${b.bookId}"></c:set> --%>
						</c:forEach>
					
					</table>
					 <a class="checkout1" href="#" onclick="formSubmit('deleteMyBook.action','_self');this.blur();">&lt; 删除 &gt;</a> 
				<%-- 	<a href="/deleteMyBook.action?bookId=${bookId }" class="checkout1">&lt; 删除 &gt;</a>  --%>
					<a href="#" class="continue" onclick="window.history.back();">&lt; back</a> 
					<a href="${app }/lastTocart.action" class="checkout1">&lt; last</a> 
					<a href="${app }/nextTocart.action" class="checkout">next &gt;</a>
				</div>

				<div class="clear"></div>
			</div>
			<!--end of left content-->

			<div class="clear"></div>
		</div>
		<!--end of center content-->

		<%--           
       <div class="footer">
       	<div class="left_footer"><img src="${app}/staticfile/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>
        <div class="right_footer">
        <a href="#">home</a>
        <a href="#">about us</a>
        <a href="#">services</a>
        <a href="#">privacy policy</a>
        <a href="#">contact us</a>
       
        </div>
        
       
       </div> --%>


	</div>
</form>
</body>
<%@include file="_foot.jsp"%>
</html>