<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<div class="sidebar" data-background-color="while"
	data-active-color="danger">

	<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

	<div class="sidebar-wrapper">
		<div class="logo">
			<a style="color: #EB5E28; font-weight: bold;"
				href="http://www.facebook.com/HieuDTPH04388" target="blank"
				class="simple-text">Admin Home</a>
		</div>

		<ul class="nav" style="color: #EB5E28">
			<li style="color: #EB5E28"><a href="admin/home" class="active">
					<i class="ti-panel"></i>
					<p>
						<s:message code="admin.menu.home" />
					</p>
			</a></li>
			<li><a href="admin/account"> <i class="ti-user active"></i>
					<p>
						<s:message code="admin.menu.account" />
					</p>
			</a></li>
			<li><a href="admin/employee"> <i class="ti-view-list-alt"></i>
					<p>
						<s:message code="admin.menu.employee" />
					</p>
			</a></li>
			<li><a href="admin/contract"> <i class="ti-text"></i>
					<p>
						<s:message code="admin.menu.contract" />
					</p>
			</a></li>
			<li><a href="admin/bonus/report"> <i class="ti-pencil-alt2"></i>
					<p>
						<s:message code="admin.bonus.list" />
					</p>
			</a></li>
			</li>
			<li><a href="admin/product"> <i class="ti-dropbox-alt"></i>
					<p>
						<s:message code="admin.menu.product" />
					</p>
			</a></li>
			<li><a href="admin/orderDetail"> <i class="ti-map"></i>
					<p>
						<s:message code="admin.menu.od" />
					</p>
			</a></li>
			<li><a href="admin/inventory"> <i class="ti-receipt"></i>
					<p>
						<s:message code="admin.menu.inventory" />
					</p>
			</a></li>
			<%-- <li><a href="admin/revenue"> <i class="ti-bell"></i>
					<p>
						<s:message code="admin.menu.report" />
					</p>
			</a></li> --%>
			<%-- <li class="active-pro"><a
				href="http://facebook.com/HieuDTPH04388" target="blank"> <i
					class="ti-export"></i>
					<p>
						<s:message code="admin.menu.contact" />
					</p>
			</a></li> --%>
		</ul>
	</div>
</div>