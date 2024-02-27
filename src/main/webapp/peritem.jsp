<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<button onclick="window.location.href='adminDashboard.jsp';">Back to Dashboard</button><br>
<body>
<%
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password"); /* Change to your own pass */
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT itemID, earnings from Auction where closed = '1'"); 

	%><table border=1 align=center style="text-align:center">
    <thead>
        <tr>
           <th>Shoe ID</th>
           <th>Earnings</th>
          
           
        </tr>
    </thead>
    <tbody> <%
	while (rs.next()) {
		%>
		<tr>
		<td><%=rs.getInt("itemID") %></td>
		<td><%=rs.getFloat("earnings")%></td>
		
		</tr>
		<%
	}
%>
	</tbody>
	</table><br>

</body>
</html>
