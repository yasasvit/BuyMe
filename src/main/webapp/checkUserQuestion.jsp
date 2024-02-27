<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Check User Questions</title>
</head>
<body>
<button onclick="window.location.href='homepage.jsp';">Home</button><br>
<% 
PreparedStatement ps = null;
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
try {
	
    Statement st = conn.createStatement();
	String username = (session.getAttribute("user")).toString();
	String question = request.getParameter("question");
	if (question != null) {
		String insert = "INSERT INTO questions (username, question, reply)" + "VALUES (?, ?, ?)";
		ps = conn.prepareStatement(insert);
		ps.setString(1, username);
		ps.setString(2, question);
		ps.setString(3, "No answer yet");
		int result = 0;
		result = ps.executeUpdate();
		if (result < 1) {
	out.println("Insert failed. Please try again.");
		} else {
	out.print("<h4>Success! A customer rep will assist you in no time!</h4>");
	/* out.print("<a href='questionSearcher.jsp'>Search for questions</a><br>"); */
	out.print("<a href='userAccount.jsp'>Return to Dashboard</a>");
	return;
		}
	} else {
		%>
		<h2>Enter a question</h2>
		<p><%=session.getAttribute("user")%>, <a href="createUserQuestion.jsp">Ask a question here!</a>
		</p>
		<% 
		return;
	}
} catch (Exception e) {
	out.print("<p>Error.</p>" + e);
} finally {
	try {
		ps.close();
	} catch (Exception e) {
	}
	try {
		conn.close();
	} catch (Exception e) {
	}
}
%>
</body>
</html>