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
<title>Edit Application</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<!-- <script type="text/javascript">
	$(function() {
		$('#pdept').change(
				function() {
					$.ajax("getProgforDept.html", {
						type : "GET",
						data : {
							deptName : $('#pdept').val()
						},
						dataType : "json",
						success : function(data) {
							$('#pprog').empty(); //remove all child nodes
							for ( var i in data) {
								//alert(data);
								var newOption = $('<option value="'+data[i]+'">'+ data[i] + '</option>');
								$('#pprog').append(newOption);
							}
						},
						error : function() {
							alert(error);
						}
					});
				});
	});
</script> -->

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
				<li class="active"><a href="/gapp/user/studentDetails.html" style="color: #EECD86"><span
						class="glyphicon glyphicon-home"></span><b>Home</b></a></li>
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
						<form:form modelAttribute="app">
							<div class="panel-heading">
								<div class="panel-title">
									<h2 style="color: Darkblue">
										<b>Application Form</b>
									</h2>
								</div>
							</div>

							<div class="panel-body">
								<table class="table table-hover">
									<tr>
										<th class="col-md-5">Department</th>
										<%-- <td>${dept.dept_name}</td> --%>
										 <td><form:input path="dept_id.dept_name"
												value="${dept.dept_name}" class="form-control" readonly="true" />
												
												<%-- <form:option value="NONE" label="--- Select ---"
													class="form-control" /> --%>
												<%-- <c:forEach items="${depts}" var="dept"> --%>
													<%-- <form:option path="dept_id.dept_name" value="${dept.dept_name}"
														class="form-control" readonly="true"/> --%>
												<%-- </c:forEach> 
											</form:select></td> --%>
									</tr>
									<tr>
										<th>Program</th>
										<td><form:select path="prog_id.prog_name"
												class="form-control">
												<%-- id="pprog" --%>
												<%-- <form:option value="prog_id.prog_name"
													<%-- label="--- Select ---" --%>
												<!-- class="form-control" />  -->
												<c:forEach items="${progs}" var="prog">
													<form:option path="${prog_id.prog_name}"
														value="${prog.prog_name}" itemValue="prog_id.prog_name"
														class="form-control" />
												</c:forEach>
											</form:select></td>

									</tr>
									<tr>
										<th>Term</th>
										<td><form:input path="term" class="form-control" /></td>
									</tr>

								</table>
							</div>
							<div class="panel-heading">
								<div class="panel-title" style="color: MediumVioletRed">
									<h3>Basic Information</h3>
								</div>
							</div>
							<div class="panel-body">
								<table class="table table-hover">
								<!-- <input type="hidden" id="id" name="id" />-->
									<tr> 
										<th class="col-md-5">First Name</th>
										<td><form:input path="firstName"
												 class="form-control" /></td>
									</tr>
									<tr>
										<th>Last Name</th>
										<td><form:input path="lastName"
												 class="form-control" /></td>
									</tr>
									<tr>
										<th>Email Id</th>
										<td><form:input path="emailId"
												 class="form-control" /></td>
									</tr>
									<tr>
										<th>CIN</th>
										<td><form:input path="CIN" class="form-control" /></td>

									</tr>
									<tr>
										<th>Phone No.</th>
										<td><form:input path="phoneNo" class="form-control" /></td>

									</tr>
									<tr>
										<th>Gender</th>
										<td><form:radiobutton path="gender" value="Male" /> Male 
										<form:radiobutton path="gender" value="Female" />
											Female</td>
										<!-- <td></td> -->
									</tr>
									<tr>
										<th>Date Of Birth</th>
										<td><form:input path="DateOfBirth" class="form-control" /></td>

									</tr>
									<tr>
										<th>Citizenship</th>
										<td><form:input path="citizenship" class="form-control" /></td>
									</tr>
									<tr>
										<th>International Student</th>
										<td><form:checkbox path="is_International" /></td>
									</tr>

								</table>
								<form:hidden path="record_id.id"  />
								<button type="submit" class="btn btn-success btn-block">
									<h4>
										<b>Save and Next <span
											class="glyphicon glyphicon-menu-right"></span>
										</b>
									</h4>
								</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</center>

</body>
</html>