<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="${pageContext.servletContext.contextPath }/">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:message code="admin.employee.add" /></title>
</head>

<style type="text/css">
*[id$=errors] {
	color: red;
	font-style: italic;
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
								<div class="col-lg-12 col-md-10">
									<div class="card">
										<div class="header">
											<h4 class="title">
												<s:message code="admin.employee.add" />
											</h4>
										</div>
										<div class="content">

											<form action="admin/employee/save" method="POST"
												enctype="multipart/form-data">

												ID: <input id="id" name="id" type="text"/> 
												Email: <input id="email" name="email" type="text"/>
												Password: <input id="password" name="password" type="text"/> 
												NameEmployee: <input id="nameEmployee" name="nameEmployee" type="text"/>  
												Gender: <input id="gender" name="gender" type="text"/>  
												Address: <input id="address" name="address" type="text"/>  
												NumberPhone: <input id="numberPhone" name="numberPhone" type="text"/>  
												Birthday: <input id="birthday" name="birthday" type="text"/>  
												Access: <input id="access" name="access" type="text"/> 
												Photo: <input id="photo" name="photo" type="file"/> 
												Activated: <input id="activated" name="activated" type="text"/> 
												
												EmployeeType: <input id="employeeType" name="employeeType" type="text"/> 
												Department: <input id="department" name="department" type="text"/> 
												
												NameContract: <input id="nameContract" name="nameContract" type="text"/>
												Status: <input id="status" name="status" type="text"/>
												<br>
												<div class="text-center">
													<button type="submit"
														class="btn btn-danger btn-fill btn-wd">
														<s:message code="admin.employee.add" />
													</button>
												</div>
												<div class="clearfix"></div>
												<br>

											</form>

										</div>
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