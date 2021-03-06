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

<div class="container">

    <h1>My Profile</h1>

    <div class="row">

        <div class="col-lg-6">
            <c:if test="${not user.profileRecordedOnDatabase}">
                <div class="warning">You have no profile saved in our records. Please create one</div>
            </c:if>
            <c:if test="${user.profileRecordedOnDatabase}">
                <c:if test="${empty confirmation}">
                    <div class="info">Your profile was last edited at ${user.publicProfile.formattedUpdatedAt}</div>
                </c:if>
                <c:if test="${not empty confirmation}">
                    <div class="success">${confirmation}</div>
                </c:if>
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
        </div>
    </div>

    <div class="row">
        <div class="col-lg-6">


            <form role="form" action="profile" method="post">


                <!-- Form Name -->
                <legend>Describe your services</legend>

                <!-- Text input-->
                <div class="form-group">
                    <label for="tradename">Your Company or Trading Name</label>

                    <input id="tradename" name="tradename" class="form-control" type="text"
                           placeholder="Your Name or Company Name" value="${user.publicProfile.tradename}">

                </div>
                <div class="form-group">
                    <label for="description">Description</label>

                    <textarea class="form-control" id="description" name="description"
                              placeholder="additional information for your customers"><c:out
                            value='${user.publicProfile.description}'/>
                    </textarea>


                </div>


                <!-- Multiple Checkboxes -->
                <div class="form-group">
                    <label>Do You have any of the following?</label>

                    <br>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="rhs1" value="1"
                               <c:if test="${user.publicProfile.rhs1}">checked</c:if>>
                        RHS
                        level 1
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="rhs2" value="1"
                               <c:if test="${user.publicProfile.rhs2}">checked</c:if>>
                        RHS
                        level 2
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="rhs3" value="1"
                               <c:if test="${user.publicProfile.rhs3}">checked</c:if>>
                        RHS
                        level 3
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="rhsMaster" value="1"
                               <c:if test="${user.publicProfile.rhsMaster}">checked</c:if>> RHS Master of horticulture
                    </label>


                </div>

                <div class="form-group">
                    <label>Please check services you offer</label>

                    <br>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="maintenance" value="1"
                               <c:if test="${user.publicProfile.maintenanceOffered}">checked</c:if>> General Maintenance
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="design" value="1"
                               <c:if test="${user.publicProfile.designOffered}">checked</c:if>> Garden Design
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="treesurgery" value="1"
                               <c:if test="${user.publicProfile.treeSurgeryOffered}">checked</c:if>> Tree surgery
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="waterfeatures" value="1"
                               <c:if test="${user.publicProfile.waterFeaturesOffered}">checked</c:if>> Water Features
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="fencing" value="1"
                               <c:if test="${user.publicProfile.fencingOffered}">checked</c:if>> Fencing
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="paving" value="1"
                               <c:if test="${user.publicProfile.pavingOffered}">checked</c:if>> Paving
                    </label>
                    <label class="checkbox-inline">
                        <input type="checkbox" name="decking" value="1"
                               <c:if test="${user.publicProfile.deckingOffered}">checked</c:if>> Decking
                    </label>


                </div>
                <div class="form-group">
                <span>

                    <label for="radius">
                        Return my profile for jobs within :
                    </label><br>

                    <select id="radius" name="radius" class="form-control">
                        <option value="5" <c:if test="${user.publicProfile.radius == 5}">selected="selected"</c:if>>5
                            miles
                        </option>
                        <option value="10" <c:if test="${user.publicProfile.radius == 10}">selected="selected"</c:if>>10
                            miles
                        </option>
                        <option value="20" <c:if test="${user.publicProfile.radius == 20}">selected="selected"</c:if>>20
                            miles
                        </option>
                        <option value="30" <c:if test="${user.publicProfile.radius == 30}">selected="selected"</c:if>>30
                            miles
                        </option>
                        <option value="40" <c:if test="${user.publicProfile.radius == 40}">selected="selected"</c:if>>40
                            miles
                        </option>
                        <option value="50" <c:if test="${user.publicProfile.radius == 50}">selected="selected"</c:if>>50
                            miles
                        </option>

                    </select> <label>
                    Of
                </label>
                    <input id="pac-input" class="form-control location" name="Location" style="width:75%"
                           type="text"
                           placeholder="Please enter postcode"
                           value="<c:out value='${user.publicProfile.googleLocation}'/>"
                           required>
                </span>

                </div>

			<div class = "form-inline">
                <input id="Latitude" class=form-control name="Latitude" style = "width:30%"
                       readonly value="<c:out value='${user.publicProfile.latitude}'/>"/>


                <input id="Longitude" class="form-control" name="Longitude" style = "width:30%"
                       readonly value="<c:out value='${user.publicProfile.longitude}'/>"/>
</div>

               <br><br>
                <div class="form-group">

                    <div class="col-md-12">
                        <button id="save" name="save"
                                class="btn btn-primary">Save
                        </button>
                    </div>
                </div>


            </form>


        </div>


        <div class="col-lg-6">

            <form role="form" action="PersonalPhoto" method="post" enctype="multipart/form-data">
                <legend>Personal or Company Photo</legend>
                <p>Choose a personal photo to upload to make your profile stand out. This can be a personal or company
                    photo
                    or logo:</p>

                <div class="input-group">
                    <span class="input-group-btn"> <span
                            class="btn btn-primary btn-file"> Browse&hellip; <input
                            type="file" multiple name="fileName">
                    </span>
                    </span> <input type="text" class="form-control" readonly>
                </div>
                <br>

                <button type="submit" name="personalPhoto" class="btn btn-primary">Upload Personal Photo</button>
            </form>
            <br><br>
            <c:if test="${user.publicProfile.profileImage.path eq null}">
                <img class="img-rounded" src="http://localhost:8080/images/no_photo.jpg" width="175px"  height="120px"/>
            </c:if>
            <c:if test="${user.publicProfile.profileImage.path ne null}">

                <img class="img-rounded" src="http://localhost:8080${user.publicProfile.profileImage.path}"
                     width="175px" height="120px"/>
            </c:if>
        </div>

    </div>
</div>
<div style = "margin-bottom:5vw"></div>

<!-- jquery-->

<div id="map-canvas" style="margin-right:10vw; margin-left:10vw"></div>
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
    });
    // $('#pac-input').closest('.form-group').append('<div class="col-lg-1"><img src="http://alittlecode.com/files/jQuery-Validate-Demo/assets/img/valid.png" alt=">>OK!"></div>')
</script>

</body>