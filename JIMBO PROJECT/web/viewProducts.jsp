<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dbConnection.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
      <table>
        <thead>
        <tr>
            <th>ProductId</th>
            <th>ProductName</th>
            <th>Category</th>
            <th>Price</th>
            <th>Image</th>
            <th>QuantityInStock</th>
            <th>Likes</th>
        </tr>
    </thead>
        <%
	    ResultSet rs = dbConnection.getResultFromSqlQuery("select productID, productName, category, price,image, quantityInStock, likes from products");
            while(rs.next()){
        %>
    <tbody>
        <tr>
            <td><%=rs.getInt("productId")%></td>
            <td><%=rs.getString("product")%></td>
            <td><%=rs.getString("cc")%></td>
            <td><%=rs.getInt("price")%></td>
           //for the image <td><%=rs.getInt("id")%></td>
            <td><%=rs.getInt("quantity")%></td>
            <td><%=rs.getInt("likes")%></td>
           
        </tr>
    </tbody>
 </table>      
</body>
</html>
