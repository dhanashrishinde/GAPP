<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Users</title>
</head>
<body background="/gapp/images/book1.jpg">
	<center>

		<nav class="navbar navbar-inverse nav-fixed-top"
			style="background-color:#7A3E48">
		<div class="container-fluid">
			<div class="navbar-header">
				<b style="color: #E18942"><a class="navbar-brand"
					style="color: #E18942" href="#">GAPP</a></b>
			</div>
			<ul class="nav navbar-nav" style="background-color: #B95835">
				<li class="active"><a href="/gapp/" style="color: #EECD86"><span
						class="glyphicon glyphicon-home"></span>Home</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.html" style="color: #EECD86"> <span
						class="glyphicon glyphicon-log-out"></span> Logout
				</a></li>
			</ul>
		</div>
		</nav>
		<div class="container">
			<div class="col-md-offset-3 col-md-6">
				<h2 style="color: #3D3242">User Details</h2>
				<table class="table table-hover table-bordered"
					style="border-style: solid; border-color: #7A3E48;">
					<thead class="table table-primary"
						style="border-style: solid; border-color: #7A3E48;">

						<tr>
							<th style="border-style: solid; border-color: #7A3E48;">ID</th>
							<th style="border-style: solid; border-color: #7A3E48;">Firstname</th>
							<th style="border-style: solid; border-color: #7A3E48;">Lastname</th>
							<th style="border-style: solid; border-color: #7A3E48;">No.
								of applications</th>
						</tr>
						<tr>
							<td style="border-style: solid; border-color: #7A3E48;">${users.id}</td>
							<td style="border-style: solid; border-color: #7A3E48;">${users.firstname}</td>
							<td style="border-style: solid; border-color: #7A3E48;">${users.lastname}</td>
							<td style="border-style: solid; border-color: #7A3E48;">${users.applications.size()}</td>
						</tr>
				</table>
			</div>
		</div>
	</center>
</body>
</html>