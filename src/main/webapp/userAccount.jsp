<!-- User dashboard page. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
</head>
<body>
	<button onclick="window.location.href='homepage.jsp';">Home</button><br>
	<button onclick="window.location.href='logout.jsp';">Logout</button><br>
	
	<div>
		<h2>User Dashboard</h2>
		<a href="createAuction.jsp">Create Auctions</a><br> <!-- Change link -->
		<a href="viewAuctions.jsp">View Auctions</a><br> <!-- Change link -->
		<a href="bidHistory.jsp">My Bid History</a><br> <!-- Change link -->
		<a href="alerts.jsp">My Alerts</a><br> <!-- Change link -->
		<a href="createUserQuestion.jsp">Post a Question</a>  <!-- Change link -->
	</div>
</body>
</html>