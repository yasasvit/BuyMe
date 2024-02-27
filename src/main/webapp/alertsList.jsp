<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Results</title>
</head>
<body>
	<h1>Alert List</h1>
<%

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
	String currentUsername = String.valueOf(session.getAttribute("user"));
	
	Statement ut = con.createStatement();
	ResultSet xs = ut.executeQuery("SELECT * " +
								   "FROM Alert " +
								   "WHERE username = '" + currentUsername + "';"
								   ); 
	
	while(xs.next()){
	
	String alertName = xs.getString("alertName");
	String listingNameInput = xs.getString("itemName");
	String genderInput = xs.getString("gender");
	String itemTypeInput = xs.getString("itemType");
	String brandInput = xs.getString("brand");
	int sizeInput = xs.getInt("size");
	
	out.println("<h2> Alert Name: " + alertName + "</h2>");
	
	Statement st = con.createStatement();
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
			  
		if(listingNameInput != null && !listingName.contains(listingNameInput)){
			continue;
		}
			  
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
		
		if((brandInput != null && !brand.equals(brandInput)) || (genderInput != null && !gender.equals(genderInput)) || 
				(itemTypeInput != null && !itemType.equals(itemTypeInput)) || (sizeInput != size)){
			continue;
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
		    
		    out.println("Gender:  " + gender + "<br/>");
		    out.println("Shoe Type:      " + itemType + "<br/>");
		    out.println("Brand: " + brand + "<br/>");
		    out.println("Shoe Size:      " + size + "<br/>");
		  out.println("</p>");
		  out.println("<p>");
		    out.println("Status: " + status + "<br/>");
		    if (!closed) {
			    out.println("Current bid: " + currentBid + "<br/>");
			    out.println("<form action=\"placeBid.jsp\" method=\"POST\">");
			      out.println("Bid amount: <input type=\"number\" step=\".01\" name=\"amou" + formid + "\"/> <br/>");
			      out.println("Turn on automatic bidding: <input type=\"checkbox\" name=\"auto" + formid + "\"/> <br/>");
			      out.println("Bid increment for auto bidding: <input type=\"number\" step=\".01\" name=\"incr" + formid + "\"/> <br/>");
			      out.println("Most I am willing to bid: <input type=\"number\" step=\".01\" name=\"uppe" + formid + "\"/> <br/>");
			      out.println("Note: seller has set increment to be a minimum of $" + minIncrement + "<br/>");
			      out.println("<input type=\"submit\" name=\"" + count + "\" value=\"Place bid\"/>");
		    } else {
		    	out.println("Sold at $" + earnings + " to user '" + winneruserid + "' on " + endDateTime + "<br/>");
		    	out.println("Sold at $" + earnings + " to user '" + "' on " + endDateTime + "<br/>");
		    }
		    
	
		out.println("</p>");
		out.println("</div>");
		
		count -= 1;
		
		// functionality:
		// place bid, button for turning on automatic bidding, have to insert into Buyer table etc.
	}
	
	session.setAttribute("hash", hm);
	session.setAttribute("hash_seller", hm_seller);
	out.println("<hr size=\"6\" width=\"100%\" color=\"gray\">");
	}
%>

</body>
</html>
