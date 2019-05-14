<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.menu.revenue" /></title>
</head>
<div id="main-wrapper">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="page-wrapper">
		<!-- Container fluid  -->
		<div class="container-fluid">
			<!-- Bread crumb and right sidebar toggle -->
			<div class="row page-titles">
				<div class="col-md-5 col-8 align-self-center">
					<h3 class="text-themecolor m-b-0 m-t-0">
						<s:message code="employee.menu.revenue" />
					</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
									code="employee.menu.home" /></a></li>
						<li class="breadcrumb-item active"><s:message
								code="employee.menu.revenue" /></li>
					</ol>
				</div>
				<div class="col-md-7 col-4 align-self-center">
					<a href="http://facebook.com/HieuDTPH04388" target="blank"
						class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down">
						<s:message code="employee.menu.contact" />
					</a>
				</div>
			</div>
			<!-- End Bread crumb and right sidebar toggle -->
			<div class="row">
				<!-- column -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-block">
							<h4 class="card-title">
								<s:message code="employee.revenue.list" />
							</h4>
							<h6 class="card-subtitle">
								<s:message code="employee.here" />
							</h6>
							<!-- Tìm Kiếm -->
							<form:form method="post">
								<div class="row">
									<div class="col-md-2">
										<input type="text" name="min" placeholder="Min Date"
											class="datepicker form-control form-control-line"
											value="${param.min }" />
									</div>
									<div class="col-md-2">
										<input type="text" name="max" placeholder="Max Date"
											class="datepicker form-control form-control-line"
											value="${param.max }" />
									</div>
									<div class="col-md-2">
										<button type="submit" class="btn btn-danger">
											<s:message code="employee.filter" />
										</button>
									</div>

								</div>
							</form:form>
							<br>
							<!-- Show -->
							<div class="content table-responsive table-full-width">
								<table class="table table-striped">
									<thead>
										<tr>
											<th><s:message code="employee.inventory.group" /></th>
											<th><s:message code="employee.inventory.quantity" /></th>
											<th><s:message code="employee.inventory.revenue" /></th>
											<th><s:message code="employee.inventory.lowest" /></th>
											<th><s:message code="employee.inventory.highest" /></th>
											<th><s:message code="employee.inventory.average" /></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="a" items="${arrays}">
											<tr>
												<td>${a[0]}</td>
												<td>${a[1]}</td>
												<td><fmt:formatNumber value="${a[2]}" type="currency"
														pattern="000,000" /> VNĐ</td>
												<td><fmt:formatNumber value="${a[3]}" type="currency"
														pattern="000,000" /> VNĐ</td>
												<td><fmt:formatNumber value="${a[4]}" type="currency"
														pattern="000,000" /> VNĐ</td>
												<td><fmt:formatNumber value="${a[5]}" type="currency"
														pattern="000,000" /> VNĐ</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!--  -->
						</div>
					</div>
				</div>
			</div>

			<!-- End PAge Content -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-block">
							<h4 class="card-title">
								<s:message code="employee.inventory.chart" />
							</h4>

							<script type="text/javascript" src="https://www.google.com/jsapi"></script>
							<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['<s:message code="employee.revenue.type" />', '<s:message code="employee.inventory.revenue" />'],
          <c:forEach var="a" items="${arrays}">
          ["${a[0]}", ${a[2]}],
          </c:forEach>
        ]);	

        var options = {
          title: '<s:message code="employee.revenue.turnover" />',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
							<div id="piechart_3d" style="width: 900px; height: 500px;"></div>
						</div>
						<!--  -->
					</div>
				</div>
			</div>
			<!--  -->
		</div>
		<!-- End Container fluid  -->
		<!-- footer -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>
</html>