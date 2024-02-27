<%@ page import ="java.sql.*" %>
<%
	String userID = request.getParameter("username");
	String newPass = request.getParameter("newPass");
	Class.forName("com.mysql.jdbc.Driver");
	
	out.println("<a href='customerRepDashboard.jsp'>Return to dashboard</a>");
    
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "password");
	PreparedStatement updateSt = con.prepareStatement("update User set password = ? where username = ?");
	try{
			updateSt.setString(1, newPass);
			updateSt.setString(2, userID);
			int result = updateSt.executeUpdate();
			updateSt.close();
			
			if (result >= 1) {
				out.println("<br>Successfully updated the user's password!<br>");
			} else {
				out.println("Password was not changed. Try again.");
			}
	}
 catch (SQLException se) {
	 out.println("Try again. <a href='cusRepEditUserInfo.jsp'></a>");
	throw se; 
} catch (Exception e) {
	e.printStackTrace();
}
%>