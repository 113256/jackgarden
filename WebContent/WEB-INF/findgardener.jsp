<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="generator" content="Bootply" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/allpages.css">
<title>Find a gardener</title>

<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/map.js"></script>
		<script>
			google.maps.event.addDomListener(window, 'load', initialize);
		</script>

</head>
<body data-loginerror="<c:if test="${!empty requestScope.loginError}">loginError</c:if>">


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





<section id="findGardener" class="bg-light-gray">
    <div class="container">
		<br><br><br>

		<h1>FIND A GARDENER</h1>
		
		 <div class="panel-body" style="font-size:20px">
			 
			  <span class="glyphicon glyphicon-ok"></span> We have registered professionals with a wide range of skills<br>
			  <span class="glyphicon glyphicon-ok"></span> View professionals who work in your area.<br>
			  <span class="glyphicon glyphicon-ok"></span> View detailed profiles and user feedback to help you decide who to hire.<br>
			 <br>
			 </div>
		
		
		<form role="form" action="" method="post">
		<h3>Looking for a particular gardener? Enter their name below.</h3>
			<div class="form-group">
				<input type="text" class="form-control" name="searchterm"
					placeholder="Enter the gardener's name here" required>
			</div>
			 <input type="submit" name="searchbyname" value="Search" />

		</form>
		
		
		<h3>Find gardeners near me</h3>
		<form role="form" action="" method="post">
		
		
		<div class = "row">
			<div class = "col-lg-6">
				<div class="form-group">
					<label>Location</label>
					<input id="pac-input" class="form-control" name="Location"
							type="text"
							placeholder="Enter a location and the details will be filled in"
							required>
				</div>
			
			
					
				<div class = "form-inline">
					
					<input type = "hidden" id="Latitude" class="form-control" name="Latitude" style = "width:30%"
								readonly />
					
					<input type = "hidden" id="Longitude" class="form-control" name="Longitude" style = "width:30%"
								readonly />
				</div>
			</div>
			<div class = "col-lg-6">
				
			  <h4 >
			   Advanced Search
				
				
			  </h4>
			  
					   <label>Show Only If They Have The Following Qualifications:</label>
		   <div class="form-group">
				<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked> Holds RHS Level 1 Certificate
				</label>
				
				<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked> Holds RHS Level 2 Certificate
				</label>
				
				<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked> Holds RHS Level 3 Certificate
				</label>
				
				<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked> Holds RHS Master Certificate
				</label>
				
			
				
			</div>
		   
		   <label>What Type of Service are you looking for?</label>
		   
		   <div class="form-group">
				<select class="form-control" name="" >
					  <option value="" disabled selected>Select your option</option>
					  <option value="">Lawn and General Maintenance</option>
					  <option value="">Garden Design</option>
					  <option value="">Tree Surgery</option>
					  <option value="">Water Features</option>
					  <option value="">Fencing</option>
					  <option value="">Paving</option>
					  <option value="">Decking</option>
				</select>
			</div>
			
			 <label>Show only if</label>
			<div class="form-group">
			<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked	> Has a profile photo
				</label>
			</div>	
		   
			</div>
			
			  
			 
			
		</div>
			
				
			
				
			
			
			
	
			<!--maprow-->
			
			
		   <br><br><br>
		   
		   <!--  
		<div class="panel-group" id="accordionb">	
		<div class="panel panel-default" id="gardener">
			<div class="panel-heading">
			  <h4 class="panel-title">
			   Advanced Search
				<a data-toggle="collapse" data-parent="#accordionb"
								href="#collapse1b">
				 <span class="glyphicon glyphicon-chevron-down pull-right"></span>
				</a>
				
			  </h4>
			</div>
			<div id="collapse1b" class="panel-collapse collapse ">
			  <div class="panel-body">
					   <label>Show Only If They Have The Following Qualifications:</label>
		   <div class="form-group">
				<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked> Holds RHS Level 1 Certificate
				</label>
				
				<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked> Holds RHS Level 2 Certificate
				</label>
				
				<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked> Holds RHS Level 3 Certificate
				</label>
				
				<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked> Holds RHS Master Certificate
				</label>
				
			
				
			</div>
		   
		   <label>What Type of Service are you looking for?</label>
		   
		   <div class="form-group">
				<select class="form-control" name="" >
					  <option value="" disabled selected>Select your option</option>
					  <option value="">Lawn and General Maintenance</option>
					  <option value="">Garden Design</option>
					  <option value="">Tree Surgery</option>
					  <option value="">Water Features</option>
					  <option value="">Fencing</option>
					  <option value="">Paving</option>
					  <option value="">Decking</option>
				</select>
			</div>
			
			 <label>Show only if</label>
			<div class="form-group">
			<label class="checkbox-inline">
				<input id="" type="checkbox" name="filter" value="" checked	> Has a profile photo
				</label>
			</div>	
		   
			 </div>
			</div>
		</div>
		</div>-->
		    <input type="submit" name="searchbypos" value="Search" />
		
		   
		   </form>
     </div>
     <div id="map-canvas" style="margin-right:10vw; margin-left:10vw">
</section>








<div style="margin-bottom:100px">
			<br>
		</div>
		<!-- jquery-->
		<script src="resources/js/jquery-1.11.0.js"></script>
		<!-- javascript-->
		<script src="resources/js/bootstrap.js"></script>
		
		
		<!-- Scrolling Nav JavaScript -->
    <script src="resources/js/jquery.easing.min.js"></script>
    <script src="resources/js/scrolling-nav.js"></script>
		
		
		



</body>

</html>