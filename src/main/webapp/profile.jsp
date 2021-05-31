<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.everything.blog.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<%@include file="Components/bootstrapcss.jsp"%>
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
				<%
	
	//String x = (String)session.getAttribute("email");
	User user = (User)session.getAttribute("userD");
	%>

				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a href="login.jsp" class="btn btn-dark"><i
							class="a fa-sign-out" aria-hidden="true"></i> <%=user.getFname() %></a></li>
					<li class="nav-item"><a href="logout" class="btn btn-dark"><i
							class="a fa-sign-out" aria-hidden="true"></i> Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<!-- Nav bar finish -->
	<br>
	<br>
	
	<!-- Card -->
	<div class="card text-center">
  <div class="card-header">
    Your Profile
  </div>
  <div class="card-body">
    <h5 class="card-title"><%=user.getFname() %><p> </p><%=user.getLname() %></h5>
    <p class="card-text"><%= user.getEmail() %></p>
    <a href="edit_profile.jsp" class="btn btn-dark">Edit</a>
    <a href="welcome.jsp" class="btn btn-dark">Back</a>
  </div>
  <div class="card-footer text-muted">
    Your data is safe with us.
  </div>
</div>
</body>
</html>