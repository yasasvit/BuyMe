<!-- Tries to login a user that should already have an account. -->
<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from User where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("Welcome " + userid);
        
        out.println("<br><a href='userAccount.jsp'>User Dashboard</a><br>"); 
    
        /* response.sendRedirect("success.jsp"); */
        out.println("<a href='logout.jsp'>Logout</a>");
        
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>