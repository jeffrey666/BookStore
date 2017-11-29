<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title></title>
    <meta charset="utf-8" />
    <style type="text/css">
      .photo {
        list-style-type: none;
        border: 2px solid #ccc;
        width: 337px;
        height: 620px;
        margin:0;
        padding:0;
      }
      .photo li {
        width: 337px;
        height: 560px;
        margin: 0;
        padding: 0;
      }
      .show{
        display: block;
      }
      .hide{
        display: none;
      }
	.smoll ul li img{ height:620px; width:337px;}
    </style>
    <script type="text/javascript">
      var timer;
      var index = 0;
      function start() {
        timer = setInterval(function(){
        	/* 获取节点 */
          var ul = document.getElementById("photo");
          	/* 获取子节点 */
          var lis = ul.getElementsByTagName("li");
          	/* 遍历所有子节点将所有设置为隐藏 */
          for(var i=0;i<lis.length;i++) {
            lis[i].className = "hide";
          }
          index++;
          lis[index%lis.length].className = "show";
        }, 5000);
      }
      function stop() {
        clearInterval(timer);
      }
	 
    </script>
  </head>
  <body onload="start();">
  <div class="smoll"> 
    <ul class="photo" id="photo"
      onmouseover="stop();" onmouseout="start();">
     <%--  <li class="show"  >
        <a><img  name="pic" src="${app }/upload/00.jpg" >书籍是人类进步的阶梯。——高尔基
      </li> --%>
      <li  name="pic" class="show" >
        <a style="font-family: 楷体 ; font-size: 15px;color:#FF9900 "><img src="${app }/upload/11.jpg" >阅读使人充实；会谈使人敏捷；写作与笔记使人精确。史鉴使人明智；诗歌使人巧慧；数学使人精细；博物使人深沉；伦理使人庄重；逻辑与修辞使人善辩。——培根</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#FF9900 "><img src="${app }/upload/22.jpg"  >书读的越多而不假思索，你就会觉得你知道得很多；但当你读书而思考越多的时候，你就会清楚地看到你知道得很少。——伏尔泰</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#FF9900 "><img src="${app }/upload/33.jpg"  >读万卷书，行万里路。——刘彝</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#FF9900 "><img src="${app }/upload/44.jpg"  >生活里没有书籍，就好像没有阳光；智慧里没有书籍，就好像鸟儿没有翅膀。——莎士比亚</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#FF9900 "><img src="${app }/upload/55.jpg"  >生活在我们这个世界里，不读书就完全不可能了解人。——高尔基</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#FF9900 "><img src="${app }/upload/66.jpg"  >不读书的人，思想就会停止。狄德罗</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#FF9900 "><img src="${app }/upload/77.jpg"  >莫等闲，白了少年头，空悲切！岳飞</a>
      </li>
    </ul>
  </body> 
</html>