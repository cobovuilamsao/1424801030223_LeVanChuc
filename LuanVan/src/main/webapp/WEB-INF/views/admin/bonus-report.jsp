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
<title><s:message code="admin.bonus.list" /></title>
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
										<s:message code="admin.bonus.list" />
									</h4>
									<p class="category">
										<s:message code="admin.here" />
									</p>
								</div>
								<div style="clear: both; width: 98%; margin: 10px auto;">
									<a href="admin/bonus"
										class="btn btn-success btn-fill pull-right"><s:message
											code="admin.menu.bonus" /></a>
								</div>
								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>STT</th>
												<th><s:message code="admin.bonus.idEmployee" /></th>
												<th><s:message code="admin.bonus.nameEmployee" /></th>
												<th><s:message code="admin.bonus.totalAchievements" /></th>
												<th><s:message code="admin.bonus.totalDiscipline" /></th>
												<th><s:message code="admin.bonus.amount" /></th>
												<th><s:message code="admin.bonus.summary" /></th>
											</tr>

										</thead>
										<c:set var="count" value="0" />
										<tbody>
											<c:forEach var="report" items="${arrays}">
												<tr>
													<c:set var="count" value="${count+1 }" />
													<td>${count}</td>
													<td>${report[0]}</td>
													<td><a href="" class="text-success">${report[1]}</a></td>
													<td>${report[2]}</td>
													<td>${report[3]}</td>
													<td><f:formatNumber type="currency"
															value="${report[4]}" pattern="###,###,###" /> VNĐ</td>
													<td>${report[2] - report[3]}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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