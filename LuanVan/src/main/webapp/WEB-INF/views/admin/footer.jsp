<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Admin Home</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<!-- Bootstrap core CSS     -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="assets/css/paper-dashboard.css" rel="stylesheet" />

<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="assets/css/demo.css" rel="stylesheet" />

<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link href="assets/css/themify-icons.css" rel="stylesheet">

</head>
<%-- <footer class="footer">
	<div class="container-fluid">
		<nav class="pull-left">
			<ul>
				<li><a href="#"> Hiếu Boy </a></li>
				<li><a href="#"> <s:message code="admin.footer.introduce" />
				</a></li>
				<li><a href="#"><s:message code="admin.footer.contact" /></a></li>
			</ul>
		</nav>
		<div class="copyright pull-right">
			© 2018 -
			<script>
				document.write(new Date().getFullYear())
			</script>
			,
			<s:message code="admin.footer.made" />
			<i class="fa fa-heart heart"></i> <a
				href="https://www.youtube.com/channel/UCnewztYSgscXkL1dn2g-QkQ?view_as=subscriber"
				target="blank">Hiếu Boy</a>
		</div>
	</div>

</footer> --%>

<!--   Core JS Files   -->
<script src="assets/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.min.js" type="text/javascript"></script>

<!--  Checkbox, Radio & Switch Plugins -->
<script src="assets/js/bootstrap-checkbox-radio.js"></script>

<!--  Charts Plugin -->
<script src="assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
<script src="assets/js/paper-dashboard.js"></script>

<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
<script src="assets/js/demo.js"></script>

<script src="assets/js/jquery-3.1.1.min.js"></script>

<script src="assets/jquery-ui/jquery.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<link href="assets/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<script src="assets/jquery-ui/jquery-ui.min.js"></script>
<script src="assets/external/jquery/jquery.js"></script>
<script src="assets/jquery-ui.js"></script>
<script>
	$(function() {
		$(".datepicker").datepicker({
			dateFormat : 'mm/dd/yy'
		});
		$("input#datepicker").datepicker({
			dateFormat : 'dd/mm/yy'
		});
		$("#tabs").tabs();
	});
</script>

<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var lang = $(this).attr("data-lang");
			$.get("admin/home?lang=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>
