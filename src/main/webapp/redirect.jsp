<title>Best Selling</title>
<%@ page import ="java.sql.*" %>
</head>
<%
    
    Class.forName("com.mysql.jdbc.Driver");
    
    String bestselling = request.getParameter("select");
    response.sendRedirect(bestselling);
   
   
%>
</body>
</html>