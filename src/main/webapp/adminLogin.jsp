<!DOCTYPE html>
<html>
   <head>
      <title>Admin Login</title>
   </head>
   <body>
   <a href="homepage.jsp">Homepage</a><br>
   <h2>Admin Login</h2>
     <form action="checkAdminLogin.jsp" method="POST"> 
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
   </body>
</html>