<%@ page import ="java.sql.*" %>

<%
	String alertName = request.getParameter("alertName");
    String listingName = request.getParameter("listingName"); 
	String gender = request.getParameter("gender");
    String itemType = request.getParameter("itemType");
    String brand = request.getParameter("brand");
    String size = request.getParameter("size");
   	
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
   Statement st = con.createStatement();
   java.sql.Timestamp startDateTime = new java.sql.Timestamp(new java.util.Date().getTime());
   String currentUsername = String.valueOf(session.getAttribute("user"));
   //out.println(startDateTime);
   
      try{ 
         String queryCreateItem = String.format("INSERT INTO Alert(alertName, itemName, username, gender, itemType, brand, size) VALUES ('%s','%s','%s','%s','%s','%s',%s);", alertName, listingName, currentUsername, gender, itemType, brand, size);
         st.executeUpdate(queryCreateItem); 
         
		 out.println("Alert Created!");
		 out.println("<br><a href='userAccount.jsp'>Back to Dashboard</a>");
		
		
      } catch(SQLException se) {
    	 out.println("Error: <a href='createAlert.jsp'>Try again</a>");
         se.printStackTrace();
   }   catch(Exception e) {
       e.printStackTrace();
}    
%>        