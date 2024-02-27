<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Answer User Questions</title>
    <a href="customerRepDashboard.jsp">Back to Dashboard</a><br>
</head>
<body>
<h1>Answer User Questions</h1>
    	<form action="cusRepAnswerQuestion.jsp" method="POST">
      Question ID: <input type="text" name="questionID"/> <br/>
      <!-- Reply:<input type="text" name="reply"/> <br/> -->
      Reply:<br>
      <textarea name="reply" rows="10" cols="50"/></textarea><br/>
       <input type="submit" value="Submit"/><br>
       <br>
      </form>
</body>
<%
    Class.forName("com.mysql.jdbc.Driver");
    try { 
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
        Statement st = con.createStatement();
        ResultSet result = st.executeQuery("select questionID, question, reply from Questions");
    %>
    
    <table border=1 align=left style="text-align:center">
	    <thead>
	        <tr>
	           <th>Question ID</th>
	           <th>Question</th>
	           <th>Reply</th>
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
	          </tr>
	          <%}%>
	         </tbody>
	      </table><br>
	  <%
  }
    catch(Exception e) {
              e.printStackTrace();
    }
%>
</html>