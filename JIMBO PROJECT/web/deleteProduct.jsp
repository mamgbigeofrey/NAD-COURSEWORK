<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
  try{
	  
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper", "root", "");
      Statement stmt = con.createStatement(); 
      
      int id = Integer.parseInt(request.getParameter("id"));
      int deleteProduct = stmt.executeUpdate("delete from products where productID ='" + id + "' ");
      if (deleteProduct > 0) {
        response.sendRedirect("viewProducts.jsp");
     } else {
        response.sendRedirect("viewProducts.jsp");
     }
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
    
