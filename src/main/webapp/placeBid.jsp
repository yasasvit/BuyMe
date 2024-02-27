<%@ page import ="java.sql.*" %>
<%@ page import="java.util.HashMap"%>
<%
 	String found = null;
	int i = 6;
    while (found == null && i >= 0) {
    	found = request.getParameter("" + i);
    	i -= 1;
    }
    i += 1;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
    
    PreparedStatement ps = con.prepareStatement("INSERT INTO " +
    										    "Bids(bidderUsername, sellerUsername, itemID, " +
    						    		    	"bid, upperlimit, increment, isAuto)" +
    						 	 	 	 	    "VALUES (?, ?, ?, ?, ?, ?, ?);");
    
    //   key : value
    // count : itemid
    HashMap<Integer,Integer> hash = (HashMap<Integer,Integer>)session.getAttribute("hash");
    HashMap<Integer,String> hash_seller = (HashMap<Integer,String>)session.getAttribute("hash_seller");
	
    int itemID = hash.get(i);
	String sellerUserID = hash_seller.get(i);
	String bidderUserID = String.valueOf(session.getAttribute("user"));
	
	float amount = Float.parseFloat(request.getParameter("amount" + itemID));
	
    String auto_string = request.getParameter("auto" + itemID);
    int auto = auto_string == null || auto_string == "null" ? 0 : 1;
    if (auto == 0) {
        ps.setString(5, "0");
        ps.setString(6, "0");
    } else {
        float increment = Float.parseFloat(request.getParameter("increment" + itemID));
        float upperLimit = Float.parseFloat(request.getParameter("upperLimit" + itemID));
        ps.setString(5, "" + upperLimit);
        ps.setString(6, "" + increment);
    }
    ps.setString(1, bidderUserID);
    ps.setString(2, "" + sellerUserID);
    ps.setString(3, "" + itemID);
    ps.setString(4, "" + amount);
    ps.setString(7, "" + auto);
    
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT itemID, endDateTime, currentBid, closed, minIncrement "+
    							   "FROM Auction " +
    							   "WHERE itemID = "+ itemID +
    							   " LIMIT 1;");
   	//ResultSet rs = st.executeQuery("SELECT itemID, endDateTime, currentbid, closed, minIncrement FROM Auction WHERE itemID = '"+ itemid +"' LIMIT 1;");
    	
    Boolean execute = true;					   
    String outmessage = "";			
    
    rs.next();
    Timestamp endDateTime = rs.getTimestamp("endDateTime");
    Timestamp currentdatetime = new java.sql.Timestamp(new java.util.Date().getTime());
    int cmp = endDateTime.compareTo(currentdatetime);
    if (cmp < 0) {
    	String subquery = "(SELECT bidderUsername "+
    					  "FROM Bids " +
    					  "WHERE sellerUsername = \'" + sellerUserID + "\' and itemID = " + itemID +
    					  " ORDER BY bidID DESC " + 
    					  "LIMIT 1)";
    	st.executeUpdate("UPDATE Auction "+ 
    					 "SET closed = 1, earnings = if (currentbid < reserve, -1, currentbid), winnerUsername = " + subquery +
    					 " WHERE username = \'" + sellerUserID + "\' and itemID = " + itemID + ";");
    	execute = false;
    	outmessage = "<h3>Sorry! It looks like this auction closed on " + endDateTime + ".</h3>" +
    			     "<a href=\"viewAuctions.jsp\">View auctions</a>";
    } else {
    	float currentBid = rs.getFloat("currentBid");
        //Boolean closed = rs.getBoolean("closed");
        float minIncrement = rs.getFloat("minIncrement");
        
        if (amount < currentBid + minIncrement) execute = false;
        outmessage = "<h3>You must bid at least " + minIncrement + " more than the current bid.</h3>" +
			         "<a href=\"viewAuctions.jsp\">View auctions</a>";
			         
    }
    
    if (execute) {
    	st.executeUpdate("UPDATE Auction "+ 
				 		 "SET currentbid = " + amount +
				         " WHERE username = \'" + sellerUserID + "\' and itemID = " + itemID + ";");
    	ps.executeUpdate();
    	response.sendRedirect("viewAuctions.jsp");
    }
    else {
    	out.println(outmessage);
    }  
%>