<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/resources/css/allpages.css">
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css.css">
  <title>Insert title here</title>

  <script type="text/javascript"
          src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/scripts/map.js"></script>
  <script>
    google.maps.event.addDomListener(window, 'load', initialize);
  </script>

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


										<form action="login" method="post" role="form"
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
											<li><a href="profile">My public profile</a></li>
											<li><a href="photos">My photos</a></li>
										</c:if>
									</ul></li>
								<li class=""><a class="" href="logout">Logout</a></li>
							</c:otherwise>
						</c:choose>

					</ul>
				</div>

			</div>
			
		</div>
	</div>
	<!--end navbar-->

<div class="col-lg-6">
  <h1>My Profile</h1>

 <%-- <c:if test="${not user.profileRecordedOnDatabase}">
    <div class="warning">You have no profile saved in our records. Please create one</div>
  </c:if>
  <c:if test="${user.profileRecordedOnDatabase}">
    <c:if test="${empty confirmation}">
      <div class="info">Your profile was last edited at ${user.publicProfile.formattedUpdatedAt}</div>
    </c:if>
    <c:if test="${not empty confirmation}">
      <div class="success">${confirmation}</div>
    </c:if>
  </c:if>--%>
  <c:if test="${not empty message}">
    <div class="success">${message}</div>
  </c:if>

  <c:if test="${fn:length(errors) > 0}">
    <div class="error">
      <ul>
        <c:forEach items="${errors}" var="error">
          <li>${error}</li>
        </c:forEach>
      </ul>
    </div>
  </c:if>

    <c:forEach items="${user.publicProfile.images}" var="image">
      <img src="http://localhost:8080${image.path}" width="175px"/>
    </c:forEach>





  <form role="form" action="photos" method="post"
        enctype="multipart/form-data">

    <p>choose photo to upload:</p>

    <div class="input-group">
				<span class="input-group-btn"> <span
                        class="btn btn-primary btn-file"> Browse&hellip; <input
                        type="file" multiple name="fileName">
				</span>
				</span> <input type="text" class="form-control" readonly>
    </div>


    <button type="submit" class="btn btn-default upload">Upload</button>
  </form>
  <br>



</div>
<!-- jquery-->


<script
        src="${pageContext.request.contextPath}/resources/js/jquery-2.1.1.min.js"></script>
<!-- javascript-->
<script
        src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/fileinput.js"></script>

<!-- Scrolling Nav JavaScript -->
<script
        src="${pageContext.request.contextPath}/resources/js/jquery.easing.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/scrolling-nav.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>


<script type="text/javascript">

/*
  $(document).ready(function () {
    var event = $.Event("keydown");
    event.which = 13;
    $('#pac-input').trigger(event);

    $('.selectpicker').selectpicker();
    $(window).keydown(function (event) {
      if (event.keyCode == 13) {
        event.preventDefault();
        return false;
      }
    });

    $('#pac-input').change(function () {

      var s = document.getElementById('Latitude');

      console.log(s);

    });
  });*/
  // $('#pac-input').closest('.form-group').append('<div class="col-lg-1"><img src="http://alittlecode.com/files/jQuery-Validate-Demo/assets/img/valid.png" alt=">>OK!"></div>')
</script>

</body>