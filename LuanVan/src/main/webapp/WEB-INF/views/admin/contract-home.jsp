<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.menu.contract" /></title>
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
										<s:message code="admin.menu.contract" />
									</h4>
									<p class="category">
										<s:message code="admin.here" />
									</p>
								</div>
								<div style="clear: both; width: 98%; margin: 10px auto;">
									<!-- Tìm Kiếm -->
									<form action="admin/contract/search.htm">
										<div class="col-md-2">
											<div class="form-group">
												<input type="text" name="search"
													placeholder="Tìm kiếm Mã, Tên NV, Lương"
													class="form-control border-input" />
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<select name="filter" class="form-control border-input">
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
												<button type="submit" class="btn btn-danger btn-fill">
													<s:message code="admin.search" />
												</button>
											</div>
										</div>
									</form>
									<div>
										<a type="button" href="admin/contract/add-contract.htm"
											class="btn btn-success btn-fill pull-right"><s:message
												code="admin.contract.add" /></a>
									</div>

									<!-- Lọc -->
									<form action="admin/contract/filter.htm">
										<div class="col-md-2">
											<div class="form-group">
												<select name="filter" class="form-control border-input">
													<option selected="selected" value=""><s:message
															code="admin.status" /></option>
													<option value="1"><s:message code="status.signed" /></option>
													<option value="2"><s:message code="status.expired" /></option>
												</select>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<button type="submit" class="btn btn-warning btn-fill">
													<s:message code="admin.filter" />
												</button>
											</div>
										</div>
									</form>
								</div>

								<!-- Show -->
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th><s:message code="admin.contract.nameEmployee" /></th>
												<th><s:message code="admin.contract.nameContract" /></th>
												<th><s:message code="admin.contract.startTime" /></th>
												<th><s:message code="admin.contract.endTime" /></th>
												<th><s:message code="admin.contract.subsidize" /></th>
												<th><s:message code="admin.contract.insurrance" /></th>
												<th><s:message code="admin.contract.salary" /></th>
												<th><s:message code="admin.contract.total" /></th>
												<th><s:message code="admin.contract.status" /></th>
												<th><s:message code="admin.function" /></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listContract}" var="contract">
												<tr>
													<td>${contract.employee.nameEmployee }</td>
													<td>${contract.nameContract }</td>
													<td><f:formatDate value="${contract.startTime}"
															pattern="dd/MM/yyyy" />
													<td><f:formatDate value="${contract.endTime}"
															pattern="dd/MM/yyyy" />
													<td><f:formatNumber type="currency"
															value="${contract.subsidize }" pattern="###,###,###" />
														VNĐ</td>
													<td><c:choose>
															<c:when test="${contract.insurrance == 0}"> 0 %</c:when>
															<c:when test="${contract.insurrance == null}"> 0 %</c:when>
															<c:otherwise>
																<f:formatNumber value="${contract.insurrance}"
																	type="percent" /> %</c:otherwise>
														</c:choose></td>
													<td><f:formatNumber type="currency"
															value="${contract.salary }" pattern="###,###,###" /> VNĐ</td>
													<td><c:if
															test="${contract.subsidize == 500000 && contract.insurrance == 0.18 }">
															<f:formatNumber type="currency" pattern="###,###,###"
																value="${contract.subsidize + (contract.salary * (1-contract.insurrance))}" /> VNĐ </c:if>
														<c:if
															test="${contract.subsidize == 300000 && contract.insurrance == 0.18 }">
															<f:formatNumber type="currency" pattern="###,###,###"
																value="${contract.subsidize + (contract.salary * (1-contract.insurrance))}" /> VNĐ</c:if>
														<c:if
															test="${contract.subsidize == 100000 && contract.insurrance == 0.18 }">
															<f:formatNumber type="currency" pattern="###,###,###"
																value="${contract.subsidize + (contract.salary * (1-contract.insurrance))}" /> VNĐ</c:if>
														<c:if
															test="${contract.subsidize == 900000 && contract.insurrance == 0.18 }">
															<f:formatNumber type="currency" pattern="###,###,###"
																value="${contract.subsidize + (contract.salary * (1-contract.insurrance))}" /> VNĐ</c:if>

														<c:if
															test="${contract.subsidize == 500000 && contract.insurrance == 0.08 }">
															<f:formatNumber type="currency" pattern="###,###,###"
																value="${contract.subsidize + (contract.salary * (1-contract.insurrance))}" /> VNĐ</c:if>
														<c:if
															test="${contract.subsidize == 300000 && contract.insurrance == 0.08 }">
															<f:formatNumber type="currency" pattern="###,###,###"
																value="${contract.subsidize + (contract.salary * (1-contract.insurrance))}" /> VNĐ</c:if>
														<c:if
															test="${contract.subsidize == 100000 && contract.insurrance == 0.08 }">
															<f:formatNumber type="currency" pattern="###,###,###"
																value="${contract.subsidize + (contract.salary * (1-contract.insurrance))}" /> VNĐ</c:if>
														<c:if
															test="${contract.subsidize == 900000 && contract.insurrance == 0.08 }">
															<f:formatNumber type="currency" pattern="###,###,###"
																value="${contract.subsidize + (contract.salary * (1-contract.insurrance))}" /> VNĐ</c:if>

													</td>
													<%
														Date date = new Date();
													%><c:if test="${contract.endTime == date.getTime()}"></c:if>
													<td><c:choose>

															<c:when test="${contract.status >= 2}">
																<a
																	href="admin/contract/reset-status/${contract.employee.id }.htm"
																	type="submit" class="btn btn-info btn-fill btn-sm"><s:message
																		code="status.expired" /></a>

															</c:when>

															<c:when test="${contract.status < 2 }">
																<a
																	href="admin/contract/reset-status/${contract.employee.id }.htm"
																	type="submit" class="btn btn-danger btn-fill btn-sm"><s:message
																		code="status.signed" /></a>
															</c:when>
														</c:choose></td>
													<td><a
														href="admin/contract/edit-contract/${contract.employee.id}.htm"
														type="button" class="btn btn-danger btn-xs"><s:message
																code="admin.edit" /></a> <a
														href="admin/contract/delete-contract/${contract.employee.id}.htm"
														type="button"
														onclick="return confirm('Bạn chắc chắn chứ ?')"
														class="btn btn-success btn-xs"><s:message
																code="admin.delete" /></a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<!-- Phân Trang -->
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="admin/contract/?page=${row.index}"
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