<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>

<head>
<title>借阅书籍榜单</title>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet"
	href="${app}/staticfile/css/borrowlist.css" />
<script
	src="${app}/staticfile/js/jquery-1.6.2.js"></script>
<script type="text/javascript">
	$().ready(function(){
		
		$("#view").blur(function(){
			var pageSize = $("#view").val();
			//alert(pageSize);
			window.location.href="${ctx }/book.action?pageSize=" + pageSize;
		});
		
		$("#changePageNum").click(function(){
			var pageNum = $("#changeNum").val();
			//alert(pageNum);
			$("#changePageNum").attr("href","${ctx }/book.action?page=" + pageNum);
		});
	});
</script>
	

</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">
		<div class="center_content">
			<div class="left_content">
				

			<h1 id="tt">借阅书籍榜单</h1>
	<table border="1">
		<tr>
			<th class="ths">书籍图片</th>
			<th class="ths">书籍作者</th>
			<th class="ths">书籍状态</th>
			<th class="ths">书籍借阅次数</th>
		</tr>
		<%-- <div>
		<img width="120px" height="120px" src="${app}/upload/4/2/e/b/2/9/b/6/QQ图片20171017184426.jpg" alt="图片暂无" >
		</div> --%>
		<!-- 模版数据 -->
<%-- 通过jstl+el获取所有书籍组成的list集合, 遍历显示 --%>
	<c:forEach items="${bookList}" var="book">	
		<tr>
			<td>
				<img width="120px" height="120px" src="${app}${book.bookInfo.imgurl}" alt="图片暂无" > 
			</td>
			<td>${book.bookInfo.author}</td>
			<td>
			<c:if test="${book.state}==0">未借</c:if>
			<c:if test="${book.state}==1">已借</c:if>
			</td>
			<td>${book.bookInfo.borrowCount}</td>
			
			
		</tr>
		</c:forEach>
	</table>
	<div>
		<span>共${page.total }条记录，每页显示 <input id="view" type="text"
			name="page.pageSize" value="${page.pageSize }">
		</span> <span>当前第${page.pageNum }/${page.pages }</span> <a
			href="${ctx }/book.action?page=1">首页</a> <a
			href="${ctx }/book.action?page=${page.pageNum-1}">上一页</a> <a
			href="${ctx }/book.action?page=${page.pageNum+1}">下一页</a> <span>
			转到第 <input id="changeNum" type="text" name="page"
			value="${page.pageNum }" /> <a id="changePageNum" href="">GO</a>
		</span>
	</div>
					
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




