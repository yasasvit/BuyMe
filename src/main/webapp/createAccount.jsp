<!-- Creating a new user account form -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
</head>

<body>
<a href="homepage.jsp">Homepage</a><br>
<h3>Create a New Account</h3>
	<form action="checkCreateAccount.jsp" method="POST"> <!-- need to create POST request -->
		Enter username: <input
			type="text" name="username" /> <br /> Enter password: <input
			type="password" name="password" /> <br /> 
			Enter email: <input type="text" name="email" /> <br /> 
			<!-- <input type="radio" name="account_type"
			value="buyer" checked> Buyer<br> <input type="radio"
			name="account_type" value="seller"> Seller<br> <input
			type="submit" value="Submit" /> -->
			<input type="submit" value="Submit" />
	</form>
</body>
</html>

