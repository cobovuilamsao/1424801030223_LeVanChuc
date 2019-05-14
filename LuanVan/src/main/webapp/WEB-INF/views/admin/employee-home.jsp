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
<title><s:message code="admin.menu.employee" /></title>
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
								<div class="header">
									<h4 class="title">
										<s:message code="admin.menu.employee" />
									</h4>
									<p class="category">
										<s:message code="admin.here" />
										<span style="color: red"> ${message}</span>
									</p>
								</div>

								<div style="clear: both; width: 98%; margin: 10px auto;">
									<!-- Tìm Kiếm -->
									<form:form action="admin/employee/filter.htm" method="get">
										<div class="col-md-2">
											<div class="form-group">
												<input type="text" name="NV"
													placeholder="Tìm kiếm tên và mã nhân viên"
													class="form-control border-input" />
											</div>
										</div>

										<div class="col-md-2">
											<div class="form-group">
												<select name="PB" class="form-control border-input">
													<option selected="selected" value=""><s:message
															code="admin.department" /></option>
													<c:forEach var="department" items="${listDepartment}">
														<option value="${department.id}">${department.nameDepartment}</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="col-md-2">
											<div class="form-group">
												<select name="LNV" class="form-control border-input">
													<option selected="selected" value=""><s:message
															code="admin.employeeType" /></option>
													<c:forEach var="employeeType" items="${listEmployeeType}">
														<option value="${employeeType.id}">${employeeType.nameEmployeeType}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<button type="submit" class="btn btn-danger btn-fill">
													<s:message code="admin.search" />
												</button>
											</div>
										</div>
									</form:form>

									<div>
										 <a type="submit" href="admin/employee/add-employee.htm"
											class="btn btn-success btn-fill pull-right"><s:message
												code="admin.employee.add" />
										</a>  
										<%-- <a type="submit"
											href="admin/employee/add"
											class="btn btn-success btn-fill pull-right"><s:message
												code="admin.employee.add" /> --%>
										</a>
									</div>

								</div>
								<!-- Show -->
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th><s:message code="admin.employee.id" /></th>
												<th><s:message code="admin.employee.name" /></th>
												<th><s:message code="admin.employee.email" /></th>
												<th><s:message code="admin.employee.gender" /></th>
												<th><s:message code="admin.employee.photo" /></th>
												<th><s:message code="admin.employee.address" /></th>
												<th><s:message code="admin.employee.numberPhone" /></th>
												<th><s:message code="admin.employee.birthday" /></th>
												<th><s:message code="admin.function" /></th>
											</tr>

										</thead>
										<tbody>
											<c:forEach items="${listEmployee}" var="employee">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count}</td>
													<td>${employee.id }</td>
													<td><a href="admin/employee/detail/${employee.id}.htm">${employee.nameEmployee }</a></td>
													<td>${employee.email }</td>
													<td><c:choose>
															<c:when test="${employee.gender < 2 }"> Nam </c:when>
															<c:when test="${employee.gender >= 2}"> Nữ </c:when>
														</c:choose></td>
													<td><img src="images/employees/${employee.photo }"
														height="100px" width="80px"
														style="border-radius: 25px; border-color: black;"></td>
													<td>${employee.address }</td>
													<td>${employee.numberPhone }</td>
													<td><f:formatDate value="${employee.birthday}"
															pattern="dd/MM/yyyy" /> <%-- <td>${employee.employeeType.nameEmployeeType}</td>
											<td>${employee.department.nameDepartment }</td>
											<td>${employee.position.namePosition }</td> --%>
													<td><a
														href="admin/employee/edit-employee/${employee.id}.htm"
														class="btn btn-info btn-simple btn-xs"> <i
															class="fa fa-save"></i> <s:message code="admin.edit" />
													</a> <br> <a
														href="admin/employee/delete-employee/${employee.id}.htm"
														onclick="return confirm('Bạn chắc chắn chứ ?')"
														class="btn btn-danger btn-simple btn-xs"> <i
															class="fa fa-times"></i> <s:message code="admin.delete" />
													</a> <br> <a
														href="admin/employee/detail/${employee.id}.htm"
														class="btn btn-success btn-simple btn-xs"> <i
															class="fa fa-video-camera"></i> <s:message
																code="admin.detail" />
													</a><br> <a
														href="admin/employee/reset-password/${employee.id}.htm"
														onclick="return confirm('Bạn chắc chắn chứ?')"
														class="btn btn-warning btn-simple btn-xs"> <i
															class="fa ti-reload"></i> <s:message
																code="admin.resetPass" />
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<!-- Phân Trang -->
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="admin/employee/?page=${row.index}"
												class="btn btn-danger btn-xs btn-fill">${row.index}</a>
										</c:forEach>
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