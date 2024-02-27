<!-- Here you can add an auction. It will insert into ITEM and Auction tables if done correctly. -->
<%@ page import ="java.sql.*" %>

<%
    String listingName = request.getParameter("listingName"); 
	String gender = request.getParameter("gender");
    String itemType = request.getParameter("itemType");
    String brand = request.getParameter("brand");
    String size = request.getParameter("size");
    String endDateTime = request.getParameter("endDateTime");
   	String initialPrice = request.getParameter("initialPrice");
   	String reserve = request.getParameter("reservePrice");
   	String minIncrement = request.getParameter("minIncrement");
   	
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password"); /* Change to your own pass */
   Statement st = con.createStatement();
   java.sql.Timestamp startDateTime = new java.sql.Timestamp(new java.util.Date().getTime());
   String currentUsername = String.valueOf(session.getAttribute("user"));
   //out.println(startDateTime);
   
      try{ 
       	 ResultSet rs;
         String queryCreateItem = String.format("INSERT INTO Item(gender, itemType, brand, size) VALUES ('%s', '%s', '%s', %s);",gender, itemType, brand, size);
         st.executeUpdate(queryCreateItem); 
         
         
         String itemIDQuery = String.format("SELECT itemID FROM Item ORDER BY itemID DESC LIMIT 1");
         rs = st.executeQuery(itemIDQuery);
         rs.next();
         int itemID = rs.getInt("itemID");
         
        
         ResultSet result;
         String queryCreateAuction = String.format("INSERT INTO Auction(itemID, username, listingName, startDateTime, endDateTime, initialPrice, currentBid, reserve, closed, earnings, minIncrement) VALUES ('%s', '%s', '%s', '%s', '%s', %s, %s, %s, %s, %s, %s);", itemID, currentUsername, listingName, startDateTime, endDateTime, initialPrice, "NULL", reserve, "NULL", "NULL", minIncrement);
		 st.executeUpdate(queryCreateAuction);
		 
		 out.println("Auction Created!");
		 out.println("<br><a href='userAccount.jsp'>Back to Dashboard</a>");
		
		
      } catch(SQLException se) {
    	 out.println("Error: <a href='createAuction.jsp'>Try again</a>");
         se.printStackTrace();
   }   catch(Exception e) {
       e.printStackTrace();
}    
%>        