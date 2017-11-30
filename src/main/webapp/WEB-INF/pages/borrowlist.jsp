<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>

<head>
<title>借阅书籍榜单</title>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="${app}/staticfile/css/borrowlist.css" />
<script src="${app}/staticfile/js/jquery-1.6.2.js"></script>
<script type="text/javascript">
	$().ready(
			function() {
				//跳转到下一页
				$("#nextPage").click(
						function() {
							var pageSize = $("#oldNum").val();
							var href = $("#nextPage").attr("href")
									+ "&pageSize=" + pageSize;
							$("#nextPage").attr("href", href);
						});
				//跳转到上一页
				$("#beforePage").click(
						function() {
							var pageSize = $("#oldNum").val();
							var href = $("#beforePage").attr("href")
									+ "&pageSize=" + pageSize;
							//alert(href);
							$("#beforePage").attr("href", href);
						});

				//跳到指定页面
				$("#changePageNum").click(
						function() {
							var pageSize = $("#view").val();
							var maxSize = $("#changeNum").parent().parent()
									.find("span").attr("id");
							var pageNum = $("#changeNum").val();
							//alert("每页记录数："+pageSize);
							//alert("最大记录数"+maxSize);
							//alert("跳到第几页："+pageNum);
							if (!/^[1-9]\d*$/.test(pageSize)) {
								alert("请输入正确的记录数");
								return;
							}
							if (pageSize > 10) {
								alert("每页显示记录数请不要超过10条");
								return;
							}
							if (!/^[1-9]\d*$/.test(pageNum)) {
								alert("请输入正确的页数");
								return;
							}
							if (maxSize % pageSize == 0) {
								if (pageSize * pageNum > maxSize) {
									alert("请输入正确的记录数或页数");
									return;
								}
							} else {
								if (pageSize * (pageNum - 1) > maxSize) {
									alert("请输入正确的记录数或页数");
									return;
								}
							}
							$("#changePageNum").attr(
									"href",
									"${app}/findlist?pageSize=" + pageSize
											+ "&currentPage=" + pageNum);
						});
			});
</script>


</head>
<%@include file="_head.jsp"%>
<body>
	<div id="wrap">
		<div class="center_content">
			<div class="left_content">

				<h1 id="tt">
					借阅书籍榜单 <a href="${app }/list.action">榜单下载</a>
				</h1>
				<table border="1" align="center" cellspacing="0" cellpadding="5px">
					<tr bgcolor="gray">
						<th class="ths">序号</th>
						<th class="ths">书籍图片</th>
						<th class="ths">书籍名称</th>
						<th class="ths">书籍作者</th>
						<th class="ths">书籍状态</th>
						<th class="ths">书籍借阅次数</th>
					</tr>
					<%-- <div>
		<img width="120px" height="120px" src="${app}/upload/4/2/e/b/2/9/b/6/QQ图片20171017184426.jpg" alt="图片暂无" >
		</div> --%>
					<!-- 模版数据 -->
					<%-- 通过jstl+el获取所有书籍组成的list集合, 遍历显示 --%>
					<c:set var="index" value="1" />
					<c:forEach items="${pageBean.items}" var="book">
						<tr>
							<td align="center">${(pageBean.currentPage-1)*pageBean.pageSize+index}</td>
							<c:set var="index" value="${index+1}" />
							<td><img width="120px" height="120px"
								src="${app}${book.bookInfo.imgurl}"
								alt="${app}${book.bookInfo.imgurl}"></td>
							<td align="center">${book.bookName}</td>
							<td align="center">${book.bookInfo.author}</td>
							<td align="center"><c:if test="${book.state==0}">未借</c:if> <c:if
									test="${book.state==1}">已借</c:if></td>
							<td align="center">${book.bookInfo.borrowCount}</td>


						</tr>
					</c:forEach>
				</table>
				<div align="center">
					<input id="oldNum" value="${pageBean.pageSize }" type="hidden" />
					<span id="${pageBean.totalNum }">共${pageBean.totalNum }条记录，
						每页显示 <input id="view" type="text" name="page.pageSize"
						value="${pageBean.pageSize }" size="1">条记录，
					</span> <br /> <span>当前第${pageBean.currentPage }</span> 页 <a
						href="${app}/findlist?currentPage=1">首页</a> <span>共${pageBean.totalPage }页，</span>
					<c:if test="${pageBean.currentPage==1}">
						<a href="#">上一页</a>
					</c:if>
					<c:if test="${pageBean.currentPage>1}">
						<a id="nextPage"
							href="${app}/findlist?currentPage=${pageBean.currentPage-1}">上一页</a>
					</c:if>
					<c:if test="${pageBean.isMore==1}">
						<a id="beforePage"
							href="${app}/findlist?currentPage=${pageBean.currentPage+1}">下一页</a>
					</c:if>
					<c:if test="${pageBean.isMore==0 }">
						<a href="#">下一页</a>
					</c:if>
					<span> 转到第 <input id="changeNum" type="text"
						name="currentPage" value="${pageBean.currentPage}" size="1" />页<a
						id="changePageNum" href="">GO</a>
					</span>
				</div>

			</div>
			<!--end of left content-->
			<div class="right_content">
              <div class="cart">

				<div id="view_cart">
					<span><a href="/search/toborrow" style="text-align:center;font-family:微软雅黑;font-size:22px">我的借阅</a></span>
				</div>
			</div>

                       
            	
        
        
             <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet3.gif" alt="" title="" /></span>About Our Store</div> 
             <div class="about">
             <p>
             <img src="${app}/staticfile/images/about.gif" alt="" title="" class="right" />
             Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
             </p>
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet4.gif" alt="" title="" /></span>Promotions</div> 
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                    
                    
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <span class="new_icon"><img src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>              
             
             </div>
             
             <div class="right_box">
             
             	<div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet5.gif" alt="" title="" /></span>Categories</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>                                              
                </ul>
                
             	<div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet6.gif" alt="" title="" /></span>Partners</div> 
                
                <ul class="list">
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>
                <li><a href="#">books gifts</a></li>
                <li><a href="#">specials</a></li>
                <li><a href="#">hollidays gifts</a></li>
                <li><a href="#">accesories</a></li>                              
                </ul>      
             
             </div>         
             
        
        </div><!--end of right content-->
			<div class="clear"></div>
		</div>
		<!--end of center content-->



	</div>
</body>
<%@include file="_foot.jsp"%>
</html>




