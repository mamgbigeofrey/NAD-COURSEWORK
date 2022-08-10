<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adding Products</title>
<link rel="stylesheet" href="bootstrap.css">

<style>
    .container{
        width:40%;
        margin:auto auto;
    }
    
</style>
</head>
<body>

 <h2 style="text-align: center;">Add New Product</h2>
<div class="container">
<form class="form m-10" action="addingProcess.jsp" method="post">

<div class="form-floating mb-3">
<input class="form-control" type="text" name="productId" required>
<label>Product ID:</label>
</div>
   
<div class="form-floating mb-3">
<input class="form-control" type="text" name="productName" required>
<label>Product Name:</label>
</div>
       
<div class="form-floating mb-3">
<select class="form-select" name ="cc" id="cc">
    <option value="">Shoes</option>
    <option value="">Shirts</option>
    <option value="">Jackets</option>
    <option value="">Jewellery</option> 
</select>
       <label>Category:</label><!-- comment -->
   </div>
        
<div class="form-floating mb-3">
    <input class="form-control" type="file" name="productImage" >
    <label>Image:</label>
</div>

<div class="form-floating mb-3">
<input class="form-control" type="text" name="price" required>
<label>Price: </label>
</div>

<div class="form-floating mb-3">
<input class="form-control" type="text" name="longTerm" required>
<label>Long Term Quantity</label>
</div>

<div class="form-floating mb-3">
<input class="form-control" type="text" name="quantity" required>
<label>Quantity In Stock: </label>
</div>
       
<div class="form-floating mb-3">
<input class="form-control" type="text" name="time" required>
<label>Long Term Period</label>
</div>

 <button type="submit">Add Product</button>
</form>
</div>

</body>
</html>
