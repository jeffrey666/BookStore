<%@ page language="java" import="java.util.*" isELIgnored="false" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>书海网.</title>

<!-- Bootstrap -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.css"
	rel="stylesheet">

<link href="/staticfile/css/cover.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>



	<div class="site-wrapper">

		<div class="site-wrapper-inner">

			<div class="cover-container">

				<div class="masthead clearfix">
					<div class="inner">
						<h3 class="masthead-brand">书海</h3>
						<nav>
							<ul class="nav masthead-nav">
								<li class="active"><a href="#">主页</a></li>
								<c:choose>
									<c:when test="${sessionScope._CURRENT_USER == null}">
										<li><a href="/toregist" target="_top">注册</a></li>
										<li><a href="${app}/tologin" target="_top">登录</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="${app }/tocart.action" target="_top">我的图书</a></li>
										<li><a href="/user/userinfo.action" target="_top">您好：${_CURRENT_USER.username}</a></li>
										<li><a href="${app}/tologout" target="_top">&nbsp;&nbsp;注销</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>
				</div>

				<div class="inner cover">
					<h1 class="cover-heading">修改成功.</h1>
					<p class="lead">恭喜您，您的邮箱已经修改成功！</p>
					<p class="lead">
						<a href="/index" class="btn btn-lg btn-default">进入新世界</a>
					</p>
				</div>

				<div class="mastfoot">
					<div class="inner">
						<p>
							Copyright for <a href="#">JieShu</a>,
							by <a href="#">@Jieshu</a>.
						</p>
					</div>
				</div>

			</div>

		</div>

	</div>



	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://cdn.bootcss.com/jquery/1.9.1/jquery.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.js"></script>

</body>
</html>