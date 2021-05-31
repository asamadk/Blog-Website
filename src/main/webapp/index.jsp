<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.Connection.ConnectJDBC"%>
<%@page import="com.everything.dao.Categoriesdao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.everything.blog.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="Components/bootstrapcss.jsp"%>
</head>
<body>
	<%@include file="Components/navbar.jsp"%>
	<br>
	<br>
	<br>
	<!-- banner -->
	<div class="container-fluid">
		<div class="jumbotron">
			<div class="container">
				<h3 class="display-3">EverythingBlog</h3>
				<p>Blog website for everything and anything.</p>

				<a href="login.jsp" class="btn btn-light btn-lg"><i
					class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a> <a
					href="register.jsp" class="btn btn-light btn-lg"><i
					class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
			</div>
			<br> <br> <br>
			<div class="container">
				<h5 class="display-5">Popular Blogs:</h5>
			</div>

		</div>


	</div>

	<!-- Cards -->
	<div class="container">
	<div class="row">
	<%
	Categoriesdao cdao = new Categoriesdao(ConnectJDBC.connect());
	List<postblog> postlist = cdao.getAllPost();
	for (postblog p : postlist) {
	%>
		
			 <div class="col-md-4"> 
			<div class="card">
				<div class="card-body">
					<h5 class="card-title"><%=p.getPtitle()%></h5>
					<p class="card-text"><%=p.getPcontent()%></p>
					<a href="login.jsp" class="btn btn-dark">Read More</a>
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