<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="lite/images/favicon.png">
<!-- Bootstrap Core CSS -->
<link href="lite/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- chartist CSS -->
<link href="lite/plugins/chartist-js/dist/chartist.min.css"
	rel="stylesheet">
<link href="lite/plugins/chartist-js/dist/chartist-init.css"
	rel="stylesheet">
<link
	href="lite/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css"
	rel="stylesheet">
<!--This page css - Morris CSS -->
<link href="lite/plugins/c3-master/c3.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="lite/css/style.css" rel="stylesheet">
<!-- You can change the theme colors from here -->
<link href="lite/css/colors/blue.css" id="theme" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<style>
#dialog-link {
	padding: .4em 1em .4em 20px;
	text-decoration: none;
	position: relative;
}

#dialog-link span.ui-icon {
	margin: 0 5px 0 0;
	position: absolute;
	left: .2em;
	top: 50%;
	margin-top: -8px;
}

#icons {
	margin: 0;
	padding: 0;
}

#icons li {
	margin: 2px;
	position: relative;
	padding: 4px 0;
	cursor: pointer;
	float: left;
	list-style: none;
}

#icons span.ui-icon {
	float: left;
	margin: 0 4px;
}

.fakewindowcontain .ui-widget-overlay {
	position: absolute;
}

select {
	width: 200px;
}
</style>
<aside class="left-sidebar">
	<!-- Sidebar scroll-->
	<div class="scroll-sidebar">
		<!-- Sidebar navigation-->
		<br>
	
		<nav class="sidebar-nav">
			<ul id="sidebarnav">
				<li class="active"><a class="waves-effect waves-dark"
					href="employee/home" aria-expanded="false"><i
						class="mdi mdi-gauge"></i><span class="hide-menu"><s:message
								code="employee.menu.home" /></span></a></li>
				<li class="active"><a class="waves-effect waves-dark"
					href="employee/customer" aria-expanded="false"><i
						class="mdi mdi-account-check"></i><span class="hide-menu"><s:message
								code="employee.menu.customer" /></span></a></li>
				<li class="active"><a class="waves-effect waves-dark"
					href="employee/category" aria-expanded="false"><i
						class="mdi mdi-table"></i><span class="hide-menu"><s:message
								code="employee.menu.category" /></span></a></li>
				<li class="active"><a class="waves-effect waves-dark"
					href="employee/producer" aria-expanded="false"><i
						class="mdi mdi-emoticon"></i><span class="hide-menu"><s:message
								code="employee.menu.producer" /></span></a></li>
				<li class="active"><a class="waves-effect waves-dark"
					href="employee/product" aria-expanded="false"><i
						class="mdi mdi-earth"></i><span class="hide-menu"><s:message
								code="employee.menu.product" /></span></a></li>
				<li class="active"><a class="waves-effect waves-dark"
					href="employee/order" aria-expanded="false"><i
						class="mdi mdi-book-open-variant"></i><span class="hide-menu"><s:message
								code="employee.menu.order" /></span></a></li>
				<li class="active"><a class="waves-effect waves-dark"
					href="employee/inventory" aria-expanded="false"><i
						class="mdi mdi-barcode-scan"></i><span class="hide-menu"><s:message
								code="employee.menu.inventory" /></span></a></li>
				<%-- <li class="active"><a class="waves-effect waves-dark"
					href="employee/revenue" aria-expanded="false"><i
						class="mdi mdi-help-circle"></i><span class="hide-menu"><s:message
								code="employee.menu.revenue" /></span></a></li> --%>
			</ul>
			<div class="text-center m-t-30">
				<a href="#"
					class="btn waves-effect wa	ves-light btn-warning hidden-md-down">
					<s:message code="employee.menu.role" />
				</a>
			</div>
		</nav>
		<!-- End Sidebar navigation -->
	</div>
	<!-- End Sidebar scroll-->
	<!-- Bottom points-->

	<!-- Bottom points-->
	<div class="sidebar-footer">
		<!-- item-->
		<a href="" class="link" data-toggle="tooltip"
			title="<s:message code="employee.menu.account"/>"> <i
			class="ti-settings"></i></a>
		<!-- item-->
		<a href="" class="link" data-toggle="tooltip"
			title="<s:message code="employee.menu.email"/>"><i
			class="mdi mdi-gmail"></i></a>
		<!-- item-->
		<a href="employee/logout" class="link" data-toggle="tooltip"
			title="<s:message code="employee.menu.logout"/>"
			onclick="return confirm('Bạn chắc chắn muốn đăng xuất ?')"><i
			class="mdi mdi-power"></i></a>
	</div>
	<!-- End Bottom points-->
</aside>


<script src="lite/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="lite/plugins/bootstrap/js/tether.min.js"></script>
<script src="lite/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="lite/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="lite/js/waves.js"></script>
<!--Menu sidebar -->
<script src="lite/js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="lite/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<!--Custom JavaScript -->
<script src="lite/js/custom.min.js"></script>
<!-- ============================================================== -->
<!-- This page plugins -->
<!-- ============================================================== -->
<!-- chartist chart -->
<script src="lite/plugins/chartist-js/dist/chartist.min.js"></script>
<script
	src="lite/plugins/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
<!--c3 JavaScript -->
<script src="lite/plugins/d3/d3.min.js"></script>
<script src="lite/plugins/c3-master/c3.min.js"></script>
<!-- Chart JS -->
<script src="lite/js/dashboard1.js"></script>

<script>
	$(function() {
		$("a[data-lang]").click(function() {
			var lang = $(this).attr("data-lang");
			$.get("employee/home?lang=" + lang, function() {
				location.reload();
			});
			return false;
		});
	});
</script>
<script src="assets/jquery-ui/jquery.min.js"></script>
<script src="assets/js/jquery.min.js"></script>
<link href="assets/jquery-ui/jquery-ui.min.css" rel="stylesheet" />
<script src="assets/jquery-ui/jquery-ui.min.js"></script>
<script src="assets/jquery-ui/external/jquery/jquery.js"></script>
<script src="assets/jquery-ui/jquery-ui.js"></script>
<link href="assets/jquery-ui/jquery-ui.css" rel="stylesheet">
<script>
	$(function() {
		$(".datepicker").datepicker({
			dateFormat : 'mm/dd/yy'
		});
		$("input#datepicker").datepicker({
			dateFormat : 'dd/mm/yy'
		});
		$("#tabs").tabs();
		// Link to open the dialog
		$("#dialog-link").click(function(event) {
			$("#dialog").dialog("open");
			event.preventDefault();
		});
		$("#dialog").dialog({
			autoOpen : false,
			width : 400,
			buttons : [ {
				text : "Ok",
				click : function() {
					$(this).dialog("close");
				}
			}, {
				text : "Cancel",
				click : function() {
					$(this).dialog("close");
				}
			} ]
		});
		$("#dialog-link, #icons li").hover(function() {
			$(this).addClass("ui-state-hover");
		}, function() {
			$(this).removeClass("ui-state-hover");
		});
	});
</script>
<script src="themes/js/jquery.validate.min.js"></script>