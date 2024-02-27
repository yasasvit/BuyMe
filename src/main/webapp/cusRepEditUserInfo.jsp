<!DOCTYPE html>
<html>
   <head>
      <title>Customer Rep: Edit User Info</title>
   </head>
   <body>
   <a href="customerRepDashboard.jsp">Back to Dashboard</a><br>
   <h1>Edit User Account Information</h1>
 
    <form action="deleteUserAccount.jsp" method="POST">
    <h2>Delete User Account</h2>
        Username: <input type="text" name="username"/> <br/>
       <input type="submit" value="Delete"/>   
    </form>
    
    <form action="updateUserPassword.jsp" method="POST">
   	<h2>Update User Password</h2>
       Username: <input type="text" name="username"/> <br/>
       New Password:<input type="text" name="newPass"/> <br/>
       <input type="submit" value="Update"/>
     </form>
  </body>
</html>