<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.employee.edit" /></title>
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
	<div class="wrapper">
		<jsp:include page="menu.jsp"></jsp:include>
		<div class="main-panel">
			<jsp:include page="header.jsp"></jsp:include>
			<div class="content">
				<div class="container-fluid">

					<div class="row">
						<div class="col-lg-8 col-md-7">
							<div class="card">
								<div class="header">
									<h4 class="title">
										<s:message code="admin.employee.edit" />
									</h4>
								</div>
								<div class="content">
									<form:form
										action="admin/employee/edit-employee/${employee.id}.htm"
										method="POST" commandName="employee">

										<div>
											<form:hidden path="id" />
											<form:hidden path="access" />
											<form:hidden path="password" />
											<form:hidden path="activated" />
											<form:hidden path="photo" />
										</div>
										<div class="row">

											<!-- Dòng đầu -->
											<div class="col-md-6">
												<div class="form-group">
													<label for="exampleInputEmail1"><s:message
															code="admin.employee.email" />: (<span
														style="color: red;">*</span>)<form:errors path="email" />
													</label>
													<form:input path="email" placeholder="Địa chỉ email"
														class="form-control border-input" size="30" maxlength="30" />
													<!-- readonly="true"  -->
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.employee.name" />: (<span
														style="color: red;">*</span>)<form:errors
															path="nameEmployee" /></label>
													<form:input path="nameEmployee"
														placeholder="Tên nhân viên" size="30" maxlength="30"
														class="form-control border-input" />
												</div>
											</div>
										</div>

										<!-- Dòng 2 -->
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.employee.numberPhone" />:
														(<span style="color: red;">*</span>)<form:errors
															path="numberPhone" /></label>
													<form:input path="numberPhone"
														placeholder="Số điện thoại" size="12" maxlength="12"
														value="" class="form-control border-input" />
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.employee.address" />:
														(<span style="color: red;">*</span>)<form:errors
															path="address" /></label>
													<form:input path="address" placeholder="Địa chỉ"
														class="form-control border-input" />
												</div>
											</div>
										</div>
										<!-- Dòng 3 -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label><i class="fa fa-calendar bigger-110"></i> <s:message
															code="admin.employee.birthday" />: (<span
														style="color: red;">*</span>)<form:errors path="birthday" /></label>
													<form:input path="birthday" id="datepicker"
														placeholder="dd/MM/yyyy" data-date-format="dd-mm-yyyy"
														class="form-control border-input" />


												</div>
											</div>



											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.employee.gender" />:
														(<span style="color: red;">*</span>) </label>
													<form:errors path="gender" />
													<form:select path="gender"
														class="form-control border-input">
														<form:option value="0">
															<s:message code="admin.select" />
														</form:option>
														<form:option value="1">
															<s:message code="gender.male" />
														</form:option>
														<form:option value="2">
															<s:message code="gender.female" />
														</form:option>
													</form:select>
												</div>
											</div>
										</div>

										<!-- Dòng 4 -->
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.model.employeeType" />
														(<span style="color: red;">*</span>) </label>
													<form:select path="employeeType.id" items="${employeeType}"
														itemValue="id" itemLabel="nameEmployeeType"
														class="form-control border-input" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.model.department" />
														(<span style="color: red;">*</span>) </label>
													<form:select path="department.id" items="${department}"
														itemValue="id" itemLabel="nameDepartment"
														class="form-control border-input" />
												</div>
											</div>
										</div>
										<br>
										<div class="text-center">
											<button type="submit" class="btn btn-danger btn-fill btn-wd">
												<s:message code="admin.employee.edit" />
											</button>
										</div>
										<div class="clearfix"></div>
										<br>

									</form:form>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-md-5">
							<div class="card card-user">
								<div class="image">
									<img src="assets/img/background.jpg" alt="...">
								</div>
								<div class="content">
									<div class="author">
										<img class="avatar border-white"
											src="
											images/employees/${employee.photo }"
											alt="...">
										<h4 class="title">
											${employee.nameEmployee }<br> <a href="#"><small>
													${employee.nameEmployee }</small></a>
										</h4>
									</div>
									<p class="description text-center">
										"I like the way you work it <br> No diggity <br> I
										wanna bag it up"
									</p>
								</div>
								<hr>
								<div class="text-center"></div>
							</div>

						</div>



					</div>

				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>


</body>
</html>