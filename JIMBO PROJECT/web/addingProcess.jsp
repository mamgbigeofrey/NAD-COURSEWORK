<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JIMBO Online</title>
</head>
<body>
<% 
        
    String id = request.getParameter("productId");
    String name = request.getParameter("productName");
    String cat = request.getParameter("cc");
    String pr = request.getParameter("price");
    String quan = request.getParameter("quantity");
    //String ltperiod = request.getParameter("time");
		
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper", "root", "");
		Statement stmt = con.createStatement(); 
		String insert = "insert into products (productId, productName, category, price, quantityInStock) values('" + id + "', ' " + name + "', '" + cat + "','" + pr + "','" + quan + "')";
			
		stmt.executeUpdate(insert);
		response.sendRedirect("admin.jsp");
	  }  
	catch(Exception e) {
		out.println(e);
	}
%>
</body>
</html>