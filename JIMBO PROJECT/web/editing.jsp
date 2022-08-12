<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.products.dbConnection"%>
<%

  try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper", "root", "");
    Statement stmt = con.createStatement(); 

    int id = Integer.parseInt(request.getParameter("productId"));
    String pname = request.getParameter("productName");
    String categoryName = request.getParameter("cc");
    String quantity1 = request.getParameter("quantity");
    String price = request.getParameter("price");
   
    //Querying to the database
    int updateProduct = stmt.executeUpdate("update products set productName='" + pname + "', category='" + categoryName + "',  quantityInStock='" + quantity1 + "', price='" + price + "' where productID='" + id + "'");
    if (updateProduct > 0) {
        response.sendRedirect("viewProducts.jsp");
    } else {
        response.sendRedirect("viewProducts.jsp");
    }
  
  }catch(Exception e){
	  e.printStackTrace();
  }
%>