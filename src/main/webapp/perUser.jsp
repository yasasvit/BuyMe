<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
	ResultSet rs = st.executeQuery("SELECT username, sum(earnings) as totalSum from Auction a where closed = '1' group by username"); 

	%><table border=1 align=center style="text-align:center">
    <thead>
        <tr>
           <th>Username</th>
          <th>Earnings</th>
           
        </tr>
    </thead>
    <tbody> <%
	while (rs.next()) {
		%>
		<tr>
		<td><%=rs.getString("username")%></td>
		<td><%=rs.getFloat("totalSum")%></td>
		
		</tr>
		<%
	}
%>
	</tbody>
	</table><br>

</body>
</html>
