<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Login</title>
</head>
<body background="/gapp/images/book1.jpg" style="font-family: palatino;">
	<center>
		<nav class="navbar navbar-inverse nav-fixed-top"
			style="background-color:#7A3E48">
		<div class="container-fluid">
			<div class="navbar-header">
				<b><a class="navbar-brand" style="color: #E18942" href="#">GAPP</a></b>
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
		<div class="container">
			<!-- <img src="images/book.jpg" width="1200px" height="540px" /> -->


			<div class="container" align="center">
				<div class="row"></div>
				<div class="row">
					<div class="col-md-offset-4 col-md-4">
						<div class="panel panel-primary"
							style="background-color: rgba(245, 245, 245, 0.4); border-style: none">
							<div class="panel-body">

								<!-- <img src="/gapp/images/user-icon.png" class="img-circle"
									width="100" height="100"> -->
								<h4>
									<font face="verdana" style="color: #0080FF"><b>Sign
											in to continue with GAPP</b></font>
								</h4>
								<hr>
								<form:form modelAttribute="user" role="form">
									<div class="form-group ">
										<div class="input-group">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-user"></span>
											</div>
											<form:input path="email_id" placeholder="Email"
												class="form-control input-lg" />
										</div>
										<font color=red><form:errors path="email_id" /></font>

									</div>
									<div class="form-group ">
										<div class="input-group">
											<div class="input-group-addon">
												<span class="glyphicon glyphicon-lock"></span>
											</div>
											<form:input path="password" placeholder="Password"
												class="form-control input-lg" type="password" />
										</div>
										<font color=red><form:errors path="password" /></font>

									</div>
									<div class="form-group">
										<button type="submit" class=" form-control btn btn-success">Login</button>
									</div>
									<div class="form-group" align="center"
										style="font-family: verdana;">
										<a href="register.html"><b>Not a user?? Click to
												Register</b></a>
									</div>

								</form:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</center>
</body>
</html>
