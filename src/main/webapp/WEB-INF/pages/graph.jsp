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
          	//次数+1
          index++;
          	/* 将当前class名改为show */
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
      <li name="pic" class="show" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#0e0e0e "><img src="${app }/upload/22.jpg"  >书，是百花园，将我带入梦一般的天堂，书，是翅膀，带着我遨游神奇的天空，书，是飞奔的马，载着我在辽阔的大草原上自由飞翔，书，是生命之源，滋润着我那枯干的心灵。</a>
      </li>
      <li  name="pic" class="hide" >
        <a style="font-family: 楷体 ; font-size: 15px;color:#0e0e0e "><img src="${app }/upload/11.jpg" >当你困惑时，书给你启迪当你迷惘时，书给你指路。当你落寞时，书给你勇气。当你悲伤时，书给你欢愉。当你狂躁时，书给你冷静。当你成功时，书给你导航。</a>
      </li>
      
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#0e0e0e "><img src="${app }/upload/33.jpg"  >书是船只——凯勒说：“一本新书像一艘船，带领着我们从狭隘的地方，驶向生活的无限广阔的海洋。”</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#0e0e0e "><img src="${app }/upload/44.jpg"  >书是奇迹——高尔基说：“书，要算要类在走向未来幸福富强的道路上所创造的一切奇迹中最复杂最伟大的奇迹。”</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#0e0e0e "><img src="${app }/upload/55.jpg"  >一个爱书的人，他必定不致于缺少一个忠实的朋友，一个良好的老师，一个可爱的伴侣，一个温情的安慰者——巴罗</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#0e0e0e "><img src="${app }/upload/66.jpg"  >书籍是培育我们的良师，无需鞭答和根打，不用言语和训斥，不收学费，也不拘形式;......对图书倾注的爱，就是对才智的爱——德伯里</a>
      </li>
      <li name="pic" class="hide" >
        <a style="font-family: 楷体 ;font-size: 15px;color:#0e0e0e "><img src="${app }/upload/77.jpg"  >书是随时在近旁的顾问，随时都可以供给你所需要的知   识，而且可以按照你的心愿，重复这个顾问的次数———凯勒 </a>
      </li>
    </ul>
  </body> 
</html>