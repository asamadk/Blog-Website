<%@page import="com.Connection.ConnectJDBC"%>
<%@page import="com.everything.dao.Categoriesdao"%>
<%@page import="com.everything.blog.*"%>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.everything.blog.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Blog</title>
<%@include file="Components/bootstrapcss.jsp"%>
</head>
<body>
	<!-- Navbar with logout button -->
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
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<!-- Create Blog form -->
	<div class="container">
		<div class="child">
			<h3>Create your blog</h3>
			<form action="PostServlet" method="post">
				<label for="title">Title:</label><br> <input type="text"
					id="title" name="title"><br> <br> <label
					for="categories">Choose a category:</label> <select id="categories" name="cid">
					<% Categoriesdao cdao = new Categoriesdao(ConnectJDBC.connect());
						ArrayList<categories> li = cdao.retriveCategories();
						
						for(categories c:li){%>

					<option value="<%=c.getCid() %>"><%=c.getCategories() %></option>
					<% }
					%>
				</select><br> <br> <label for="desc">Content:</label><br> <input
					style="height: 300px; front-size: 20pt;" size = "150" type="text" id="desc"
					name="desc"><br> <br> <input type="submit"
					value="Post Blog">
			</form>


		</div>
	</div>
</body>
</html>