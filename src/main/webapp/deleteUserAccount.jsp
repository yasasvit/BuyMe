<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");   
    Class.forName("com.mysql.jdbc.Driver");
    
    out.println("<a href='customerRepDashboard.jsp'>Return to dashboard</a>");
    
    try {    
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
    	PreparedStatement updateSt = con.prepareStatement("DELETE FROM User WHERE username = ?");
    	
    	updateSt.setString(1, username);
    	
    	int result = updateSt.executeUpdate();
		updateSt.close();
        
        out.println("Account has been deleted.<br>");
        
      } catch(SQLException se) {
          out.println("Try again. <a href='cusRepEditUserInfo.jsp'></a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>