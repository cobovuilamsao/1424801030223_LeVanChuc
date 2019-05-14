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
<title><s:message code="admin.menu.account" /></title>
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
									<h4 class="title"><s:message code="admin.menu.account" /></h4>
									<p class="category">
										<s:message code="admin.here" />
									</p>
								</div>

								<div style="clear: both; width: 98%; margin: 10px auto;">
									<!-- Tìm Kiếm -->
									<form:form action="admin/account/search.htm" method="get">
										<div class="col-md-2">
											<div class="form-group">
												<input type="text" name="search" placeholder="Tìm kiếm..."
													class="form-control border-input" />
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
										<a type="submit" href="admin/account/add-account.htm"
											class="btn btn-success btn-fill pull-right"><s:message
												code="admin.account.add" /></a>
									</div>

								</div>

								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>#</th>
												<th><s:message code="admin.account.email" /></th>
												<th><s:message code="admin.account.fullName" /></th>
												<th><s:message code="admin.function" /></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="account" items="${listAccount }">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count }</td>
													<td>${account.username }</td>
													<td>${account.fullName }</td>
													<td width="200px"><%-- <a
														href="admin/account/edit-account/${account.username}.htm"
														class="btn btn-info btn-fill btn-sm"> <i
															class="fa fa-edit"></i> <s:message code="admin.edit" />
													</a>  --%><a
														href="admin/account/delete-account/${account.username}.htm"
														onclick="return confirm('Bạn chắc chắn chứ ?')"
														class="btn btn-warning btn-fill btn-sm"> <i
															class="fa fa-times"></i> <s:message code="admin.delete" />
													</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- Phân Trang -->
									<div style="margin: 10px; text-align: right;">
										<c:forEach begin="1" end="${rowCount}" varStatus="row">
											<a type="button" href="admin/account/?page=${row.index}"
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