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
<title><s:message code="employee.home.changeInfo" /></title>
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
							<s:message code="employee.home.changeInfo" />
						</h3>
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
										code="employee.menu.home" /></a></li>
							<li class="breadcrumb-item active"><s:message
									code="employee.home.changeInfo" /></li>
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
									<s:message code="employee.home.changeInfo" />
								</h4>
								<form:form
									action="employee/change-info/${employee.id }.htm"
									method="POST" commandName="employee"
									enctype="multipart/form-data">
									<div class="row">
										<div class="col-md-6">
											<label><s:message code="employee.home.nameEmployee" />:
												(<span style="color: red;">*</span>)<form:errors
													path="nameEmployee" /></label>
											<form:input path="nameEmployee"
												placeholder="Hãy nhập tên của bạn" size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-6">
											<label><s:message code="employee.home.address" />: (<span
												style="color: red;">*</span>)<form:errors path="address" /></label>
											<form:input path="address" placeholder="Địa chỉ của bạn"
												size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-md-6">
											<label><i class="fa fa-calendar bigger-110"> </i> <s:message
													code="employee.home.birthday" />: (<span
												style="color: red;">*</span>)<form:errors path="birthday" /></label>
											<form:input path="birthday" id="datepicker"
												placeholder="Ngày/Tháng/Năm" size="30" maxlength="30"
												class="form-control form-control-line" />
										</div>
										<div class="col-md-6">
											<label> <s:message code="employee.home.numberPhone" />:
												(<span style="color: red;">*</span>)<form:errors
													path="numberPhone" /></label>
											<form:input path="numberPhone"
												placeholder="Nhập số điện thoại của bạn" size="30"
												maxlength="30" class="form-control form-control-line" />
										</div>
									</div>
									<br>

									<div class="row">

										<div class="col-md-6">
											<label><s:message code="employee.home.gender" />: (<span
												style="color: red;">*</span>)<form:errors path="gender" />
											</label>
											<form:select path="gender"
												class="form-control form-control-line">
												<form:option value="0">
													<s:message code="employee.select" />
												</form:option>
												<form:option value="1">
													<s:message code="employee.home.gender.male" />
												</form:option>
												<form:option value="2">
													<s:message code="employee.home.gender.female" />
												</form:option>

											</form:select>
										</div>

										<div class="col-md-6">
											<label><s:message code="employee.home.photo" />: (<span
												style="color: red;">*</span>)<form:errors path="photo" /></label> <input
												id="photo" type="file" name="file_image"
												class="form-control form-control-line" />
										</div>
									</div>

									<br>
									<div class="row">
										<div class="col-md-12">
											<div style="text-align: center;">
												<button class="btn btn-primary">
													<s:message code="employee.home.changeInfo" />
												</button>
											</div>
										</div>

									</div>
									<br>
									<form:hidden path="id" />
									<form:hidden path="email" />
									<form:hidden path="password" />
									<form:hidden path="access" />
									<form:hidden path="activated" />
									<form:hidden path="employeeType.id" />
									<form:hidden path="department.id" />
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