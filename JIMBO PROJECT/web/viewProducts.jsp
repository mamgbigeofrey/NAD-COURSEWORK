<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JIMBO E-Commerce Solutions</title>
        <link rel="stylesheet" href="bootstrap.css">
        
        <style>
           .container{
             width:70%;
             margin:auto auto;
             margin-top: 100px;
           }
           img {
             
             border-radius: 4px;
             padding: 5px;
             width: 150px;
           }
           th, td {
             padding: 15px;
             text-align: left;
           }
           .header {
              padding: 10px;
              text-align: left;
              background: orange;
              color: white;
              font-size: 10px;
             }
           
       </style>
    </head>
    <body>
        <%
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        if(session.getAttribute("auth")==null){
        response.sendRedirect("admin_login.jsp");
        }
    
    %>
     <div class="header">
          <h1> JIMBO E-COMMERCE SOLUTIONS</h1>
        </div>
    <h2 style="text-align: center;">ALL PRODUCTS</h2>
    
    <div class="container">
      <table class="table table-bordered border-dark" class="w-75 p-3 " >
        <thead class="thead-dark">
        <tr>
            <th scope="col">ProductId</th>
            <th scope="col">ProductName</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Image</th>
            <th scope="col">QuantityInStock</th>
            <th scope="col">Likes</th>
            <th scope="col">Action</th>
        </tr>
    </thead>
        <%
            Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper", "root", "");
            Statement stmt = con.createStatement(); 
            String sql = ("select * from products");
            
	        ResultSet rs = stmt.executeQuery(sql);
              while(rs.next()){
        %>
    <tbody>
        <tr>
            <td><%=rs.getInt("productID")%></td>
            <td><%=rs.getString("productName")%></td>
            <td><%=rs.getString("category")%></td>
            <td><%=rs.getInt("price")%></td>
            <td><img src="images/<%=rs.getString("image")%>" class="rounded"></td>
            <td><%=rs.getInt("quantityInStock")%></td>
            <td><%=rs.getInt("Likes")%></td>
            <td><a class="link-primary" href="editProduct.jsp?id=<%=rs.getInt("productID")%>">Edit</a> | <a class="link-danger" href="deleteProduct.jsp?id=<%=rs.getInt("productID")%>" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
            </td>
        </tr>
    </tbody>
    <%
      }
    %>
 </table> 
 </div>  
</body>
</html>
