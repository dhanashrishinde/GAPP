<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Edit Programs</title>
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
				<div class="col-md-offset-4 col-md-4">
					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4);">
						<div class="panel-heading">
							<div class="panel-title">
								<h2 style="color: #3D3242">
									<b>Edit Programs</b>
								</h2>
							</div>
						</div>
						<div class="panel-body">
							<form:form modelAttribute="deptPrograms">
								<div class="form-group form-inline">
									<label class="control-label" for="prog_name"><b><h4>Name
												:</h4></b></label>
									<form:input path="prog_name" class="form-control input-lg" />
								</div>
								<button type="submit" class="btn btn-success btn-block">
									<h4>
										<b>Save</b>
									</h4>
								</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%-- <div class="container">
					<h2>Edit Programs</h2>
					<form:form modelAttribute="deptPrograms">
						<div class="form-group">
							<label class="control-label col-sm-2" for="prog_name">Name</label>
							<form:hidden path="dept_id"/>
				<form:hidden path="id"/> 
							<form:input path="prog_name" />
						</div>
						<button type="submit" class="btn btn-success">Save</button>
					</form:form>
				</div> --%>
</body>
</html>