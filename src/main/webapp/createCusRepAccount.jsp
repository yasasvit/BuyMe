<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%
	
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password"); /* Change to your own pass */
	Statement st = con.createStatement();
	ResultSet rs;
    String temp = String.format("INSERT INTO User(username, password) VALUES ('%s', '%s');", username, password);
	st.executeUpdate(temp); 
	

	rs = st.executeQuery("SELECT * FROM User WHERE username= '" + username + "'");
    session.setAttribute("user", username);
    	
    	if(rs.next()) {
    		String temp2 = String.format("INSERT INTO customerRep(username, password) VALUES ('%s', '%s');", username, password);
    		st.executeUpdate(temp2);
    		out.println("Customer Representative Account Successfully Created! <a href='manageCusRep.jsp'>Return to Dashboard</a>");
    	}

%>

</body>
</html>
