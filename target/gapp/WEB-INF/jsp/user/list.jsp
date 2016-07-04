<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> --%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
	integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd"
	crossorigin="anonymous"> -->
<title>User Management</title>
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
			<ul class="nav navbar-nav">
				<li><a href="/gapp/user/home.html" style="color: #EECD86">Admin</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.html" style="color: #EECD86"> <span
						class="glyphicon glyphicon-log-out"></span> Logout
				</a></li>
			</ul>
		</div>
		</nav>
		<div class="container">
			<div class="col-md-offset-1 col-md-6">
				<h2 style="color: #0080FF">User Management</h2>
				<table class="table table-hover table-bordered table-striped"
					style="border-style: solid; border-color: #7A3E48;">
					<thead style="border-style: solid; border-color: #7A3E48;">
						<tr>
							<!-- <th>id</th> -->
							<th style="border-style: solid; border-color: #7A3E48;">Firstname</th>
							<th style="border-style: solid; border-color: #7A3E48;">Lastname</th>
							<th style="border-style: solid; border-color: #7A3E48;">Email
								id</th>
						</tr>
					</thead>
					<c:forEach items="${users}" var="user">
						<tr style="border-style: solid; border-color: #7A3E48;">
							<%-- <td>${user.id}</td> --%>
							<td style="border-style: solid; border-color: #7A3E48;">${user.firstname}</td>
							<td style="border-style: solid; border-color: #7A3E48;">${user.lastname}</td>
							<td style="border-style: solid; border-color: #7A3E48;">${user.email_id}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<%-- <td>
<security:authorize access="hasRole('ROLE_ADMIN') or principal.username == '${user.username}'">
    <a href="view.html?id=${user.id}">Details</a>
    <a href="${user.id}.html">Details2</a>
    <a href="edit.html?id=${user.id}">Edit</a>
</security:authorize>
  </td> --%>
		<!-- <p><a href="add.html">Add A User</a></p> -->
	</center>
</body>
</html>
