<!DOCTYPE html>
<html>
   <head>
      <title>Customer Rep: Edit User Info</title>
   </head>
   <body>
   <a href="adminDashboard.jsp">Back to Dashboard</a><br>
   <h1>Manage Customer Rep Account Information</h1>
   
   <form action="createCusRepAccount.jsp" method="POST">
   <h2>Create Customer Service Account</h2>
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
 
    <form action="deleteCusRepAccount.jsp" method="POST">
    <h2>Delete Customer Rep Account</h2>
        Username: <input type="text" name="username"/> <br/>
       <input type="submit" value="Delete"/>   
    </form>
    
    
  </body>
</html>