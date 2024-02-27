<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Search for a Question</title>
</head>
<body>
	<button onclick="window.location.href='userAccount.jsp';">Back to Dashboard</button>
	
	<h2>Search for a question</h2>
	<form>
		<input type="text" name="search" placeholder="Keyword">
		<button type="submit">Search</button>
	</form>
	<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
		Statement st = con.createStatement();
		String search_keywords = request.getParameter("search");
		String str = "SELECT question,reply FROM questions WHERE question LIKE'%" + search_keywords + "%' or reply like '%" + search_keywords + "%'";
		ResultSet result = st.executeQuery(str);
		
		%><table border=1 align=center style="text-align:center">
	    <thead>
	        <tr>
	           <th>Question</th>
	           <th>Reply</th>
	           <!-- <th>Answered By</th> -->
	        </tr>
	    </thead>
	    <tbody>
	      <%while(result.next())
	      {
	          %>
	          <tr>
	              <td><%=result.getString("question") %></td>
	              <td><%=result.getString("reply") %></td>
	              <%-- <td><%=result.getString("cusRepUsername") %></td> --%>
	          </tr>
	          <%}%>
	         </tbody>
	      </table><br>
	  <%
		con.close();
	} catch (Exception e) {
	}
	%>

</body>
</html>