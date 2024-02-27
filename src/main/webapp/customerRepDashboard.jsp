<!-- User dashboard page. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Representative Dashboard</title>
</head>
<body>
	<button onclick="window.location.href='logout.jsp';">Logout</button><br>
	<div>
		<h2>Customer Representative Dashboard</h2>
		<a href="cusRepViewQuestions.jsp">Reply to User Questions</a><br> <!-- Change link -->
		<a href="cusRepEditUserInfo.jsp">Manage User Account Information</a><br> <!-- Change link -->
		<a href="cusRepDeleteAuctionBids.jsp">Remove Auctions & Bids</a><br> <!-- Change link -->
	</div>
</body>
</html>