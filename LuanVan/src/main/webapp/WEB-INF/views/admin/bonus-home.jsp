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
<title><s:message code="admin.menu.bonus" /></title>
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
										<s:message code="admin.menu.bonus" />
									</h4>
									<p class="category">
										<s:message code="admin.here" />
									</p>
								</div>
								<div style="clear: both; width: 98%; margin: 10px auto;">
									<!-- Tìm kiếm -->
									<form:form action="admin/bonus/search.htm" method="get">
										<div class="col-md-2">
											<div class="form-group">
												<input type="text" name="search"
													placeholder="Tìm kiếm tài khoản"
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
									</form:form>
									<div>
										<a href="admin/bonus/add-bonus.htm" type="button"
											class="btn btn-success btn-fill pull-right"><s:message
												code="admin.bonus.add" /></a>
									</div>

								</div>
								<!-- Show -->
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th><s:message code="admin.bonus.nameEmployee" /></th>
												<th><s:message code="admin.bonus.type" /></th>
												<th><s:message code="admin.bonus.reason" /></th>
												<th><s:message code="admin.bonus.amount" /></th>
												<th><s:message code="admin.bonus.dateWrite" /></th>
												<th><s:message code="admin.function" /></th>
											</tr>

										</thead>
										<c:set var="count" value="0" />
										<tbody>
											<c:forEach items="${listBonus}" var="bonus">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count}</td>
													<td><a href="">${bonus.employee.nameEmployee }</a></td>
													<td><c:choose>
															<c:when test="${bonus.type ==true}">Khen Thưởng</c:when>
															<c:otherwise>Kỷ Luật</c:otherwise>
														</c:choose></td>
													<td>${bonus.reason }</td>
													<td><f:formatNumber type="currency"
															value="${bonus.amount }" pattern="###,###,###" /> VNĐ</td>
													<td><f:formatDate value="${bonus.dateWrite }"
															pattern="dd/MM/yyyy" /></td>
													<td><a href="admin/bonus/edit-bonus/${bonus.id}.htm"
														type="button" type="button"
														class="btn btn-warning btn-fill btn-sm"> <s:message
																code="admin.edit" />
													</a> <a href="admin/bonus/delete-bonus/${bonus.id}.htm"
														onclick="return confirm('Bạn chắc chắn chứ ?')"
														type="button" class="btn btn-info	  btn-fill btn-sm"><s:message
																code="admin.delete" /> </a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="admin/bonus/?page=${row.index}"
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