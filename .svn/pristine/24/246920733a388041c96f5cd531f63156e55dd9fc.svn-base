<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Registration</title>
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
				<li class="active"><a href="/gapp/" style="color: #EECD86"><span
						class="glyphicon glyphicon-home"></span><b>Home</b></a></li>
			</ul>
		</div>
		</nav>
		<h1 style="color: #DF0101">
			<b>Graduate Program Applications<small style="color: #33966F">
					<b>CS520</b> </small></b>
		</h1>
		<div class="container" align="center">
			<div class="row"></div>
			<div class="row">
				<div class="col-md-offset-4 col-md-4">
					<div class="panel panel-primary"
						style="background-color: rgba(255, 255, 255, 0.4); border-style: none">
						<div class="panel-body">

							<!-- <img src="/gapp/images/user-icon.png" class="img-circle"
									width="100" height="100"> -->
							<h2 style="color: #0080FF"><b>Register</b>
							</h2>
							<hr>
							<form:form modelAttribute="user">
								<div class="form-group">
									<form:input path="firstname" placeholder="First Name"
										class="form-control input-lg" />
									<font color=red><form:errors path="firstname" /></font>
								</div>
								<div class="form-group">
									<form:input path="lastname" placeholder="Last Name"
										class="form-control input-lg" />
									<font color=red><form:errors path="lastname" /></font>
								</div>
								<div class="form-group">
									<form:input path="email_id" placeholder="Email id"
										class="form-control input-lg" />
									<font color=red><form:errors path="email_id" /></font>
								</div>
								<div class="form-group">
									<form:input path="password" placeholder="Password"
										class="form-control input-lg" type="password" />
									<font color=red><form:errors path="password"
											style="font:color=red" /></font>
								</div>
								<div class="form-group">
									<button type="submit" class=" form-control btn btn-success">Submit</button>
								</div>
								<div class="form-group" align="center"
									style="font-family: verdana;">
									<a href="login.html"><b>Already a user?? Click to Login</b></a>
								</div>

							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</center>
	<%-- <form:form modelAttribute="user">
First name: <form:input path="firstname" /> <br /> 
Last name: <form:input path="lastname" /> <br />
Email id: <form:input path="email_id" /> <br />
Password: <form:input path="password" /> <br />
<input type="submit" name="submit" value="submit" /> <br />
</form:form>--%>

</body>
</html>
