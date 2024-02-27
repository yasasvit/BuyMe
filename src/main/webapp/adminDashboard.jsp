<!-- User dashboard page. -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
</head>
<body>
	<button onclick="window.location.href='logout.jsp';">Logout</button><br>
	<div>
		<h2>Admin Dashboard</h2> 
		
		<a href="manageCusRep.jsp">Manage Customer Rep Accounts</a><br> <!-- Change link -->
<!-- 		<a href="genSalesReport.jsp">Generate Sales Report</a><br> Change link 
 -->	<form action="redirect.jsp" method="POST"> 
   <h3>Generate Sales Reports</h3>
       <select name="select" id="selectbox"> 
       	<option value="earnings.jsp">Total Earnings</option>
       	<option value="peritem.jsp">Earnings Per Each Shoe</option>
       	<option value="perItemType.jsp">Earnings Per Shoe Type</option>
       	<option value="perItemBrand.jsp">Earnings Per Shoe Brand</option>
       	<option value="perItemSize.jsp">Earnings Per Shoe Size</option>
       	<option value="perUser.jsp">Earnings Per User</option>
       	<option value="bestSelling.jsp">Best Selling Items</option>
       	<option value="bestBuyer.jsp">Best Buyers</option>
       </select>
       <input type="submit" value="Submit"/>
     </form>
   </body>
	</div>
</body>
</html>