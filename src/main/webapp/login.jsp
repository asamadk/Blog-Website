<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="Components/bootstrapcss.jsp"%>
</head>
<body>
	<%@include file="Components/navbar.jsp"%>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<!-- Login form -->
	<div class="container">
		<div class="child">
			<h3>Login</h3>
			<form action="Login" method="post">
				<label for="email">Email:</label><br> <input type="email"
					id="email" name="email"><br> <label for="pass">Password:</label><br>
				<input type="password" id="pass" name="pass"><br> <br>
				<input type="submit" value="Login">
			</form>


		</div>
	</div>
</body>
</html>