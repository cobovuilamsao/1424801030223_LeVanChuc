<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.employee.add" /></title>
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
						<div class="col-md-12">
							<div class="card">
								<div class="col-lg-12 col-md-10">
									<div class="card">
										<div class="header">
											<h4 class="title">
												<s:message code="admin.employee.add" />
											</h4>
										</div>
										<div class="content">
											<form:form action="admin/employee/save-employee.htm"
												method="POST" commandName="employee"
												enctype="multipart/form-data">

												<div>
													<form:hidden path="access" value="1" />
													<form:hidden path="activated" value="false" />
												</div>
												<div class="row">

													<!-- Dòng đầu -->
													<div class="col-md-4">
														<div class="form-group">
															<label><s:message code="admin.employee.id" />: (<span
																style="color: red;">*</span>)<form:errors path="id" /></label>
															<form:input path="id" placeholder="Tài khoản người dùng"
																size="30" maxlength="30"
																class="form-control border-input" />
														</div>
													</div>

													<div class="col-md-4">
														<div class="form-group">
															<label><s:message code="admin.employee.password" />:
																(<span style="color: red;">*</span>)<form:errors
																	path="password" /></label>
															<form:input path="password"
																placeholder="Nhập mật khẩu..." size="30" maxlength="30"
																class="form-control border-input" />
														</div>
													</div>


													<div class="col-md-4">
														<div class="form-group">
															<label for="exampleInputEmail1"><s:message
																	code="admin.employee.email" />: (<span
																style="color: red;">*</span>)<form:errors path="email" />
															</label>
															<form:input path="email" placeholder="Địa chỉ email"
																class="form-control border-input" size="30"
																maxlength="30" />
														</div>
													</div>


												</div>

												<!-- Dòng 2 -->
												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label><s:message code="admin.employee.name" />:
																(<span style="color: red;">*</span>)<form:errors
																	path="nameEmployee" /></label>
															<form:input path="nameEmployee"
																placeholder="Tên nhân viên" size="30" maxlength="30"
																class="form-control border-input" />
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label><s:message
																	code="admin.employee.numberPhone" />: (<span
																style="color: red;">*</span>)<form:errors
																	path="numberPhone" /></label>
															<form:input path="numberPhone"
																placeholder="Số điện thoại" size="12" maxlength="12"
																value="" class="form-control border-input" />
														</div>
													</div>

													<div class="col-md-4">
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
													<div class="col-md-4">
														<div class="form-group">
															<label><i class="fa fa-calendar bigger-110"></i>
																<s:message code="admin.employee.birthday" />: (<span
																style="color: red;">*</span>)<form:errors
																	path="birthday" /></label>
															<form:input path="birthday" id="datepicker"
																placeholder="dd/MM/yyyy..."
																data-date-format="dd-mm-yyyy"
																class="form-control border-input" />


														</div>
													</div>

													<div class="col-md-4">
														<div class="form-group">
															<label><s:message code="admin.employee.photo" />:
																<form:errors path="photo" /></label> <input id="photo"
																type="file" name="file_image"
																class="form-control border-input" />
														</div>
													</div>

													<div class="col-md-4">
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
															<form:select path="employeeType.id"
																items="${employeeType}" itemValue="id"
																itemLabel="nameEmployeeType"
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
													<button type="submit"
														class="btn btn-danger btn-fill btn-wd">
														<s:message code="admin.employee.add" />
													</button>
												</div>
												<div class="clearfix"></div>
												<br>

											</form:form>
										</div>
									</div>
								</div>
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