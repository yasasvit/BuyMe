<!DOCTYPE html>
<html>
   <head>
      <title>Customer Rep: Delete Auctions & Bids</title>
   </head>
   <body>
   <a href="customerRepDashboard.jsp">Back to Dashboard</a><br>
   <h1>Delete Auctions & Bids</h1>
    
    <form action="deleteBid.jsp" method="POST">
   	<h2>Delete Bid</h2>
       Bid ID: <input type="text" name="bidID"/> <br/>
       <input type="submit" value="Delete"/>
     </form>
     
     <form action="deleteAuction.jsp" method="POST">
     <h2>Delete Auction</h2>
       Username: <input type="text" name="username"/> <br/>
       Item ID:<input type="text" name="itemID"/> <br/>
       <input type="submit" value="Delete"/>   
    </form>
  </body>
</html>