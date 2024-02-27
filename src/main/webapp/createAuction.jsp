<!-- This allows user to create an auction. -->
<!DOCTYPE html>
<html>
   <head>
      <title>Create Auction</title>
   </head>
   <body>
   <button onclick="window.location.href='homepage.jsp';">Home</button><br>
   <form action="checkCreateAuction.jsp" method="POST">
   
    <h1>Create Auction</h1>
   <div>
   	<h2>Item Details</h2>
   	Listing Name: <input type="text" name="listingName"/> <br/>
   	</div>
   	
   	<div>
   	<h3>Who is the shoe for?</h3>
  	<select name="gender" id="Gender"> 
  	  	<option value="" selected disabled hidden=null>Choose here</option>
       	<option value="women">Women</option>
       	<option value="men">Men</option>
       	<option value="kids">Kids</option>
   	</select>
   	</div> 	
   	
   	<div>
   	<h3>Shoe Type:</h3>
   	<select name=itemType id="Shoe Type"> 
   	   <option value="" selected disabled hidden=null>Choose here</option>
       	<option value="Sneakers">Sneakers</option>
       	<option value="Boots">Boots</option>
        <option value="Slippers">Slippers</option>
       	<option value="Sandals & Slides">Sandals & Slides</option>
    </select>
    </div>
   	
   	<div>
 	<h3>Brand:</h3>
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
    
    <!-- Doesn't account for men & women having shoe sizes. Or many kid sizes. -->
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
   	
   	<h2>Auction Details</h2> 
   	
   	<div>
   	<h3>End Date:</h3> 
   	<input type="date" name="endDateTime" 
           placeholder="dd-mm-yyyy" value="endDateTime"
           min="1997-01-01" max="2030-12-31">
   	</div>
	
	<div>
	<h3>Initial Price:</h3>
	$<input type="number" min="0" name="initialPrice"/> <br/>
	</div>
	
	<div>
	<h3>Reserve Price:</h3>
	$<input type="number" min="0" name="reservePrice"/> <br/>
	</div>
	
	<div>
	<h3>Minimum Bid Increment:</h3>
	$<input type="number" min="0" name="minIncrement"/> <br/>
	</div>
	
   	<div>
    <input type="submit" value="Submit"/>
    </div>
    
    </form>
     
   </body>
</html>