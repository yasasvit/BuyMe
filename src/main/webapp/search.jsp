<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>
<body>
	<button onclick="window.location.href='userAccount.jsp';">Back to Dashboard</button><br>
	<a href='viewAuctions.jsp'>All Auctions</a><br>
<h1>Search For Item</h1>
	<form action="searchResults.jsp" method="POST"> 
	       <div>
	   	<h3>Listing Name</h3>
	   	<input type="text" name="listingName"/> <br/>
	   	</div>
	   	
	   	<div>
	   	<h3>Gender</h3>
	  	<select name="gender" id="Gender"> 
	  	  	<option value="" selected disabled hidden=null>Choose here</option>
	       	<option value="women">Women</option>
	       	<option value="men">Men</option>
	       	<option value="kids">Kids</option>
	   	</select>
	   	</div> 	
	   	
	   	<div>
	   	<h3>Shoe Type</h3>
	   	<select name=itemType id="Shoe Type"> 
	   	   <option value="" selected disabled hidden=null>Choose here</option>
	       	<option value="Sneakers">Sneakers</option>
	       	<option value="Boots">Boots</option>
	        <option value="Slippers">Slippers</option>
	       	<option value="Sandals & Slides">Sandals & Flip Flops</option>
	    </select>
	    </div>
	   	
	   	<div>
	 	<h3>Brand</h3>
	   	<select name="brand" id="Brand"> 
	  	  	<option value="" selected disabled hidden=null>Choose here</option>
	       	<option value="Adidas">Adidas</option>
	       	<option value="Brooks">Brooks</option>
	        <option value="Call It Spring">Call It Spring</option>
	       	<option value="Nike">Nike</option>
	       	<option value="Dr. Martens">Dr. Martens</option>
	       	<option value="UGG">UGG</option>
	       	<option value="Crocs">Crocs</option>
	    </select>
	    </div>
	    
	 	<h3>Shoe Size</h3>    
	    <div>
	    <select name=size id="Size"> 
	  	  	<option value="" selected disabled hidden=null>Choose here</option>
	  	  	<option value="1">1</option>
	  	  	<option value="2">2</option>
	  	  	<option value="3">3</option>
	       	<option value="4">4</option>
	       	<option value="5">5</option>
	        <option value="6">6</option>
	       	<option value="7">7</option>
	       	<option value="8">8</option>
	       	<option value="9">9</option>
	       	<option value="10">10</option>
	       	<option value="11">11</option>
	       	<option value="12">12</option>
	        <option value="13">13</option>
	    </select>
	   	</div>
	   	
	   	<div>
	 	<h3>Sort By</h3>
	   	<select name="sortBy" id="sortBy"> 
	  	  	<option value="" selected disabled hidden=null>Choose here</option>
	       	<option value="Brand">Brand</option>
	       	<option value="Gender">Gender</option>
	        <option value="Type">Type</option>
	       	<option value="Name">Name (A-Z)</option>
	       	<option value="Bid">Bid Price (Lowest to Highest)</option>
	    </select>
	    </div>
	   	
	   	<div>
	   	<h2></h2>
	   	<input type="submit" value="Submit" style="height:100px; width:75px" />
	   	</div>
     </form>
</body>
</html>