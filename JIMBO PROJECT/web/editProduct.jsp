<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.dbConnection.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JIMBO Online</title>
        <link rel="stylesheet" href="bootstrap.css">
        
        <style>
             .container{
              width:50%;
              margin:auto auto;
            }
    </style>
    </head>
    <body>
        <h4>Edit Product</h4>
        <%
            //Getting input from the admin
            int id = Integer.parseInt(request.getParameter("productId"));
            //Querying to the database
            ResultSet update = dbConnection.getResultFromSqlQuery("select * from products where productID ='" + id + "' ");
            while (update.next()) {
        %>
        <div class="container">
            <form role="form" action="editing.jsp" method="post">
 
                <div class="form-floating mb-3">
                    <label>Product Name</label> <input class="form-control" type="text" name="productName" value="<%=update.getString("productName")%>" />
                </div>
                <div class="form-floating mb-3">
                    <label>Price</label> <input class="form-control" type="text" name="price" value="<%=update.getString("price")%>" />
                </div>
                <div class="form-floating mb-3">
                     <label>Quantity In Stock</label> <input class="form-control" type="text" name="quantity" value="<%=update.getString("quantity")%>" />
                </div>  
                
                <button type="submit">Update Product</button>
            </form>
        </div>
                <%
                    }%>
        
    </body>
</html>
