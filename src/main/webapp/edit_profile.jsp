<%@page import="com.everything.blog.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="Components/bootstrapcss.jsp" %>
</head>
<body>

	<%
	
	//stop backbutton from breaching security
		response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate"); //works on HTTP 1.1
		
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		
		response.setHeader("Expires", "0"); // expires and time in seconds for proxies
		
		if(session.getAttribute("userD") == null){
			response.sendRedirect("login.jsp");
		}
	
	%>
	<!-- Navbar with logout button start -->
	<link rel="stylesheet" type="text/css" href="CSS/style.css">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">EverythingBlog</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="welcome.jsp">Welcome</a></li>
					<li class="nav-item"><a class="nav-link"
						href="https://asamadk.github.io">Porfolio</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Categories </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Blog</a></li>


				</ul>
				<%User user = (User)session.getAttribute("userD"); %>

				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a href="profile.jsp" class="btn btn-dark"><i
							class="a fa-sign-out" aria-hidden="true"></i> <%=user.getFname() %></a></li>
					<li class="nav-item"><a href="logout" class="btn btn-dark"><i
							class="a fa-sign-out" aria-hidden="true"></i> Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>
	
	<!-- Edit part -->
	<br><br><br><br><br><br><br><br><br><br><br>
		<div class="container">
		<div class="child">
			<h3>Edit</h3>
			<form action="edit_profile" method = "post">
				<label for="email">Email:</label><br> <input type="email"
					id="email" name="email"><br>
					<label for="fname">First Name:</label><br> <input type="text"
					id="fname" name="fname"><br>
					<label for="lname">Last name:</label><br> <input type="text"
					id="lname" name="lname"><br> <label
					for="pass">Password:</label><br> <input type="password"
					id="pass" name="pass"><br>
				<br> <input type="submit" value="Save Changes">
			</form>
		</div>
	</div>

</body>
</html>