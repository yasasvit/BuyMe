<%@ page import ="java.sql.*" %>
<%
    String bidID = request.getParameter("bidID");   
    Class.forName("com.mysql.jdbc.Driver");
    
    out.println("<a href='customerRepDashboard.jsp'>Return to dashboard</a><br>");
    
    try {    
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
    	PreparedStatement updateSt = con.prepareStatement("DELETE FROM Bids WHERE bidID = ?");
    	
    	updateSt.setString(1, bidID);
    	
    	int result = updateSt.executeUpdate();
		updateSt.close();
        
        out.println("Success! Bid has been deleted.<br>");
        
      } catch(SQLException se) {
          out.println("Try again. <a href='cusRepDeleteAuctionBids.jsp'></a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>