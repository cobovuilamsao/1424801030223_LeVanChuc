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
<title><s:message code="admin.contract.add" /></title>
</head>
<style>
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
										<s:message code="admin.contract.add" />
									</h4>
								</div>
								<div class="content">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label><s:message code="admin.model.department" />:
													(<span style="color: red;">*</span>) </label>
												<form action="admin/contract/loadEmpl.htm">
													<select name="load" class="form-control border-input">
														<c:forEach var="department" items="${listDepartment }">
															<option value="${department.id}">${department.nameDepartment }</option>
														</c:forEach>
													</select><br>
													<button type="submit"
														class="btn btn-success btn-fill btn-wd"
														style="text-align: right;">
														<s:message code="admin.getEmployee" />
													</button>
												</form>
											</div>
										</div>
									</div>



									<form:form action="admin/contract/save-contract.htm"
										method="POST" commandName="contract">

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label><s:message
															code="admin.contract.nameEmployee" />: (<span
														style="color: red;">*</span>) </label>
													<form:select path="employee.id" items="${listEmployee}"
														itemValue="id" itemLabel="nameEmployee"
														class="form-control border-input" />
												</div>
											</div>

											<div class="col-md-6">
												<div class="form-group">
													<label><s:message
															code="admin.contract.nameContract" />: (<span
														style="color: red;">*</span>)<form:errors
															path="nameContract" /></label>
													<form:select path="nameContract"
														class="form-control border-input">
														<option selected="selected" value=""><s:message
																code="admin.select" /></option>
														<form:option value="HD Khong Xac Dinh Thoi Han">
															<s:message code="nameContract.hdkxdth" />
														</form:option>
														<form:option value="HD Xac Dinh Thoi Han">
															<s:message code="nameContract.hdxdth" />
														</form:option>
														<form:option value="HD Theo Mua Vu">
															<s:message code="nameContract.hdtmv" />
														</form:option>
													</form:select>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.contract.subsidize" />:
														(<span style="color: red;">*</span>)<form:errors
															path="subsidize" /></label>
													<form:select path="subsidize"
														class="form-control border-input">
														<option selected="selected" value="0"><s:message
																code="admin.select" /></option>
														<form:option value="500000">
															<s:message code="subsidize.lunch" />
														</form:option>
														<form:option value="300000">
															<s:message code="subsidize.petroleum" />
														</form:option>
														<form:option value="100000">
															<s:message code="subsidize.phone" />
														</form:option>
														<form:option value="900000">
															<s:message code="subsidize.all" />
														</form:option>
													</form:select>
												</div>
											</div>


											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.contract.insurrance" />:
														(<span style="color: red;">*</span>)<form:errors
															path="insurrance" /></label>
													<form:select path="insurrance"
														class="form-control border-input">
														<option selected="selected" value="0"><s:message
																code="admin.select" /></option>
														<form:option value="0.08">
															<s:message code="insurrance.bhxhnldd" />
														</form:option>
														<form:option value="0.18">
															<s:message code="insurrance.bhxhdnd" />
														</form:option>
													</form:select>
												</div>
											</div>

										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<div class="form-group">
														<label><s:message code="admin.contract.endTime" />:
														</label>
														<form:input path="endTime" placeholder="dd/MM/yyyy..."
															class="form-control border-input" />
													</div>
												</div>
											</div>


											<div class="col-md-6">
												<div class="form-group">
													<label><s:message code="admin.contract.salary" />:
														(<span style="color: red;">*</span>)<form:errors
															path="salary" /></label>
													<form:input type="number" path="salary"
														placeholder="Nhập số tiền..." size="9" maxlength="9"
														value="" class="form-control border-input" />
												</div>
											</div>

										</div>


										<div>
											<form:hidden path="status" value="1" />
										</div>

										<br>
										<div class="text-center">
											<button type="submit" class="btn btn-danger btn-fill btn-wd">
												<s:message code="admin.contract.add" />
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
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>



</body>
</html>