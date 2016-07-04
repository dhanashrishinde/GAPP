<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Department Details</title>
<style>
th {
	font-size: 20px
}

td {
	font-size: 15px
}
</style>
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
				<li class="active"><a href="/gapp/user/home.html" style="color: #EECD86"><span
						class="glyphicon glyphicon-home"></span>Home</a></li>
			</ul>
			<ul class="nav navbar-nav">
				<li><a href="dlist.html" style="color: #EECD86"> Department
				</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/gapp/user/logout.html" style="color: #EECD86">
						<span class="glyphicon glyphicon-log-out"></span> Logout
				</a></li>
			</ul>
		</div>
		</nav>

		<div class="container" align="center">
			<div class="row">
				<div class="col-md-7">
					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: #DF0101">
									<b>Department Details</b>
								</h2>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<th>Department Name</th>
									<td>${dept.dept_name}</td>
									<td></td>
									<td><a href="/gapp/dept/editDept.html?id=${dept.id}">Edit</a></td>
								</tr>
							</table>
						</div>
					</div>

					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: #DF0101">
									<b>Additional Information Required</b>
								</h2>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead style="border-color: black;">
									<tr>
										<!-- <th>id</th> -->
										<th>Field Name</th>
										<th>Field Type</th>
										<th>Required id</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<c:forEach items="${dept.add_info}" var="info">
									<tr>
										<%-- <td>${user.id}</td> --%>
										<td>${info.field_name}</td>
										<td>${info.field_type}</td>
										<td>${info.required}</td>
										<td><a
											href="/gapp/dept/editAddInfo.html?id1=${dept.id}&id2=${info.id}">Edit</a></td>
										<td><a
											href="/gapp/dept/removeAddInfo.html?id1=${dept.id}&id2=${info.id}">
												<span class="glyphicon glyphicon-trash"></span>
										</a></td>
									</tr>
								</c:forEach>

							</table>

							<a href="/gapp/dept/addInfo.html?id=${dept.id}"
								class="btn btn-danger btn-lg btn-block">Add additional
								requirement</a>

						</div>
					</div>
				</div>
				<div class="col-md-5">
					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: #DF0101">
									<b>Programs Offered</b>
								</h2>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead style="border-color: black;">
									<tr>
										<!-- <th>id</th> -->
										<th>Program Name</th>
									<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<c:forEach items="${dept.programs}" var="prog">
									<tr>
										<%-- <td>${user.id}</td> --%>
										<td>${prog.prog_name}</td>

										<td><a
											href="/gapp/dept/editPrograms.html?id1=${dept.id}&id2=${prog.id}">Edit</a></td>
										<td><a
											href="/gapp/dept/removePrograms.html?id1=${dept.id}&id2=${prog.id}">
												<span class="glyphicon glyphicon-trash"></span>
										</a></td>
									</tr>
								</c:forEach>
							</table>
							<a href="/gapp/dept/addPrograms.html?id=${dept.id}"
								class="btn btn-danger btn-lg btn-block">Add Programs</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</center>
</body>
</html>