<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!doctype html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="apple-touch-icon" sizes="76x76"
	href="login/images/apple-icon.png">
<link rel="icon" type="login/image/png" sizes="96x96"
	href="login/images/favicon.png">

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />
<script src="assets/js/jquery-3.1.1.min.js"></script>
<title><s:message code="admin.login.text" /></title>

<link href="login/css/bootstrap.css" rel="stylesheet" />
<link href="login/css/coming-sssoon.css" rel="stylesheet" />

<!--     Fonts     -->
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.css"
	rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Grand+Hotel'
	rel='stylesheet' type='text/css'>

</head>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
<body>
	<nav class="navbar navbar-transparent navbar-fixed-top"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <img src="login/images/flags/ZZ.png" />
							<s:message code="admin.login.language" /> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="?lang=vi" data-lang="vi"><img
									src="login/images/flags/VN.png" />Tiếng Việt</a>
							<li class="divider"></li>
							<li><a href="?lang=en" data-lang="en"><img
									src="login/images/flags/US.png" /> English</a></li>
						</ul></li>

				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"> <i class="fa fa-facebook-square"></i>
							Facebook
					</a></li>
					<li><a href="#"> <i class="fa fa-google-plus-square"></i>
							Plus
					</a></li>
					<li><a href="#"> <i class="fa fa-pinterest"></i> Pin
					</a></li>
				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<div class="main"
		style="background-image: url('login/images/video_bg.jpg')">
		<video id="video_background" preload="auto" autoplay="true"
			loop="loop" muted="muted" volume="0">
			<source src="login/video/time.webm" type="video/webm">
			<source src="login/video/time.mp4" type="video/mp4">
			Video not supported
		</video>
		<!--    Change the image source '/images/video_bg.jpg')" with your favourite image.     -->

		<div class="cover black" data-color="black"></div>

		<!--   You can change the black color for the filter with those colors: blue, green, red, orange       -->

		<div class="container">
			<h1 class="logo cursive">Hieu Boy Shop</h1>
			<!--  H1 can have 2 designs: "logo" and "logo cursive"           -->

			<div class="content">
				<h4 class="motto">
					<s:message code="admin.login.title" />
				</h4>
				<div class="subscribe">
					<h5 class="info-text">
						<s:message code="admin.login.forgot" />
						<span style="color: red">${message}</span>
					</h5>
					<div class="row">
						<div class="col-md-4 col-md-offset-4 col-sm6-6 col-sm-offset-3 ">
							<form:form class="form-inline" action="admin/forgot.htm"
								modelAttribute="account">
								<div class="form-group">
									<label class="sr-only" for="username">Full Name</label>
									<form:input path="fullName"
										placeholder="Please enter name"
										class="form-control transparent" />
								</div>
								<form:errors path="username" />
								<span style="color: red">${message1}</span>
								<br>
								<br>
								<div class="form-group">
									<label class="sr-only" for="email">Email Address</label>
									<form:input path="username" type="email"
										placeholder="Please enter an email address"
										class="form-control transparent" />
								</div>
								<form:errors path="username" />

								<span style="color: red">${message2}</span>

								<br>
								<br>
								<div class="form-group">
									<a href="admin" type="submit"
										class="btn btn-success btn-fill"> <s:message
											code="admin.login" /></a>
									<button type="submit" class="btn btn-danger btn-fill">
										<s:message code="admin.getPass" />
									</button>

								</div>


							</form:form>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="container">
				<s:message code="admin.login.made" />
				<i class="fa fa-heart heart"></i>
				<s:message code="admin.login.by" />
				<a href="http://www.fakebook.com/HieuBoyFC">Hiếu Boy</a>.
				<s:message code="admin.login.contact" />
				<a href="http://www.fakebook.com/HieuDTPH04388"><s:message
						code="admin.login.here" /></a>
			</div>
		</div>
	</div>
</body>
<script src="login/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="login/js/bootstrap.min.js" type="text/javascript"></script>


<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var lang = $(this).attr("data-lang");
			$.get("admin/login?lang=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>
</html>
