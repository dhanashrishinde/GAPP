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
<title>Application</title>
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


		<div class="container" align="center">
			<div class="row">
				<div class="col-md-7">
					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: #DF0101">
									<b>Application Details</b>
								</h2>
							</div>
						</div>

						<div class="panel-body">
							<table class="table table-hover">
								<tr>
									<th>Department Name</th>
									<td>${app.dept_id.dept_name}</td>
								</tr>
								<tr>
									<th>Program Name</th>
									<td>${app.prog_id.prog_name}</td>
									<th>Term</th>
									<td>${app.term}</td>
								</tr>
							</table>
						</div>

					</div>

					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: #DF0101">
									<b>Basic Information</b>
								</h2>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-hover">

								<tr>
									<th>First Name</th>
									<td>${app.firstName}</td>
								</tr>
								<tr>
									<th>Last Name</th>
									<td>${app.lastName}</td>
								</tr>
								<tr>
									<th>Email Id</th>
									<td>${app.emailId}</td>
								</tr>
								<tr>
									<th>CIN</th>
									<td>${app.CIN}</td>
								</tr>
								<tr>
									<th>Phone No.</th>
									<td>${app.phoneNo}</td>
								</tr>
								<tr>
									<th>Gender</th>
									<td>${app.gender}</td>
								</tr>
								<tr>
									<th>Date Of Birth</th>
									<td>${app.dateOfBirth}</td>
								</tr>
								<tr>
									<th>Citizenship</th>
									<td>${app.citizenship}</td>
								</tr>

							</table>
						</div>
					</div>

					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: #DF0101">
									<b>Educational Background</b>
								</h2>
							</div>
						</div>
						<div class="panel-body">

							<c:choose>
								<c:when test="${not empty app.degrees}">

									<table class="table table-hover table-bordered "
										style="border-style: solid;" style="border-color: black;">
										<thead style="border-color: black;">
											<tr>

												<th>College/University Name</th>
												<th>Time Period : From</th>
												<th>To</th>
												<th>Degree</th>
												<th>Major/Field of Degree</th>
											</tr>
										</thead>

										<c:forEach items="${app.degrees}" var="degree">
											<tr>
												<td>${degree.collegeUniv_name}</td>
												<td>${degree.date_start}</td>
												<td>${degree.date_end}</td>
												<td>${degree.degree_name}</td>
												<td>${degree.major_name}</td>
											</tr>
										</c:forEach>

									</table>
								</c:when>
								<c:otherwise>
									<h4>There are currently no Degrees!!</h4>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: #DF0101">
									<b>Academic Records</b>
								</h2>
							</div>
						</div>
						<div class="panel-body">
							<table class="table table-hover">

								<tr>
									<th>TOEFL Score</th>
									<td>${app.record_id.toefl_score}</td>
								</tr>
								<tr>
									<th>GRE Score</th>
									<td>${app.record_id.gre_score}</td>
								</tr>
								<tr>
									<th>GPA</th>
									<td>${app.record_id.gpa}</td>
								</tr>
								<tr>
									<th>Transcript</th>
									<td><a href="download.html?id=${app.record_id.id}">${app.record_id.fileName}</a></td>
								</tr>

							</table>
						</div>
					</div>

					<c:if test="${not empty app.dept_id.add_info}">
						<div class="panel"
							style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
							<div class="panel-heading">
								<div class="panel-title">
									<h2 style="color: #DF0101">
										<b>Additional Requirements</b>
									</h2>
								</div>
							</div>

							<div class="panel-body">
								<c:set var="count" value='0' />
								<table class="table table-hover">

									<thead style="border-color: black;">
										<tr>
											<!-- <th>id</th> -->
											<c:forEach items="${app.dept_id.add_info}" var="addinfo">
												<th>${addinfo.field_name}</th>
											</c:forEach>
										</tr>
									</thead>
									<tr>
										<c:forEach items="${app.add_field_value}" var="fvalue">

											<c:choose>

												<c:when
													test="${app.dept_id.add_info[count].field_type eq 'File'}">

													<td><a
														href="/gapp/application/downloadAddRequirements.html?id=${fvalue.id}">${fvalue.extraFileName}</a></td>

												</c:when>
												<c:otherwise>

													<%-- <c:forEach items="${app.add_field_value}" var="fvalue"> --%>
													<td>${fvalue.field_value}</td>
													<%-- </c:forEach> --%>

												</c:otherwise>

											</c:choose>

											<c:set var="count" value='${count+1 }' />
										</c:forEach>
									</tr>
								</table>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>

	</center>
</body>
</html>