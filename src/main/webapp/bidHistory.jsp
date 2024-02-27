<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<button onclick="window.location.href='userAccount.jsp';">Back to Dashboard</button><br>
<body>
	<h2>My Bid History</h2>
<%
	String username = (String) session.getAttribute("user");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password"); /* Change to your own pass */
	Statement st = con.createStatement();
	Statement st2 = con.createStatement();
	   String currentUsername = String.valueOf(session.getAttribute("user"));
    ResultSet rs =  st.executeQuery("select itemID, bid from bids b where bidderUsername = '" + username + "';");
	%>
	<h3>Past Biddings</h3>
    <table border=1>
    <thead>
        <tr>
           <th>Item ID</th>
          <th>Bid</th>
           
        </tr>
    </thead>
    <tbody> <%
	while (rs.next()) {
		%>
		<tr>
		<td><%=rs.getString("b.itemID")%></td>
		<td><%=rs.getFloat("b.bid")%></td>
		
		</tr>
		<%
	}

	ResultSet rs2 = st.executeQuery("select itemID, currentBid from auction where currentBid > reserve and closed = '1' and username = '" + currentUsername + "';");

%>
	</tbody>
	</table><br>
	<div>
	<h3>Items Sold</h3>
	<table border=1>
    <thead>
        <tr>
           <th>Item ID</th>
          <th>Sold For</th>
           
        </tr>
    </thead>
    <tbody> <%
	while (rs2.next()) {
		%>
		<tr>
		<td><%=rs2.getString("itemID")%></td>
		<td><%=rs2.getFloat("currentBid")%></td>
		
		</tr>
		<%
	}
%>
	</tbody>
	</table><br>
	</div>


</body>
</html>
