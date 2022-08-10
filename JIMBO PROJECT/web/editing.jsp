<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.dbConnection.*"%>
<%@ page import="java.sql.*"%>
<%
    //Getting all inputs from the admin
    int id = Integer.parseInt(request.getParameter("productId"));
    String pname = request.getParameter("productName");
    String quan = request.getParameter("quantity");
    String price = request.getParameter("price");
   
    //Querying to the database
    int updateProduct = dbConnection.insertUpdateFromSqlQuery("update products set productName='" + pname + "', quantityInStock='" + quan + "', price='" + price + "' where productID='" + id + "'");
    if (updateProduct > 0) {
        response.sendRedirect("viewProducts.jsp");
    } else {
        response.sendRedirect("viewProducts.jsp");
    }
%>
