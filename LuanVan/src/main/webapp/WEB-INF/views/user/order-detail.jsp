<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="${pageContext.servletContext.contextPath }/" />
<meta charset="utf-8">
<title>Website Bán Hàng Online</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<jsp:include page="menu.jsp"></jsp:include>
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="user/home">Home</a> <span class="divider">/</span></li>
						<li class="active">OrderDetail List</li>
					</ul>
					<h3>Order List</h3>
					<label class="error">
						<h5>${status_order}</h5>
						<h4 style="color: green">-Tổng đơn hàng  của bạn là : <f:formatNumber value="${totally}" pattern="###,###" />
								VNĐ
						</h4>
					</label>

					<div class="well">
						<form:form modelAttribute="order">
							<div class="control-group">
								<label class="control-label">Id Order:</label>
								<div class="controls">
									<form:input path="id" class="form-control valid"
										placeholder="Mã hóa đơn" type="text" readonly="true" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Order Date: </label>
								<div class="controls">
									<form:input path="orderDate" class="form-control valid"
										placeholder="Order Date" readonly="true" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Require Date: </label>
								<div class="controls">
									<form:input path="requireDate" class="form-control valid"
										placeholder="Require Date" readonly="true" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Receiver: </label>
								<div class="controls">
									<form:input path="receiver" class="form-control valid"
										placeholder="Require Date" readonly="true" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Number Phone: </label>
								<div class="controls">
									<form:input path="numberPhone" class="form-control valid"
										placeholder="Number Phone" readonly="true" />
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Amount: </label>
								<div class="controls">
									<form:input style="width:300px" path="amount"
										class="form-control valid" placeholder="Amount"
										readonly="true" pattern="###,###" />
								</div>
							</div>



						</form:form>
					</div>

					<div class="btn btn-warning pull-right">

						<h4 style="text-align: right">
							<span id="cart-count">Totally</span>
							<h3>
								<f:formatNumber value="${totally}" pattern="###,###" />
								VNĐ

							</h3>
						</h4>

					</div>

					<%-- <h3>
						<f:formatNumber value="${totally}" pattern="###,###" />
						VNĐ

					</h3> --%>


					<%-- <c:forEach var="d" items="${detail}">
					
					
					
					<f:formatNumber value="${d.amount*d.quantity*(1-d.discount)}"
											pattern="###,###" /> VNĐ</td>
					</c:forEach>
					
					<f:formatNumber value="${totally}" pattern="###,###" /> VNĐ
					 --%>
					<hr class="soft">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID Product</th>
								<th>Product</th>
								<th>Photo</th>
								<th>Amount</th>
								<th>Discount</th>
								<th>Quantity</th>
								<th>Total</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="d" items="${detail}">
								<tr>
									<td>${d.product.id}</td>
									<td>${d.product.nameProduct}</td>
									<td><img src="images/products/${d.product.photo }"
										style="border-radius: 20px" width="120px" height="100px" /></td>
									<td><f:formatNumber value="${d.amount }" pattern="###,###" />
										VNĐ</td>
									<td><c:choose>
											<c:when test="${d.discount == null}">0%</c:when>
											<c:when test="${d.discount == 0}">0%</c:when>
											<c:otherwise>
												<f:formatNumber value="${d.discount }" type="percent" />
											</c:otherwise>
										</c:choose></td>
									<td>${d.quantity}</td>
									<td><f:formatNumber
											value="${d.amount*d.quantity*(1-d.discount)}"
											pattern="###,###" /> VNĐ</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</div>


	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>



</html>