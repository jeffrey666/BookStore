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
<link rel="stylesheet" type="text/css" href="${app}/staticfile/css/search.css" />
<script src="${app}/staticfile/js/jquery-1.6.2.js"></script>
<script type="text/javascript">
	$().ready(
			function() {
				//跳转到上一页
				$("#beforePage").click(
						function() {
							var pubDate = $("#pubDate").val();
							var href = $("#beforePage").attr("href")
									+ "&bookInfo.pubDate=" + pubDate;
							$("#beforePage").attr("href", href);
						});
				//跳转到下一页
				$("#afterPage").click(
						function() {
							var pubDate = $("#pubDate").val();
							var href = $("#afterPage").attr("href")
									+ "&bookInfo.pubDate=" + pubDate;
							$("#afterPage").attr("href", href);
						});
				//跳到指定页面
				$("#changePageNum").click(
						function() {
							var totalPages = $("#totalPageNum").val();
							var pageNum = $("#changeNum").val();
							var bookName = $("#bookName").val();
							var category = $("#category").val();
							var author = $("#author").val();
							var pubDate = $("#pubDate").val();
							if (!/^[1-9]\d*$/.test(pageNum)) {
								alert("请输入正确的页数");
								return;
							}
							if (pageNum > totalPages) {
								alert("请输入正确的页数");
								return;
							}
							$("#changePageNum").attr(
									"href",
									"${app}/search/search?currentPage="
											+ pageNum + "&bookName=" + bookName
											+ "&bookInfo.category=" + category
											+ "&bookInfo.author=" + author
											+ "&bookInfo.pubDate=" + pubDate);
						});
			});
</script>
</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">

		<%--  <div class="header">
       		<div class="logo"><a href="index.html"><img src="${app}/staticfile/images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li><a href="index.html">home</a></li>
            <li><a href="about.html">about us</a></li>
            <li><a href="category.html">books</a></li>
            <li><a href="specials.html">specials books</a></li>
            <li><a href="myaccount.html">my accout</a></li>
            <li class="selected"><a href="register.html">register</a></li>
            <li><a href="details.html">prices</a></li>
            <li><a href="contact.html">contact</a></li>
            </ul>
        </div>     
            
            
       </div>  --%>


		<div class="center_content">
			<div class="left_content">

				<!-- 搜索行表单 -->
				<div id="content">

					<form method="post" action="/search/search">
						<div id="search_div">
							<span class="input_span">书名：<input id="bookName"
								type="text" name="bookName" value="${book.bookName }" /></span> <span
								class="input_span">书籍种类： <select id="category"
								name="bookInfo.category">
									<option>无选择</option>
									<option value="文学类"
										<c:if test="${book.bookInfo.category eq '文学类'}">selected="selected"</c:if>>文学类</option>
									<option value="小说类"
										<c:if test="${book.bookInfo.category eq '小说类'}">selected="selected"</c:if>>小说类</option>
									<option value="IT类"
										<c:if test="${book.bookInfo.category eq 'IT类'}">selected="selected"</c:if>>IT类</option>
									<option value="艺术与摄影类"
										<c:if test="${book.bookInfo.category eq '艺术与摄影类'}">selected="selected"</c:if>>艺术与摄影类</option>
									<option value="军事类"
										<c:if test="${book.bookInfo.category eq '军事类' }">selected="selected"</c:if>>军事类</option>
									<option value="辅导教材类"
										<c:if test="${book.bookInfo.category eq '辅导教材类' }">selected="selected"</c:if>>辅导教材类</option>
									<option value="历史类"
										<c:if test="${book.bookInfo.category eq '历史类' }">selected="selected"</c:if>>历史类</option>
							</select>
							</span>
						</div>
						<div id="search_div2">
							<span class="input_span">作者：<input id="author" type="text"
								name="bookInfo.author" value="${book.bookInfo.author }" /></span>
						</div>
						<div id="search_div3">
							<span class="input_span">书籍出版日期年限：<input id="pubDate"
								type="date" name="bookInfo.pubDate"
								value='<fmt:formatDate value="${book.bookInfo.pubDate }" pattern="yyyy-MM-dd"/>' /></span>
							<span class="input_span"><input type="submit" value="查询"></span>
						</div>
					</form>
				</div>
				<div class="new_products">

					<c:forEach items="${books}" var="b">
						<div class="new_prod_box">
							<a href="/details?bookId=${b.bookId}"><font color="blue">${b.bookName}</font></a>
							<div class="new_prod_bg">
								<a href="/details?bookId=${b.bookId}"><img
									src="${b.bookInfo.imgurl}" width="70px" height="90px"
									alt="图片暂无" title="" class="thumb" border="0" /></a>
							</div>
						</div>
					</c:forEach>
					<c:forEach items="${pageBeans.items}" var="b">
						<div class="new_prod_box">
							<a href="/details?bookId=${b.bookId}"><font color="blue">${b.bookName}</font></a>
							<div class="new_prod_bg">
								<a href="/details?bookId=${b.bookId}"><img
									src="${b.bookInfo.imgurl}" width="70px" height="90px"
									alt="图片暂无" title="" class="thumb" border="0" /></a>
							</div>
						</div>
					</c:forEach>

					<div class="pagination">
						<c:if test="${pageBeans!=null }">
							<span>共${pageBeans.totalPage }页搜索结果 </span>
							<span class="disabled"> <c:if
									test="${pageBeans.currentPage==1}">
									<a href="#">上一页</a>
								</c:if>
							</span>
							<c:if test="${pageBeans.currentPage>1}">
								<a id="beforePage"
									href="${app}/search/search?currentPage=${pageBeans.currentPage-1}&bookName=${book.bookName }&bookInfo.category=${book.bookInfo.category}&bookInfo.author=${book.bookInfo.author }">上一页</a>
							</c:if>
							<input id="totalPageNum" value="${pageBeans.totalPage }"
								type="hidden" />
							<c:if test="${pageBeans.isMore==1}">
								<a id="afterPage"
									href="${app}/search/search?currentPage=${pageBeans.currentPage+1}&bookName=${book.bookName }&bookInfo.category=${book.bookInfo.category}&bookInfo.author=${book.bookInfo.author }">下一页</a>
							</c:if>
							<c:if test="${pageBeans.isMore==0}">
								<a href="#">上一页</a>
							</c:if>
							<div>
								<br /> 转到第 <input id="changeNum" type="text" name="currentPage"
									value="${pageBeans.currentPage}" />页<a id="changePageNum"
									href="">GO</a>
							</div>
						</c:if>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<!--end of left content-->

			<div class="right_content">

				<div class="cart">
					<div id="view_cart">
						<span><a href="/search/toborrow"
							style="text-align: center; font-family: 微软雅黑; font-size: 22px">我的借阅</a></span>
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
</html>