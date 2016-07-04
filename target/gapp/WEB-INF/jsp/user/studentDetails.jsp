<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Application Details</title>

</head>
<body background="/gapp/images/book1.jpg" style="font-family: palatino;">
	<center>

		<nav class="navbar navbar-inverse nav-fixed-top"
			style="background-color:#7A3E48">
		<div class="container-fluid">
			<div class="navbar-header">
				<b style="color: #E18942"><a class="navbar-brand"
					style="color: #E18942" href="#">GAPP</a></b>
			</div>
			<ul class="nav navbar-nav" style="background-color: #B95835">
				<li class="active"><a href="/gapp/user/studentDetails.html" style="color: #EECD86"><span
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

			<h1 style="color: #335B96">
				<b>Welcome!!</b>
			</h1>
			<h2>Application Details of student</h2>

			<c:choose>
				<c:when test="${not empty user.applications}">

			<div class="container">
				<div class="col-md-offset-1 col-md-6">
					<h2 style="color: #0080FF">List of Applications</h2>
					<table class="table table-hover table-bordered table-striped"
						style="border-style: solid; border-color: #7A3E48;">
						<thead style="border-style: solid; border-color: #7A3E48;">
							<tr>
								<!-- <th>id</th> -->
								<th style="border-style: solid; border-color: #7A3E48;">Date
									Submitted</th>
								<th style="border-style: solid; border-color: #7A3E48;">Department</th>
								<th style="border-style: solid; border-color: #7A3E48;">Program</th>
								<th style="border-style: solid; border-color: #7A3E48;">Term</th>
								<th style="border-style: solid; border-color: #7A3E48;">Status</th>
								<th style="border-style: solid; border-color: #7A3E48;">Details</th>
								<th style="border-style: solid; border-color: #7A3E48;">Edit</th>
							</tr>
						</thead>

						<c:forEach items="${user.applications}" var="app">
							<tr style="border-style: solid; border-color: #7A3E48;">
								<td style="border-style: solid; border-color: #7A3E48;">${app.date_submitted}</td>
								<td style="border-style: solid; border-color: #7A3E48;">${app.dept_id.dept_name}</td>
								<td style="border-style: solid; border-color: #7A3E48;">${app.prog_id.prog_name}</td>
								<td style="border-style: solid; border-color: #7A3E48;">${app.term}</td>
								<c:set var="recent" value="-1" />
								<c:set var="statusValue" value="" />
								<c:forEach items="${app.status}" var="status">
									<c:choose>
										<c:when test="${recent eq -1}">
											<c:set var="recent" value="${status.time_stamp}" />
											<c:set var="statusValue" value="${status.status}" />
										</c:when>
										<c:when test="${recent < status.time_stamp}">
											<c:set var="recent" value="${status.time_stamp}" />
											<c:set var="statusValue" value="${status.status}" />
										</c:when>
									</c:choose>
								</c:forEach>
								<td style="border-style: solid; border-color: #7A3E48;">${statusValue}</td>
								<td style="border-style: solid; border-color: #7A3E48;"><a
									href="/gapp/user/applicationDetails.html?id=${app.id}">View</a></td>
								
								<td>
								
								<c:choose>
									<c:when test="${statusValue == 'Not Submitted'}">
										<a href="/gapp/application/editApplication.html?id=${app.id}">Edit</a>
										<!-- <p>Not Submitted</p> -->
									</c:when>
									<c:otherwise>
									    <!-- <a href="/gapp/user/studentDetails.html">Edit</a> -->
										<p>Submitted</p>
									</c:otherwise>
								</c:choose>
								
								</td>
							</tr>
						</c:forEach>
					</table>

					<a href="/gapp/application/application.html"
						class="btn btn-primary btn-lg ">Create New Application</a>
				</div>
			</div>
			</c:when>
				<c:otherwise>
				<h3>There are currently no Applications!!</h3>	
				<a href="/gapp/application/application.html"
						class="btn btn-primary btn-lg ">Create New Application</a>
				</c:otherwise>
			</c:choose>
		</div>
	</center>
</body>
</html>


