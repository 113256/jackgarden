<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/allpages.css">
<title>Insert title here</title>
</head>
<body>

<!--navbar -->
	<div style="">
		<div class="navbar navbar-inverse navbar-fixed-top">
			<!--navbar-static-top will make it disappear if you scroll horizontally -->
			<div class="container">
				<!--navbar-brand is used for titles - it has larger text -->

				<a href="home" class="navbar-brand">Gardener Website</a>

				<!-- button
            this button will appear if screen collapses (smaller screen)
            -->
				<button class="navbar-toggle" data-toggle="collapse"
					data-target=".navHeaderCollapse">
					<span class="glyphicon glyphicon-th-list"></span>
				</button>

				<div class="collapse navbar-collapse navHeaderCollapse">`
					<!--navbar-nav gives styling and navbar-right aligns it to the right-->
					<ul class="nav navbar-nav navbar-right">
						<c:choose>


							<c:when test="${empty sessionScope.user}">

								<li class="dropdown"><a class="dropdown-toggle" href=""
									data-toggle="dropdown" id="loginDropdown">Sign In <strong class="caret"></strong></a>

									<div class="dropdown-menu"
										style="padding: 10px; min-width: 240px;">


										<form action="${pageContext.request.contextPath}/login" method="post" role="form"
											class="form-horizontal">

											<input class="form-control" id="inputUsername"
												name="inputUsername" placeholder="Username" type="text"
												style="margin-bottom: .5em"> <input
												class="form-control" id="inputPassword" name="inputPassword"
												placeholder="Password" type="password"
												style="margin-bottom: .5em">
											<c:if test="${!empty requestScope.loginError}">
												<div class="error">${requestScope.loginError}</div>

											</c:if>

											<div class="checkbox">
												<label><input type="checkbox"> Remember me</label>
											</div>


											<input class="btn btn-primary"
												style="margin-top: .75em; width: 100%; height: 32px; font-size: 13px;"
												type="submit" name="commit" value="Sign In">
										</form>


									</div></li>
								<li class=""><a class="" href="Register">Register</a></li>
								<li class=""><a class="" href="findGardener">Find a gardener</a></li>
							</c:when>
							<c:otherwise>
								<li class=""><a class="" href="#">${sessionScope.user.username}</a></li>
								<li class="dropdown"><a class="dropdown-toggle" href=""
									data-toggle="dropdown">My Account <strong class="caret"></strong></a>

									<ul class="dropdown-menu">
										<li><a href="details">My details</a></li>
										<c:if test="${sessionScope.user.gardener}">
											<li><a href="showProfile?id=${sessionScope.user.autoIncrementID}">My profile</a></li>
											<li><a href="profile">Edit profile</a></li>
											<li><a href="photos">My photos</a></li>
											
										</c:if>
									</ul></li>
									
								<li class=""><a class="" href="logout">Logout</a></li>
							</c:otherwise>
						</c:choose>
						<li class=""><a class="" href="faq">FAQ</a></li>
					</ul>
				</div>

			</div>
			
		</div>
	</div>
	<!--end navbar-->

	<div class="register">
	<h1>Register Account
	</h1>

			<c:if test="${fn:length(errors) > 0}">
				<div class="error">
					<ul>
						<c:forEach items="${errors}" var="error">
							<li>${error}</li>
						</c:forEach>
					</ul>
				</div>
			</c:if>



		<form role="form" action="Register" method="post">
			<div class="form-group">
				<label for="username">Username:</label> <input type="text"
					class="form-control" id="username" name="username"
					placeholder="Enter username" value="${requestScope.user.username}">
			</div>
			<div class="form-group">
				<label for="email">Email Address:</label> <input type="email"
					class="form-control" id="email" name="email"
					placeholder="Enter email" value="${requestScope.user.email}">
			</div>
			<div class="form-group">
				<label for="password1">Password:</label> <input type="password"
					class="form-control" id="password1" name="password1"
					placeholder="Password">
			</div>
			<div class="form-group">
				<label for="password2">Repeat Password:</label> <input type="password"
															   class="form-control" id="password2" name="password2"
															   placeholder="Repeat Password">
			</div>
			
			<div class="alert alert-danger" role="alert">
			  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			  <span class="sr-only">Error:</span>
			  If you are a gardener looking to advertise your services please select the second option.
			</div>

			<label>Account Type:</label>
			<div class="radio ">
				<label> <input type="radio" name="accountTypeRadios"
					value="gardenOwner" <c:if test="${empty requestScope.user.accountType or requestScope.user.accountType== 'gardenOwner'}">checked</c:if>> I am a a Garden owner Looking
					for a Gardener
				</label>
			</div>
			<div class="radio">
				<label> <input type="radio" name="accountTypeRadios"
					value="gardener" <c:if test="${ requestScope.user.accountType== 'gardener'}">checked</c:if>> I am a Gardener wishing to advertise my
					services here
				</label>
			</div>

			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					class="form-control" id="firstName" name="firstName"
					placeholder="Enter first name" value="${requestScope.user.firstName}">
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					class="form-control" id="lastName" name="lastName"
					placeholder="Enter last name" value="${requestScope.user.lastName}">
			</div>
			<div class="form-group">
				<label for="house">House Number or Name:</label> <input type="text"
					class="form-control" id="house" name="house"
					placeholder="Enter house number \ name" value="${requestScope.user.houseNumberName}">
			</div>
			<div class="form-group">
				<label for="street">Street Name:</label> <input type="text"
					class="form-control" id="street" name="street"
					placeholder="Enter street name" value="${requestScope.user.street}">
			</div>
			<div class="form-group">
				<label for="postCode">Post Code:</label> <input type="text"
					class="form-control" id="postCode" name="postcode"
					placeholder="Enter post code" value="${requestScope.user.postcode}">
			</div>
			<div class="form-group">
				<label for="phone">Phone Number:</label> <input type="text"
																class="form-control" id="phone" name="phone"
																placeholder="Enter post code" value="${requestScope.user.phone}">
			</div>
			<%--<div class="form-group">
				<label for="county">Select County:</label> <select class="form-control"
					id="county" name="county" value="">
					<c:choose>

					</c:choose>
					<option selected value="0">...</option>

				<c:forEach items="${counties}" var="county">
					<c:choose>

						<c:if test="${requestScope.user.county = county.id}">
						</c:if>
						<c:otherwise>
							<option selected value="${requestScope.user.county}">...</option>
						</c:otherwise>
					</c:choose>
						<option value="${county.id}">${county.name}</option>
					</c:forEach>
					
				</select>
			</div>--%>


			<button type="submit" class="btn btn-default">Submit</button>
		</form>
	</div>
	<!-- jquery-->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<!-- javascript-->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>


	<!-- Scrolling Nav JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolling-nav.js"></script>

</body>
</html>