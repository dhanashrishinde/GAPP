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
<title>Add Additional Requirements</title>
<script type="text/javascript">
	function isNumber() {
		var val = isNaN(document.getElementById("fieldVal").value);
		//alert(val);
		if (val) {
			document.getElementById("notNumber").innerHTML = "Please enter valid number";
			return false;
		}
	}
</script>
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
						<c:choose>
							<c:when test="${not empty addInfos}">
								<div class="panel-heading">
									<div class="panel-title" style="color: MediumVioletRed">
										<h3>Additional Requirements</h3>
									</div>
								</div>

								<div class="panel-body">
									<c:set var="incr" value="0" />
									<c:set var="noIncrement" value="0" />
									<c:set var="stringIncr" value="0" />
									<form:form modelAttribute="addInfoValue"
										enctype="multipart/form-data" onsubmit="return isNumber()">

										<table class="table table-hover">

											<c:set var="flag" value="false"></c:set>
											<c:forEach items="${addInfos}" var="addInfo">
												<c:set var="decr" value="0" />
												<tr>
													<th class="col-md-5">${addInfo.field_name}</th>
													<c:set var="counter" value="0" />
													<c:forEach items="${addInfoValue}" var="infoValue"
														varStatus="i">
														<c:if test='${incr eq decr }'>
															<c:if test='${counter eq 0 }'>
																<c:choose>
																	<c:when test="${addInfo.field_type eq 'File'}">

																		<c:set var="flag" value="true"></c:set>
																		<c:set var="counter" value="1" />
																		<td>${infoValue.extraFileName}<input type="file"
																			id="file" name="file" /></td>

																	</c:when>

																	<c:when test="${addInfo.field_type eq 'Number'}">
																		<c:set var="counter" value="1" />
																		<td><input type=text
																			value="${infoValue.field_value}"
																			name="fieldVal${noIncrement}" id="fieldVal"
																			class="form-control" /> <font color=red><span
																				id="notNumber"></span></font> <c:set var="noIncrement"
																				value="${noIncrement+1 }" /></td>

																	</c:when>
																	<c:otherwise>
																		<td><input type=text
																			value="${infoValue.field_value}"
																			name="fieldValString${stringIncr}" class="form-control" />
																			 <c:set var="stringIncr" value="${stringIncr+1 }" /></td>
																		<c:set var="counter" value="1" />
																	</c:otherwise>

																</c:choose>
															</c:if>
														</c:if>
														<c:if test='${not (incr eq decr) }'>
															<c:set var="decr" value="${decr+1 }" />
														</c:if>
													</c:forEach>
												</tr>
												<c:set var="incr" value="${incr+1 }" />
											</c:forEach>
											
										</table>

										<c:choose>
											<c:when test="${flag eq true}">
												<button type="submit" class="btn btn-primary btn-lg "
													name="fileType" value="fileType">Save and Next</button>
											</c:when>
											<c:otherwise>
												<button type="submit" class="btn btn-primary btn-lg "
													name="stringType" value="stringType">Save and Next</button>
											</c:otherwise>
										</c:choose>
									</form:form>

								</div>
							</c:when>
							<c:otherwise>
								<h4>There are no additional requirements!!</h4>
								<a href="editRecords.html?app_id=${app.id}"
									class="btn btn-primary btn-lg "> <b> Next </b>
								</a>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>

	</center>

</body>
</html>