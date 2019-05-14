<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.detail" /></title>
<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
	padding-left: 33px;
	background: url("images/hieuboy2.gif") no-repeat left center;
}
</style>
</head>
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
													${employee.nameEmployee }<br> <a href="#"><small>${employee.nameEmployee }</small></a>
												</h4>
											</div>
											<div style="text-align: center">
												<img src="images/employees/${employee.photo }" width="300"
													height="400"
													style="border-radius: 40px; border-color: black;" />

											</div>

											<h5 style="text-align: center;">
												<span><s:message code="admin.employee.email" />: </span>
												${employee.email}
											</h5>

											<h5 style="text-align: center;">
												<span><s:message code="admin.employee.gender" />: </span>
												<c:choose>
													<c:when test="${employee.gender < 2 }"> Nam </c:when>
													<c:when test="${employee.gender >= 2}"> Nữ </c:when>
												</c:choose>
											</h5>


											<h5 style="text-align: center;">
												<span><s:message code="admin.employee.address" />: </span>
												${employee.address }
											</h5>

											<h5 style="text-align: center;">
												<span><s:message code="admin.employee.numberPhone" />:
												</span> ${employee.numberPhone }
											</h5>


											<h5 style="text-align: center;">
												<span><s:message code="admin.model.department" />: </span>
												${employee.department.nameDepartment}
											</h5>


											<h5 style="text-align: center;">
												<span><s:message code="admin.model.employeeType" />:
												</span> ${employee.employeeType.nameEmployeeType}
											</h5>
											<hr>
											<form:form
												action="admin/employee/changePhoto-detail/${employee.id}.htm"
												method="POST" commandName="employee"
												enctype="multipart/form-data">

												<div>
													<form:hidden path="id" />
													<form:hidden path="email" />
													<form:hidden path="password" />
													<form:hidden path="access" />
													<form:hidden path="activated" />
													<form:hidden path="gender" />
													<form:hidden path="address" />
													<form:hidden path="nameEmployee" />
													<form:hidden path="photo" />
													<form:hidden path="numberPhone" />
													<form:hidden path="birthday" />
													<form:hidden path="department.id" items="${department}"
														itemValue="id" itemLabel="nameDepartment" />
													<form:hidden path="employeeType.id" items="${employeeType}"
														itemValue="id" itemLabel="nameEmployeeType" />
												</div>
												<div style="text-align: center;">
													<h5 style="text-align: center;">
														<s:message code="admin.employee.photo" />
														:
													</h5>
													<center>
														<input id="photo" type="file" name="file_image"
															style="text-align: center;" class="btn btn-info btn-fill" />

													</center>
													<br>
													<form:errors path="photo" />
													<br>
													<button class="btn btn-danger btn-fill">
														<s:message code="admin.save" />
													</button>
												</div>
											</form:form>

										</div>
										<hr>
										<div class="text-center">
											<div class="row">
												<div class="col-md-3 col-md-offset-1">
													<h5></h5>
												</div>
												<div class="col-md-4">
													<h5>
														<a href="admin/employee" class="btn btn-success btn-fill">
															<s:message code="admin.return" />
														</a>
													</h5>
												</div>
												<div class="col-md-3">
													<h5></h5>
												</div>
											</div>
										</div>
									</div>
									<!-- <div class="card">
										<div class="header">
											<h4 class="title">Team Members</h4>
										</div>
										<div class="content">
											<ul class="list-unstyled team-members">
												<li>
													<div class="row">
														<div class="col-xs-3">
															<div class="avatar">
																<img src="assets/img/faces/face-0.jpg"
																	alt="Circle Image"
																	class="img-circle img-no-padding img-responsive">
															</div>
														</div>
														<div class="col-xs-6">
															DJ Khaled <br> <span class="text-muted"><small>Offline</small></span>
														</div>

														<div class="col-xs-3 text-right">
															<btn class="btn btn-sm btn-success btn-icon">
															<i class="fa fa-envelope"></i></btn>
														</div>
													</div>
												</li>
												<li>
													<div class="row">
														<div class="col-xs-3">
															<div class="avatar">
																<img src="assets/img/faces/face-1.jpg"
																	alt="Circle Image"
																	class="img-circle img-no-padding img-responsive">
															</div>
														</div>
														<div class="col-xs-6">
															Creative Tim <br> <span class="text-success"><small>Available</small></span>
														</div>

														<div class="col-xs-3 text-right">
															<btn class="btn btn-sm btn-success btn-icon">
															<i class="fa fa-envelope"></i></btn>
														</div>
													</div>
												</li>
												<li>
													<div class="row">
														<div class="col-xs-3">
															<div class="avatar">
																<img src="assets/img/faces/face-3.jpg"
																	alt="Circle Image"
																	class="img-circle img-no-padding img-responsive">
															</div>
														</div>
														<div class="col-xs-6">
															Flume <br> <span class="text-danger"><small>Busy</small></span>
														</div>

														<div class="col-xs-3 text-right">
															<btn class="btn btn-sm btn-success btn-icon">
															<i class="fa fa-envelope"></i></btn>
														</div>
													</div>
												</li>
											</ul>
										</div>
									</div> -->
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