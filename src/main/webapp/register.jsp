<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<%@include file="Components/bootstrapcss.jsp"%>
</head>
<body>
	<%@include file="Components/navbar.jsp"%>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	<div class="container">
		<div class="child">
			<h3>Register</h3>
			<form action="Register" method="post">
				<label for="email">Email:</label><br> 
				<input type="email" id="email" name="email"><br> 
				<label for="fname">First Name</label><br>
				<input type="text" id="fname" name="fname"><br> 
				<label for="lname">Last Name</label><br>
				<input type="text" id="lname" name="lname"><br> 
				<label for="lname">Password:</label><br>
				<input type="password" id="password" name="pass"><br><br>
				
				<input type="submit" value="Register">
			</form>
		</div>
	</div>
</body>
</html>