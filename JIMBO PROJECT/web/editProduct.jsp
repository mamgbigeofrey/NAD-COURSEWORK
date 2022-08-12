<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JIMBO Online</title>
        <link rel="stylesheet" href="bootstrap.css">
        
        <style>
             .container{
              width:60%;
              margin:auto auto;
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
        
        <div class="header">
          <h1> JIMBO E-COMMERCE SOLUTIONS</h1>
        </div>
        <h2 style="text-align: center;">Edit Product</h2>
        <%
           try{
           int id = Integer.parseInt(request.getParameter("id"));
        
           Class.forName("com.mysql.jdbc.Driver");
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper", "root", "");
           Statement stmt = con.createStatement(); 
           String sql = ("select productID, productName, category, price, quantityInStock from products where productID = '" + id + "' ");
        
           ResultSet updateProduct = stmt.executeQuery(sql);
           while(updateProduct.next()){
    
        %>
        <div class="container">
            <form  role="form" action="editing.jsp" method="post">
                <div class="form-group">
                    <label>Product Id</label> 
                    <input class="form-control " type="text" name="productId" value="<%=updateProduct.getInt("productID")%>" readonly />
                </div>
                <div class="form-group">
                    <label>Product Name</label>
                    <input class="form-control " type="text" name="productName" value="<%=updateProduct.getString("productName")%>" />
                </div>
                <div class="form-group">
                <!-- <select class="form-control form-control-lg" name ="cc" id="<%=updateProduct.getString("category")%>">
                    <option value="">Shoes</option>
                    <option value="">Shirts</option>
                    <option value="">Jackets</option>
                    <option value="">Jewelry</option> 
                </select> -->
                    <label>Category:</label>
                    <!--<input class="form-control form-control-lg" type="text" name="cc" value="<%=updateProduct.getString("category")%>" />   -->
                   
                    <div class="form-check">
                    <input type="radio" id="shoes" name="cc" value="<%=updateProduct.getString("category")%>"/>
                    <label for="shoes">Shoes</label>
   
                    <input type="radio" id="shirts" name="cc"value="<%=updateProduct.getString("category")%>"/>
                    <label for="shoes">Shirts</label>
   
                    <input type="radio" id="jackets" name="cc" value="<%=updateProduct.getString("category")%>"/>
                    <label for="shoes">Jackets</label>
  
                    <input type="radio" id="jewelry" name="cc" value="<%=updateProduct.getString("category")%>"/>
                    <label for="shoes">Jewelry</label>
                   </div>
                </div>
                <div class="form-group">
                    <label>Price</label>
                    <input class="form-control" type="text" name="price" value="<%=updateProduct.getInt("price")%>" />
                </div>
                <div class="form-group">
                     <label>Quantity In Stock</label> 
                     <input class="form-control" type="text" name="quantity" value="<%=updateProduct.getInt("quantityInStock")%>" />
                </div>  
                <br><br>
                
                <button class="btn btn-primary" type="submit">Update Product</button>
            </form>
        </div>
        <%
           }
          
           }catch(Exception e){
        	   e.printStackTrace();
           }
        %>
        
    </body>
</html>
