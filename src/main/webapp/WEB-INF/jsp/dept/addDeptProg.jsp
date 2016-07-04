<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<title>Add Programs</title>
</head>
<body background="/gapp/images/book1.jpg"
	style="font-family: Times New Roman;">
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

		<div class="container">
			<div class="row">
				<div class="col-md-offset-4 col-md-4">
					<div class="panel"
						style="background-color: rgba(255, 255, 255, 0.4);">
						<div class="panel-heading">
							<div class="panel-title" align="center">
								<h2 style="color: #3D3242">
									<b>Add Program</b>
								</h2>
							</div>
						</div>
						<div class="panel-body">

							<form:form modelAttribute="deptPrograms">
								<div class="form-group form-inline">
									<label class="control-label" for="prog_name"><h4>
											<b>Name :</b>
										</h4> </label>
									<form:input path="prog_name" class="form-control input-lg" />
								</div>

								<button type="submit" class="btn btn-success btn-lg " name="add"
									value="add">Add</button>
								<button type="submit" class="btn btn-primary btn-lg "
									name="save" value="save">Save & Next</button>
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</center>
</body>
</html>