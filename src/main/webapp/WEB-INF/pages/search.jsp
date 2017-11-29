<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="app" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="${app}/staticfile/css/style.css" />
<script src="${app}/staticfile/js/jquery-1.6.2.js"></script>
<script type="text/javascript">
	$().ready(function(){
		//跳到指定页面
		$("#changePageNum").click(function(){
			var totalPages = $("#totalPageNum").val();
			var pageNum = $("#changeNum").val();
			if(!/^[1-9]\d*$/.test(pageNum)){
				alert("请输入正确的页数");
				return;
			}
			if(pageNum>totalPages){
				alert("请输入正确的页数");
				return;
			}
			$("#changePageNum").attr("href","${app}/search/search?&currentPage="+pageNum);
		});	
	});
</script>
</head>
<%@include file="_head.jsp" %>
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
				<span class="input_span">书名：<input type="text" name="bookName" value="${book.bookName }"/></span>
				<span class="input_span">书籍种类：
				<select name="bookInfo.category"  >
					<option >无选择</option>
					<option value="文学类" <c:if test="${book.bookInfo.category eq '文学类'}">selected="selected"</c:if> >文学类</option>
					<option value="小说类" <c:if test="${book.bookInfo.category eq '小说类'}">selected="selected"</c:if> >小说类</option>
					<option value="IT类" <c:if test="${book.bookInfo.category eq 'IT类'}">selected="selected"</c:if> >IT类</option>
					<option value="艺术与摄影类" <c:if test="${book.bookInfo.category eq '艺术与摄影类'}">selected="selected"</c:if> >艺术与摄影类</option>
					<option value="军事类" <c:if test="${book.bookInfo.category eq '军事类' }">selected="selected"</c:if> >军事类</option>
					<option value="辅导教材类" <c:if test="${book.bookInfo.category eq '辅导教材类' }">selected="selected"</c:if> >辅导教材类</option>
					<option value="历史类" <c:if test="${book.bookInfo.category eq '历史类' }">selected="selected"</c:if> >历史类</option>
				</select>
				</span>
				</div>
				<div id="search_div2">
				<span class="input_span">作者：<input type="text" name="bookInfo.author" value="${book.bookInfo.author }"/></span>
				</div>
				<div id="search_div3">
				<span class="input_span">书籍出版日期年限：<input type="date" name="bookInfo.pubDate" value='<fmt:formatDate value="${book.bookInfo.pubDate }" pattern="yyyy-MM-dd"/>'/></span>
				<span class="input_span"><input type="submit" value="查询"></span>
				</div>
			</form>
		    
            </div>
            
          
           <div class="new_products">

               <c:forEach items="${books}" var="b">
                    <div class="new_prod_box">
                        <a href="/details?bookId=${b.bookId}"><font color="blue" >${b.bookName}</font></a>
                        <div class="new_prod_bg">
                        <a href="/details?bookId=${b.bookId}"><img src="${b.bookInfo.imgurl}" width="70px" height="90px" alt="图片暂无" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
               </c:forEach>
               <c:forEach items="${pageBean.items}" var="b">
                    <div class="new_prod_box">
                        <a href="/details?bookId=${b.bookId}"><font color="blue" >${b.bookName}</font></a>
                        <div class="new_prod_bg">
                        <a href="/details?bookId=${b.bookId}"><img src="${b.bookInfo.imgurl}" width="70px" height="90px" alt="图片暂无" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
               </c:forEach>
 
                     

            <div class="pagination">
            <c:if test="${pageBean!=null }">
            <span class="disabled">
            	<c:if test="${pageBean.currentPage==1}"><a href="#"><<</a></c:if>
            </span>
            
            	<c:if test="${pageBean.currentPage>1}"><a href="${app}/search/search?currentPage=${pageBean.currentPage-1}"><<</a></c:if>
            	<input id="totalPageNum" value="${pageBean.totalPage }" type="hidden"  />
            	<c:forEach begin="1" end="${pageBean.totalPage }" step="1" var="pageNum">
            		<a	href="${app}/search/search?currentPage=${pageNum}">${pageNum }</a>
            	</c:forEach>
            	<c:if test="${pageBean.isMore==1}"><a href="${app}/search/search?currentPage=${pageBean.currentPage+1}">>></a> </c:if>

            <span >
				转到第 <input id="changeNum" type="text" name="currentPage"
				value="${pageBean.currentPage}" />页<a id="changePageNum" href="">GO</a>
		    </span>

            
            </c:if>
            </div>    
            
            </div> 
          
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
        <div class="right_content">
        	<div class="languages_box">
            <span class="red">Languages:</span>
            <a href="#"><img src="${app}/staticfile/images/gb.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="${app}/staticfile/images/fr.gif" alt="" title="" border="0" /></a>
            <a href="#"><img src="${app}/staticfile/images/de.gif" alt="" title="" border="0" /></a>
            </div>
                <div class="currency">
                <span class="red">Currency: </span>
                <a href="#">GBP</a>
                <a href="#">EUR</a>
                <a href="#"><strong>USD</strong></a>
                </div>
                
                
              <div class="cart">
                  <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/cart.gif" alt="" title="" /></span>My cart</div>
                  <div class="home_cart_content">
                  3 x items | <span class="red">TOTAL: 100$</span>
                  </div>
                  <a href="cart.html" class="view_cart">view cart</a>
              
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
       </div><!--end of center content-->
       
       <%--        
       <div class="footer">
       	<div class="left_footer"><img src="${app}/staticfile/images/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>
        <div class="right_footer">
        <a href="#">home</a>
        <a href="#">about us</a>
        <a href="#">services</a>
        <a href="#">privacy policy</a>
        <a href="#">contact us</a>
       
        </div>
        
       
       </div> --%>
    

</div>

</body>
<%@include file="_foot.jsp" %>
</html>