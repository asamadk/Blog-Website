<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.Connection.ConnectJDBC"%>
<%@page import="com.everything.dao.Categoriesdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.everything.blog.*"%>
<%@ page import="com.everything.blog.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Posts</title>
<%@include file="Components/bootstrapcss.jsp"%>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">EverythingBlog</a>
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
							<%
							Categoriesdao c = new Categoriesdao(ConnectJDBC.connect());
							ArrayList<categories> li = c.retriveCategories();

							for (categories ca : li) {
							%>
							<li><a class="dropdown-item" href="#"><%=ca.getCategories()%></a></li>
							<%
							}
							%>
						</ul></li>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">All Blogs</a></li>


				</ul>
				<%
				//String email = (String)session.getAttribute("email");
				User user = (User) session.getAttribute("userD");
				if (user == null)
					response.sendRedirect("login.jsp");
				%>
				<ul class="navbar-nav mr-right">
					<li class="nav-item"><a href="profile.jsp"
						class="btn btn-dark"><i class="a fa-sign-out"
							aria-hidden="true"></i> <%=user.getFname()%></a></li>
					<li class="nav-item"><a href="logout" class="btn btn-dark"><i
							class="a fa-sign-out" aria-hidden="true"></i> Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<br><br>
	<!-- Banner -->
	<div class="container-fluid">
		<div class="jumbotron">
			<div class="container">
				<h3 class="display-3">Your Posts :</h3><br> <br>
				<a href="welcome.jsp" class="btn btn-light btn-lg"><i
					class="" aria-hidden="true"></i> Back</a>
			</div>

		</div>
	</div>
	<br>
	
	<!-- Cards -->
	<div class="container">
		<div class="row">
			<%
			int id = user.getUserid();
			Categoriesdao cdao = new Categoriesdao(ConnectJDBC.connect());
			List<postblog> postlist = cdao.getpostbyuser(id);

			for (postblog p : postlist) {
			%>
			<div class="col-md-3 mt-2">
				<div class="card">
					<div class="card-body">
						<h5><%=p.getPtitle()%></h5>
						<p><%=p.getPcontent()%></p>
					</div>
					<div class="card-footer">

						<a href="#" class="btn btn-dark">Edit</a>
						<a href="BlogFull.jsp?pid=<%=p.getPid() %>" class="btn btn-dark" name="pid">Read More</a>
					</div>
				</div>
			</div>

			<br>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>