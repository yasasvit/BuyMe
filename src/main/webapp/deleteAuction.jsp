<%@ page import ="java.sql.*" %>
<%
    String username = request.getParameter("username");   
	String itemID = request.getParameter("itemID");
    Class.forName("com.mysql.jdbc.Driver");
    
    out.println("<a href='customerRepDashboard.jsp'>Return to dashboard</a><br>");
    
    try {    
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
    	/* PreparedStatement updateSt = con.prepareStatement("DELETE FROM Auction WHERE username = ? AND itemID = ?");
    	
    	updateSt.setString(1, username);
    	updateSt.setString(2, itemID);
    	
    	int result = updateSt.executeUpdate();
		updateSt.close(); */
		
		Statement st = con.createStatement();
		String insertStatement = String.format("DELETE FROM Auction WHERE username='"+username+"' and itemID = '"+itemID+"'");
		st.executeUpdate(insertStatement);
        
        out.println("Success! Auction has been deleted.<br>");
        
      } catch(SQLException se) {
          out.println("Try again. <a href='cusRepDeleteAuctionBids.jsp'></a>");
              se.printStackTrace();
      } catch(Exception e) {
              e.printStackTrace();
    }
%>