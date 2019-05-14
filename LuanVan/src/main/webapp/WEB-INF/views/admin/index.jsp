<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.menu.home" /></title>
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
										<s:message code="admin.home.list" />
									</h4>
									<p class="category">
										<br>
									</p>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<!--  -->


					<!--  -->
					<div class="row">
						<c:forEach var="topEmpl" items="${topEmployee}">

							<div class="col-md-2">
								<div class="card card-user">
									<div class="content">
										<div class="author">
											<img class="avatar border-white"
												src="images/employees/${topEmpl[2]}" height="100px"
												width="80px" /><br>
											<h4 class="title">${topEmpl[1]}</h4>
										</div>
										<p class="description text-center">
											<s:message code="admin.home.achievements" />
											: ${topEmpl[3]}
										</p>
										<p class="description text-center">
											<s:message code="admin.home.scores" />
											: ${topEmpl[5]}
										</p>
										<p class="description text-center">
											<s:message code="admin.home.amount" />
											:
											<fmt:formatNumber type="currency" value="${topEmpl[6]}"
												pattern="###,###,###" />
											VNĐ
										</p>
									</div>

								</div>
							</div>
						</c:forEach>
						<br> <br>
					</div>


					<!-- Thống Kê -->
<%-- 					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="header">
									<h4 class="title">
										<s:message code="admin.home.report" />
									</h4>
									<p class="category">
										<br>
									</p>
								</div>
							</div>
							<div id="tabs">
								<ul>
									<li><a href="admin/home#tabs-1"><s:message
												code="revenue.byProduct" /> </a></li>
									<li><a href="admin/home#tabs-2"><s:message
												code="revenue.byCategory" /></a></li>
									<li><a href="admin/home#tabs-3"><s:message
												code="revenue.byProducer" /></a></li>
									<li><a href="admin/home#tabs-4"><s:message
												code="revenue.byYear" /></a></li>
								</ul>

								<!-- Theo Mặt Hàng -->
								<div id="tabs-1">
									<script type="text/javascript"
										src="https://www.google.com/jsapi"></script>
									<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['<s:message code="admin.revenue.type" />', '<s:message code="admin.inventory.revenue" />'],
          <c:forEach var="a" items="${productRevenue}">
          ["${a[0]}", ${a[1]}],
          </c:forEach>
        ]);	

        var options = {
          title: '<s:message code="admin.revenue.turnover" />',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart1_3d'));
        chart.draw(data, options);
      }
    </script>
									<div id="piechart1_3d" style="width: 100%; height: 500px;"></div>

								</div>
								<!-- Theo Loại Hàng -->
								<div id="tabs-2">
									<script type="text/javascript"
										src="https://www.google.com/jsapi"></script>
									<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['<s:message code="admin.revenue.type" />', '<s:message code="admin.inventory.revenue" />'],
          <c:forEach var="b" items="${categoryRevenue}">
          ["${b[0]}", ${b[1]}],
          </c:forEach>
        ]);	

        var options = {
          title: '<s:message code="admin.revenue.turnover" />',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart2_3d'));
        chart.draw(data, options);
      }	
    </script>
									<div id="piechart2_3d" style="width: 100%; height: 500px;"></div>

								</div>
								<!-- Theo Hãng -->
								<div id="tabs-3">
									<script type="text/javascript"
										src="https://www.google.com/jsapi"></script>
									<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['<s:message code="admin.revenue.type" />', '<s:message code="admin.inventory.revenue" />'],
          <c:forEach var="a" items="${producerRevenue}">
          ["${a[0]}", ${a[1]}],
          </c:forEach>
        ]);	

        var options = {
          title: '<s:message code="admin.revenue.turnover" />',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart3_3d'));
        chart.draw(data, options);
      }
    </script>
									<div id="piechart3_3d" style="width: 100%; height: 500px;"></div>

								</div>
								<!-- Theo Năm -->
								<div id="tabs-4">
									<script type="text/javascript"
										src="https://www.google.com/jsapi"></script>
									<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['<s:message code="admin.revenue.type" />', '<s:message code="admin.inventory.revenue" />'],
          <c:forEach var="a" items="${yearRevenue}">
          ["${a[0]}", ${a[1]}],
          </c:forEach>
        ]);	

        var options = {
          title: '<s:message code="admin.revenue.turnover" />',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart4_3d'));
        chart.draw(data, options);
      }
    </script>
									<div id="piechart4_3d" style="width: 100%; height: 500px;"></div>

								</div>
							</div>
						</div>
					</div> --%>
					<!--end thống kê  -->
				</div>
			</div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>