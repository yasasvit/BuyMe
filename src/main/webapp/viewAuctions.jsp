<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Auctions</title>
</head>
<button onclick="window.location.href='userAccount.jsp';">Back to Dashboard</button><br>
<body>
	<h1>All Auctions</h1>
	<h2>	<a href="search.jsp">Search</a><br> </h2>
<%
	Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password"); /* Change to your own pass */
	Statement st = con.createStatement();
Statement st2 = con.createStatement();
	ResultSet rs = st.executeQuery("SELECT * " +
								   "FROM Auction " +
								   "ORDER BY itemID DESC " +
								   "LIMIT 5;"); 
	
	int listingNameDisplayLimit = 50;
	
	
	int count = 5; 
	HashMap<Integer,Integer> hm = new HashMap<Integer,Integer>();
	HashMap<Integer,String> hm_seller = new HashMap<Integer,String>();
	
	while (rs.next()) {
			  int itemID = rs.getInt("itemID");
			  String userID = rs.getString("username");
		String winneruserid = rs.getString("winnerusername");
		 String listingName = rs.getString("listingName");
		 Date startDateTime = rs.getDate("startDateTime");
		   Date endDateTime = rs.getDate("endDateTime");
			float initialPrice = rs.getFloat("initialPrice");
			  float currentBid = rs.getFloat("currentBid");
			  float reserve = rs.getFloat("reserve");
			 boolean closed = rs.getBoolean("closed");
			  float minIncrement = rs.getFloat("minIncrement");
			  float earnings = rs.getFloat("earnings");
			  
		String status = closed ? "Closed" : "Open";
		
		Statement item_st = con.createStatement();
		ResultSet item_rs = item_st.executeQuery("SELECT * FROM Item WHERE itemID = '" + itemID + "';");
		
		String gender = "gender";
		String itemType = "itemType";
		String brand = "brand";
		int size = -1;
	
		
		if (item_rs.next()) {
			gender = item_rs.getString("gender");
			itemType = item_rs.getString("itemType");
			brand = item_rs.getString("brand");
			size = item_rs.getInt("size");
		}
		
		
		hm.put(count, itemID);
		hm_seller.put(count, userID);
		
		String     formid = "" + itemID;
		String selleruser = userID;
		
		out.println("<div>");
		  out.println("<h3> Listing Name: " + listingName + "</h3>");
		  out.println("<p>");
		    out.println("Listed by user: '" + userID + "'<br/>");
		    
		    out.println("ITEM ID: " + itemID + "<br/>");
		    
		    out.println("Who does the shoe belong to:  " + gender + "<br/>");
		    out.println("Shoe Type:      " + itemType + "<br/>");
		    out.println("Brand: " + brand + "<br/>");
		    out.println("Shoe Size:      " + size + "<br/>");
		  
		out.println("<form action=viewSimilarItems.jsp method\"POST\">");
		out.println("<input type=\"hidden\" name=\"gender\" value=\"" + gender + "\">");
		out.println("<input type=\"hidden\" name=\"type\" value=\"" + itemType + "\">");
		out.println("<input type=\"hidden\" name=\"brand\" value=\"" + brand + "\">");
		out.println("<input type=\"submit\" value=\"View Similar Items\" style=\"height:100px; width:75px\" />");	
		out.println("</form>");
		    
		  
		  out.println("</p>");
		  out.println("<p>");
		    out.println("Status: " + status + "<br/>");
		    if (!closed) {
		    	/* change var names to match placeBid */
			    out.println("<br/> Current bid: " + currentBid + "<br/>");
		    	out.println();
	    		ResultSet rs2 = st2.executeQuery("select b.bidderUsername, b.bid from bids b where b.itemID = '" + itemID + "';");
		    	%>
		    	<table border=1>
    <thead>
        <tr>
           <th>Username</th>
          <th>Bid</th>
           
        </tr>
    </thead>
    <tbody> <%
	while (rs2.next()) {
		%>
		<tr>
		<td><%=rs2.getString("b.bidderUsername")%></td>
		<td><%=rs2.getFloat("b.bid")%></td>
		
		</tr>
		<%
	}
%>
	</tbody>
	</table><br>
<%
		    	
			    out.println("<form action=\"placeBid.jsp\" method=\"POST\">");
			      out.println("Bid amount: <input type=\"number\" step=\".01\" name=\"amount" + formid + "\"/> <br/>");
			      out.println("Turn on automatic bidding: <input type=\"checkbox\" name=\"auto" + formid + "\"/> <br/>");
			      out.println("Bid increment for auto bidding: <input type=\"number\" step=\".01\" name=\"increment" + formid + "\"/> <br/>");
			      out.println("Most I am willing to bid: <input type=\"number\" step=\".01\" name=\"upperLimit" + formid + "\"/> <br/>");
			      out.println("Note: seller has set increment to be a minimum of $" + minIncrement + "<br/>");
			      out.println("<input type=\"submit\" name=\"" + count + "\" value=\"Place bid\"/>");
			      out.println("</form>");
		    } else {
		    	out.println("Sold at $" + earnings + " to user '" + winneruserid + "' on " + endDateTime + "<br/>");
		    	out.println("Sold at $" + earnings + " to user '" + "' on " + endDateTime + "<br/>");
		    }
		out.println("</p>");
		out.println("</div>");
		%>
		
<!-- 		<a href="viewSimilarItems.jsp">View Similar Items</a><br> Change link
 -->		<%
		count -= 1;
	out.println("<hr size=\"6\" width=\"100%\" color=\"gray\">");

		// functionality:
		// place bid, button for turning on automatic bidding, have to insert into Buyer table etc.
	}
	session.setAttribute("hash", hm);
	session.setAttribute("hash_seller", hm_seller);
%>

</body>
</html>
