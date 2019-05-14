<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.menu.report" /></title>

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
										<s:message code="admin.menu.report" />
									</h4>
									<p class="category">
										<s:message code="admin.here" />
									</p>
								</div>

								<div style="clear: both; width: 98%; margin: 10px auto;">
									<form method="post">

										<div class="col-md-2">
											<div class="form-group">
												<input type="text" name="min" placeholder="Min Date"
													class="datepicker form-control border-input"
													value="${param.min }" />
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<input type="text" name="max"
													class="datepicker form-control border-input"
													placeholder="Max Date" class="" value="${param.max }" />
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<button class="btn btn-danger btn-fill">
													<s:message code="admin.filter" />
												</button>
											</div>
										</div>

									</form>

								</div>

								<div class="content table-responsive table-full-width">
									<table class="table table-striped">
										<thead>
											<tr>
												<th><s:message code="admin.inventory.group" /></th>
												<th><s:message code="admin.inventory.quantity" /></th>
												<th><s:message code="admin.inventory.revenue" /></th>
												<th><s:message code="admin.inventory.lowest" /></th>
												<th><s:message code="admin.inventory.highest" /></th>
												<th><s:message code="admin.inventory.average" /></th>
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
							</div>
						</div>
					</div>


					<!--  -->
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">
										<s:message code="admin.inventory.chart" />
									</h4>
								</div>
								<script type="text/javascript"
									src="https://www.google.com/jsapi"></script>
								<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Loại', 'Doanh Số'],
          <c:forEach var="a" items="${arrays}">
          ["${a[0]}", ${a[2]}],
          </c:forEach>
        ]);	

        var options = {
          title: '<s:message code="admin.revenue.turnover" />',
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
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>