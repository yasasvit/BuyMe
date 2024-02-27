<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<title>All Questions</title>

</head>
<body>
	
	<button onclick="window.location.href='userAccount.jsp';">Back to Dashboard</button>
	<br><a href="createUserQuestion.jsp">Ask a Question</a><br>
	
<h2>All Asked Questions</h2>

	<%
	ResultSet result = null;
	PreparedStatement ps = null;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
	try {
		String username = (session.getAttribute("user")).toString();
		String questionsQuery = "SELECT * FROM questions";
		String check = "No answer yet";
		ps = conn.prepareStatement(questionsQuery);
		result = ps.executeQuery();
		
		%><table border=1 align=left style="text-align:center">
	    <thead>
	        <tr>
	           <th>Question ID</th>
	           <th>Question</th>
	           <th>Reply</th>
	           <th>Answered By</th>
	        </tr>
	    </thead>
	    <tbody>
	      <%while(result.next())
	      {
	          %>
	          <tr>
	              <td><%=result.getInt("questionID") %></td>
	              <td><%=result.getString("question") %></td>
	              <td><%=result.getString("reply") %></td>
	              <td><%=result.getString("cusRepUsername") %></td>
	          </tr>
	          <%}%>
	         </tbody>
	      </table><br>
	  <%
	
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			result.close();
		} catch (Exception e) {
		}
		try {
			conn.close();
		} catch (Exception e) {
		}
	}
	%>
	</div>
</body>
</html>