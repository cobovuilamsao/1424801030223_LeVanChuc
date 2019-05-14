<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="assets/js/jquery-3.1.1.min.js"></script>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.category.edit" /></title>
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
							<s:message code="employee.menu.category" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.category.edit" /></li>
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
									<s:message code="employee.category.edit" />
								</h4>
								<form:form
									action="employee/category/edit-category/${category.id }.htm"
									method="POST" commandName="category">

									<form:hidden path="id" />

									<div class="form-group">
										<label class="col-md-6"> <s:message
												code="employee.category.name" />: (<span
											style="color: red;">*</span>)<form:errors path="nameCategory" /></label>
										<div class="col-md-6">
											<form:input path="nameCategory" placeholder="Tên danh mục Tiếng Việt"
												size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-6"><s:message
												code="employee.category.nameEN" />: (<span
											style="color: red;">*</span>)<form:errors
												path="nameCategoryEN" /></label>
										<div class="col-md-6">
											<form:input path="nameCategoryEN"
												placeholder="Tên danh mục Tiếng Anh" size="30"
												maxlength="30" class="form-control form-control-line" />
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-12">
											<button class="btn btn-primary">
												<s:message code="employee.category.edit" />
											</button>
										</div>
									</div>
								</form:form>

							</div>
						</div>
					</div>
				</div>
				<!-- End Page Content -->
			</div>
			<!-- End Container fluid  -->
			<!-- footer -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>