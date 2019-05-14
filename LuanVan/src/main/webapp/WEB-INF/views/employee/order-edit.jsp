<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.order.edit" /></title>
</head>
<script src="themes/js/jquery-1.7.1.min.js"></script>
<script src="themes/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#detail").validate({
			rules : {
				receiver : {
					required : true
				},
				address : {
					required : true
				},
				requireDate : {
					required : true
				},
				numberPhone : {
					required : true
				}
			},
			messages : {
				receiver : {
					required : 'Vui lòng nhập tên người nhận !'
				},
				address : {
					required : 'Vui lòng nhập địa chỉ !'
				},
				requireDate : {
					required : 'Vui lòng nhập ngày nhận hàng !'
				},
				numberPhone : {
					required : 'Vui lòng số điện thoại !'
				}

			}
		});
	});
</script>
<style>
label.error {
	color: red;
	font-style: italic;
	padding-left: 33px;
	background: url("images/hieuboy2.gif") no-repeat left center;
}
</style>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
	padding-left: 33px;
	background: url("images/hieuboy2.gif") no-repeat left center;
}
</style>
<body>

	<div id="main-wrapper">
		<jsp:include page="header.jsp"></jsp:include>
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="page-wrapper">
			<!-- Container fluid  -->
			<div class="container-fluid">
				<!-- Bread crumb and right sidebar toggle -->
				<div class="row page-titles">
					<div class="col-md-5 col-8 align-self-center">
						<h3 class="text-themecolor m-b-0 m-t-0">
							<s:message code="employee.menu.order" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.order.edit" /></li>
						</ol>
					</div>
					<div class="col-md-7 col-4 align-self-center">
						<a href="http://facebook.com/HieuDTPH04388" target="blank"
							class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down">
							<s:message code="employee.menu.contact" />
						</a>
					</div>
				</div>
				<!-- End Bread crumb and right sidebar toggle -->
				<!-- Start Page Content -->
				<div class="row">
					<!-- column -->
					<div class="col-lg-12">
						<div class="card">
							<div class="card-block">
								<h4 class="card-title">
									<s:message code="employee.product.edit" />
								</h4>
								<form:form action="employee/order/edit-order/${order.id }.htm"
									method="POST" modelAttribute="order" role="form" id="detail">
									<div class="row">
										<div class="col-md-4">
											<label><s:message code="employee.order.receiver" />:
												(<span style="color: red;">*</span>)<form:errors
													path="receiver" /></label>
											<form:input path="receiver" id="receiver"
												placeholder="Tên người nhận" size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-4">
											<label><s:message code="employee.order.address" />:
												(<span style="color: red;">*</span>)<form:errors
													path="address" /></label>
											<form:input path="address" id="address" placeholder="Địa chỉ"
												size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
											<div class="col-md-4">
											<label><s:message code="employee.order.numberPhone" />:
												(<span style="color: red;">*</span>)<form:errors
													path="numberPhone" /></label>
											<form:input path="numberPhone" id="numberPhone" placeholder="Số điện thoại"
												size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6">
											<label><s:message code="employee.order.requireDate" />:
												(<span style="color: red;">*</span>)<form:errors
													path="requireDate" /></label>
											<form:input path="requireDate" id="requireDate"
												placeholder="dd/MM/yyyy" size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-6">
											<label><i class="fa fa-calendar bigger-110"> </i> <s:message
													code="employee.order.description" />: (<span
												style="color: red;">*</span>)<form:errors path="description" /></label>
											<form:input path="description" id="description"
												placeholder="Mô tả" size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>
									<br>
									<div style="text-align: center;">
										<button class="btn btn-danger">
											<s:message code="employee.order.edit" />
										</button>
									</div>
									<br>
									<form:hidden path="customer.id" />
									<form:hidden path="status" />
									<form:hidden path="amount" />
									<form:hidden path="id" />
									<form:hidden path="orderDate" />
								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- End PAge Content -->
			</div>
			<!-- End Container fluid  -->
			<!-- footer -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>

</body>
<script>
	$(function() {
		$(".requireDate").datepicker({
			dateFormat : 'dd/mm/yy'
		});
		$("input#requireDate").datepicker({
			dateFormat : 'dd/mm/yy'
		});

	});
</script>
</html>