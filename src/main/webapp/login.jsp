<!-- Login page for user. Provides link to create a new account. -->
<!DOCTYPE html>
<html>
   <head>
      <title>Login Form</title>
   </head>
   <body>
   <a href="homepage.jsp">Homepage</a><br>
   <h2>User Login</h2>
     <form action="checkLoginDetails.jsp" method="POST"> 
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <a href="createAccount.jsp">Create a new account here</a>
   </body>
</html>