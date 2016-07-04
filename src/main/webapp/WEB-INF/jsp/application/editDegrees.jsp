<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Edit Degree</title>
</head>
<body background="/gapp/images/book1.jpg"
	style="font-family: TimesNewRoman;">

	<center>

		<nav class="navbar navbar-inverse nav-fixed-top"
			style="background-color:#7A3E48">
		<div class="container-fluid">
			<div class="navbar-header">
				<b style="color: #E18942"><a class="navbar-brand"
					style="color: #E18942" href="#">GAPP</a></b>
			</div>
			<ul class="nav navbar-nav" style="background-color: #B95835">
				<li class="active"><a href="/gapp/user/studentDetails.html"
					style="color: #EECD86"><span class="glyphicon glyphicon-home"></span><b>Home</b></a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/gapp/user/logout.html" style="color: #EECD86">
						<span class="glyphicon glyphicon-log-out"></span> Logout
				</a></li>
			</ul>
		</div>
		</nav>

		<h1 style="color: #DF0101">
			<b>Graduate Program Applications<small style="color: #33966F">
					<b>CS520</b>
			</small></b>
		</h1>

		<div class="container" align="center">
			<div class="row">
				<div class="col-md-7">
					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: Darkblue">
									<b>Application Form</b>
								</h2>
							</div>
						</div>
						<div class="panel-heading">
							<div class="panel-title" style="color: MediumVioletRed">
								<h3>Educational Background</h3>
							</div>
						</div>
						<div class="panel-body">
						
							<c:choose>
								<c:when test="${not empty app.degrees}">
								
									<table class="table table-hover table-bordered">
										<thead style="border-color: black;">
											<tr>

												<th>College/University Name</th>
												<th>Time Period : From</th>
												<th>To</th>
												<th>Degree</th>
												<th>Major/Field of Degree</th>
												<th>Delete</th>

											</tr>
										</thead>


										<c:forEach items="${app.degrees}" var="degree">
											<tr>
												<td>${degree.collegeUniv_name}</td>
												<td>${degree.date_start}</td>
												<td>${degree.date_end}</td>
												<td>${degree.degree_name}</td>
												<td>${degree.major_name}</td>
												<td><a
													href="/gapp/application/removeDegrees.html?id1=${app.id}&id2=${degree.id}">
														<span class="glyphicon glyphicon-trash"></span>
												</a></td>
											</tr>
										</c:forEach>

									</table>
								</c:when>
								<c:otherwise>
									<h4>There are currently no Degrees!!</h4>
								</c:otherwise>
							</c:choose>
							<br/>
							<a href="editAddDegrees.html?app_id=${app.id}"
								class="btn btn-danger btn-lg "><b>Add degree</b></a> 
								<%-- <a href="editRecords.html?app_id=${app.id}&id2=${app.record_id.id}"
								class="btn btn-primary btn-lg "> <b> Next <span
									class="glyphicon glyphicon-menu-right"></span>
							</b>
							</a> --%>
							<a href="editAddRequirement.html?app_id=${app.id}"
								class="btn btn-primary btn-lg "> <b> Next <span
									class="glyphicon glyphicon-menu-right"></span>
							</b>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</center>

</body>
</html>