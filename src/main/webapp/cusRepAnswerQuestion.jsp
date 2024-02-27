<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<head>
<%
    String questionID = request.getParameter("questionID");
    String userID = request.getParameter("username");   
    String reply = request.getParameter("reply");
    Class.forName("com.mysql.jdbc.Driver");
    
    try { 
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
        Statement st = con.createStatement();
        java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
        ResultSet result = st.executeQuery("select * from Questions where questionID ='" + questionID + "'");
        String currentUsername = String.valueOf(session.getAttribute("user"));
        
        if(result.next()){
        String insertSt = String.format("update Questions set reply = '%s', cusRepUsername = '%s' WHERE questionID = '"+questionID+"';", reply,currentUsername);
        st.executeUpdate(insertSt);
        
        response.sendRedirect("cusRepViewQuestions.jsp");
        }
      } catch(SQLException se) {
          out.println("Try submitting a response again: <a href='cusRepViewQuestions.jsp'></a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>