<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="${app}/staticfile/css/style.css" />
<%@include file="_head.jsp" %>
</head>
<body>
<div id="wrap">

       <!-- <div class="header">
       		<div class="logo"><a href="index.html"><img src="${app}/staticfile/images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li><a href="index.html">home</a></li>
            <li><a href="about.html">about us</a></li>
            <li class="selected"><a href="category.html">books</a></li>
            <li><a href="specials.html">specials books</a></li>
            <li><a href="myaccount.html">my accout</a></li>
            <li><a href="register.html">register</a></li>
            <li><a href="details.html">prices</a></li>
            <li><a href="contact.html">contact</a></li>
            </ul>
        </div>     
            
            
       </div>  -->
       
       
       <div class="center_content">
       	<div class="left_content">
        	<div class="crumb_nav">
            <a href="index.html">home</a> &gt;&gt; category name
            </div>
            <div class="title"><span class="title_icon"><img src="${app}/staticfile/images/bullet1.gif" alt="" title="" /></span>Category books</div>
           
           <div class="new_products">
           
                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
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
                        <span class="new_icon"><img src="${app}/staticfile/images/promo_icon.gif" alt="" title="" /></span>
                        <a href="details.html"><img src="${app}/staticfile/images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>          


                    <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
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
                        
                        <a href="details.html"><img src="${app}/staticfile/images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
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
                        <a href="details.html"><img src="${app}/staticfile/images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>
                    
                     <div class="new_prod_box">
                        <a href="details.html">product name</a>
                        <div class="new_prod_bg">
                        <a href="details.html"><img src="${app}/staticfile/images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>

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
                        <a href="details.html"><img src="${app}/staticfile/images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                        </div>           
                    </div>                  
                    

            <div class="pagination">
            <span class="disabled"><<</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>?a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
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
                  <a href="/tocart" class="view_cart">view cart</a>
              
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
       
              
      <!--  <div class="footer">
       	<div class="left_footer"><img src="${app}/staticfile/images/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>
        <div class="right_footer">
        <a href="#">home</a>
        <a href="#">about us</a>
        <a href="#">services</a>
        <a href="#">privacy policy</a>
        <a href="#">contact us</a>
       
        </div>
        
       
       </div> -->
    

</div>

</body>
<%@include file="_foot.jsp" %>
</html>