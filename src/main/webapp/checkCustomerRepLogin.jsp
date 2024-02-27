<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from CustomerRep where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("Welcome " + userid);
        out.println("<br><a href='customerRepDashboard.jsp'>Customer Representative Dashboard</a>");
        out.println("<br><a href='logout.jsp'>Log out</a><br>"); 
        
    } else {
        out.println("Invalid password <a href='customerRepLogin.jsp'>try again</a>");
    }
%>