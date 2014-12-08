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
<title>Frequently Asked Questions</title>
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
											<li><a href="profile">Edit my profile</a></li>
											<li><a href="photos">My photos</a></li>
											
										</c:if>
									</ul></li>
									<li class=""><a class="" href="faq">Frequently Asked Questions</a></li>
								<li class=""><a class="" href="logout">Logout</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>

			</div>
			
		</div>
	</div>
	<!--end navbar-->
	

	
<section id = "faq">
<div class = "container">
	<h1>Frequently Asked Questions</h1>
	<hr>
	
	<ol>
	<li><a href= "#1">Why should I use this service?</a></li>
	<li><a href= "#2">How do I find my public profile?</a></li>
	<li><a href= "#3">Why cant find myself in the search page?</a></li>
	<li><a href= "#4">I want to complain about a review</a></li>
	<li><a href= "#5">How much do you charge?</a></li>
	<li><a href= "#6">How do I find a Gardener?</a></li>
	<li><a href= "#7">What type of services do you provide?</a></li>
	<li><a href= "#8">Are your employees fully trained and qualified?</a></li>
	<li><a href= "#9">My gardener was fantastic/rubbish, how do I leave feedback?</a></li>
	</ol>
	
	<article>
	<h2><b>Gardener</b></h2>
	<div id = "1"></div>
	<div class = "question" >
	<h4>Why should I use this service?</h4>
	<p>We offer a free, easy way for you to showcase your gardening business and completed projects, all while gathering great feedback on your completed jobs.
	</p>
	</div>
	<div id = "2"></div>
	<div class = "question">
	<h4>How do I find my public profile?</h4>
	<p>Once you have logged in, click on <a href = "profile"> My Profile</a> in My Account. From here you can see what a Garden Owner would see when they search for you. 

	</p>
	</div>
	<div id = "3"></div>
	<div class = "question">
	<h4>Why cant find myself in the search page?</h4>
	<p>-Make sure you have created a profile: After you log in for the first time, you need to go to the Edit Profile <a href= "profie">page</a> to set up your public profile.<br>
-Remember to search for your Trade name, not your username.<br>
-If you do a location based search, make sure you search a location within the distance you are willing to work on your Edit Profile <a href= "profie">page</a>.<br>


	</p>
	</div>
	
	
	<div id = "4"></div>
	<div class = "question">
	<h4>I want to complain about a review</h4>
	<p>
If you feel someone left you an unfair review, please email admin&#64;gardenpeople.com detailing your complaint, and the administrators will resolve this issue for you.


	</p>
	</div>
	
	
	</article>
	
	<article>
	<h2><b>Garden Owner</b></h2>
	<div id = "5"></div>
		<div class = "question">
	<h4>How much do you charge?</h4>
	<p>Nothing, our find-a-gardener service is completely free! 

	</p>
	</div>
	<div id = "6"></div>
	<div class = "question">
	<h4>How do I find a Gardener?</h4>
	<p>Click  <a href = "findGardener">here</a> to search for gardeners. You can search for individual gardeners or do a location-based search.

	</p>
	</div>
	<div id = "7"></div>
		<div class = "question">
	<h4>What type of services do you provide?</h4>
	<p>Registered gardeners are able to provide at least one of the following services:<br><br>
-Lawn and general maintenance<br>
-Garden Design<br>
-Tree Surgery<br>
-Water Features <br>
-Fencing<br>
-Paving<br>
-Decking<br>


	</p>
	
	</div>
	
	<div id = "8"></div>
		<div class = "question">
	<h4>Are your employees fully trained and qualified?
</h4>
	<p>Registered gardeners have one of the following qualifications:<br><br>
-Amateur Gardener<br>
	-Royal Horticultural Society level 1<br>
-Royal Horticultural Society level 2<br>
-Royal Horticultural Society level 3<br>
-Royal Horticultural Society master<br><br>
If you’re unsure, please make sure you use a qualified gardener!<br>


	</p>
	</div>
	
	<div id = "9"></div>
	<div class = "question">
	<h4>My gardener was fantastic/rubbish, how do I leave feedback?</h4>
	<p>You can write reviews on the Gardener&#8217;s page, your feedback will be publicly viewable, and will help other users choose the right gardener for them.


	</p>
	</div>
	
	
	
	
	
	
	</article>
	
</div>
</section>

	<div style="margin-bottom: 20vw">
		<br>
	</div>

	<!-- jquery-->
	<script type="text/javascript">
	//$('business').click(function(){
	//  window.location = "Register";
	//});
	</script>
	
	
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var loginError = $("body").attr("data-loginError")
			//alert(valuePassedFromJSP);
			if(loginError.length > 0){
				$("#loginDropdown").click();
				//alert(loginError);

			}
		});
		//alert(myObject);
	</script>
	<!-- javascript-->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>


	<!-- Scrolling Nav JavaScript -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>
	<script
			src="${pageContext.request.contextPath}/resources/js/checklogin.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrolling-nav.js"></script>


</body>

</html>