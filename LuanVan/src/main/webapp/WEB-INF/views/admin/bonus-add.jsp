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
<title><s:message code="admin.bonus.add" /></title>
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
								<div class="header">
									<h4 class="title">
										<s:message code="admin.bonus.add" />
									</h4>
								</div>
								<div class="content">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label><s:message code="admin.model.department" />:
													(<span style="color: red;">*</span>) </label>
												<form action="admin/bonus/loadEmpl.htm">
													<select name="load" class="form-control border-input">
														<c:forEach var="department" items="${listDepartment }">
															<option value="${department.id}">${department.nameDepartment }</option>
														</c:forEach>
													</select> <br>
													<button type="submit"
														class="btn btn-success btn-fill btn-wd"
														style="text-align: right;">
														<s:message code="admin.getEmployee" />
													</button>
												</form>
											</div>
										</div>
									</div>


									<form:form action="admin/bonus/save-bonus.htm" method="POST"
										modelAttribute="bonus">
										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.bonus.idEmployee" />:
														(<span style="color: red;">*</span>)<form:errors
															path="employee.id" /></label>
													<form:select path="employee.id" items="${listEmployee}"
														itemValue="id" itemLabel="nameEmployee"
														class="form-control border-input" />
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.bonus.type" />: (<span
														style="color: red;">*</span>) </label>
													<form:select path="type" class="form-control border-input">
														<form:option value="True">
															<s:message code="bonus.achievements" />
														</form:option>
														<form:option value="False">
															<s:message code="bonus.discipline" />
														</form:option>
													</form:select>
												</div>
											</div>
										</div>

										<div class="row">

											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.bonus.reason" />: (<span style="color: red;">*</span>)<form:errors
															path="reason" /></label>
													<form:textarea path="reason" placeholder="Nhập lý do..."
														rows="1" class="form-control border-input" />

												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.bonus.amount" />: (<span style="color: red;">*</span>)<form:errors
															path="amount" /></label>
													<form:input type="number" path="amount"
														placeholder="Nhập số tiền..."
														class="form-control border-input" />

												</div>
											</div>
										</div>

										<br>
										<div class="text-center">
											<button type="submit" class="btn btn-danger btn-fill btn-wd"><s:message code="admin.bonus.add" /></button>
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
	<div></div>
</body>
</html>