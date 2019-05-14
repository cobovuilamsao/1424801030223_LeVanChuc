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
<title><s:message code="employee.customer.edit" /></title>
</head>
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
							<s:message code="employee.menu.account" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.account.editPass" /></li>
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
									<s:message code="employee.account.editPass" />
								</h4>
								<form:form
									action="employee/change-pass/${employee.id}.htm"
									method="POST" commandName="employee">
									<form:hidden path="id" />
									<form:hidden path="nameEmployee" />
									<form:hidden path="gender" />
									<form:hidden path="address" />
									<form:hidden path="numberPhone" />
									<form:hidden path="birthday" />
									<form:hidden path="access" />
									<form:hidden path="activated" />
									<div class="row">
										<div class="col-md-2">
											<label><s:message code="employee.account.oldPass" />: </label>
											<form:input path="password"
												class="form-control form-control-line" readonly="true" />
										</div>
										<div class="col-md-5">
											<label><s:message code="employee.account.newPass" />: (<span
												style="color: red;">*</span>)<form:errors path="password" /></label>
											<input id="password" type="password" name="password1"
												placeholder="Nhập mật khẩu mới" size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-5">
											<label><s:message code="employee.account.confirmPass" />:
												(<span style="color: red;">*</span>)<form:errors
													path="password" /></label> <input id="password" type="password"
												name="password2" placeholder="Nhập lại mật khẩu mới"
												size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-12">
											<div style="text-align: center;">
												<button class="btn btn-danger">
													<s:message code="employee.account.changePass" />
												</button>
											</div>
										</div>

									</div>
									<br>
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
</html>