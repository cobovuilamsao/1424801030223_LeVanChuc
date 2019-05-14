<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="employee.menu.home" /></title>

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
						<s:message code="employee.menu.home" />
					</h3>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)"><s:message
									code="employee.menu.home" /></a></li>
						<li class="breadcrumb-item active"><s:message
								code="employee.menu.info" /></li>
					</ol>
				</div>
				<div class="col-md-7 col-4 align-self-center">
					<a href="http://facebook.com/HieuDTPH04388" target="blank"
						class="btn waves-effect waves-light btn-danger pull-right hidden-sm-down">
						<s:message code="employee.menu.contact" />
					</a>
				</div>
			</div>
			<!--  -->


			<!-- End Bread crumb and right sidebar toggle -->

			<c:if test="${sessionScope.employee.nameEmployee != null}">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<img class="card-img-top"
								src="lite/images/background/profile-bg.jpg" alt="Card image cap">
							<div class="card-block little-profile text-center">
								<div class="pro-img">
									<img src="images/employees/${sessionScope.employee.photo }"
										alt="user">
								</div>
								<h3 class="m-b-0">
									<s:message code="employee.menu.info" />
								</h3>
								<p>${sessionScope.employee.nameEmployee }</p>
								<!--  -->
								<a href="employee/change-pass/${sessionScope.employee.id}.htm"
									class=" btn btn-primary btn-md btn-rounded"><s:message
										code="employee.home.changePass" /></a> <a
									href="employee/change-info/${sessionScope.employee.id}.htm"
									class=" btn btn-primary btn-md btn-rounded"><s:message
										code="employee.home.changeInfo" /></a>
								<!--  -->
								<hr>
								<div class="row text-center m-t-20">
									<div class="col-lg-2 col-md-3 m-t-20">
										<h3 class="m-b-0 font-light">
											<s:message code="employee.home.address" />
										</h3>
										<small>${sessionScope.employee.address }</small>
									</div>
									<div class="col-lg-2 col-md-3 m-t-20">
										<h3 class="m-b-0 font-light">
											<s:message code="employee.home.birthday" />
										</h3>
										<small><fmt:formatDate
												value="${sessionScope.employee.birthday}"
												pattern="dd/MM/yyyy" /></small>
									</div>
									<div class="col-lg-2 col-md-3 m-t-20">
										<h3 class="m-b-0 font-light">
											<s:message code="employee.home.gender" />
										</h3>
										<small><c:choose>
												<c:when test="${sessionScope.employee.gender < 2 }"> Nam </c:when>
												<c:when test="${sessionScope.employee.gender >= 2}"> Nữ </c:when>
											</c:choose></small>
									</div>
									<div class="col-lg-2 col-md-3 m-t-20">
										<h3 class="m-b-0 font-light">
											<s:message code="employee.home.numberPhone" />
										</h3>
										<small>${sessionScope.employee.numberPhone}</small>
									</div>
									<div class="col-lg-2 col-md-3 m-t-20">
										<h3 class="m-b-0 font-light">
											<s:message code="employee.home.department" />
										</h3>
										<small>${sessionScope.employee.department.nameDepartment }</small>
									</div>
									<div class="col-lg-2 col-md-3 m-t-20">
										<h3 class="m-b-0 font-light">
											<s:message code="employee.home.employeeType" />
										</h3>
										<small>${sessionScope.employee.employeeType.nameEmployeeType }</small>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>

			<!--  -->

			<!-- Start Page Content -->
			<div class="row">
				<!-- column -->
				<div class="col-lg-12">
					<div class="card">
						<div class="card-block">
							<h4 class="card-title">
								<s:message code="admin.home.list" />
							</h4>
						</div>
					</div>
				</div>


			</div>
			<!--  -->
			<!--  -->
			<div class="row">
				<c:forEach var="topEmpl" items="${topEmployee}">
					<div class="col-lg-2">
						<div class="card">
							<div class="card-block little-profile text-center">
								<img class="avatar border-white"
									src="images/employees/${topEmpl[2]}" height="100px"
									width="80px" style="border-radius: 40px" /><br>
								<h4 class="title">${topEmpl[1]}</h4>

								<span class="description text-center"> <s:message
										code="admin.home.achievements" /> : ${topEmpl[3]}
								</span> <br> <span class="description text-center"> <s:message
										code="admin.home.scores" /> : ${topEmpl[5]}
								</span> <br> <span class="description text-center"> <s:message
										code="admin.home.amount" /> : <fmt:formatNumber
										type="currency" value="${topEmpl[6]}" pattern="###,###,###" />
									VNĐ
								</span>
							</div>
						</div>
					</div>
					<br>
					<br>
				</c:forEach>
			</div>
			<!-- End PAge Content -->

			<!-- Thống Kê -->
<%-- 			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<div class="card-block">
								<h4 class="card-title">
									<s:message code="admin.home.report" />
								</h4>
							</div>
						</div>
						<div id="tabs">
							<ul>
								<li><a href="employee/home#tabs-1"><s:message
											code="revenue.byProduct" /> </a></li>
								<li><a href="employee/home#tabs-2"><s:message
											code="revenue.byCategory" /></a></li>
								<li><a href="employee/home#tabs-3"><s:message
											code="revenue.byProducer" /></a></li>
								<li><a href="employee/home#tabs-4"><s:message
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
				</div>
			</div> --%>
			<!--end thống kê  -->
		</div>
		<!-- End Container fluid  -->
		<!-- footer -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>
</html>