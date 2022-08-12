<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adding Products</title>
<link rel="stylesheet" href="./css/bootstrap.css">

<style>
    .container{
        width:40%;
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
 <h2 style="text-align: center;">Add New Product</h2>
<div class="container">
    <form class="form m-10" action="Upload" method="post" enctype="multipart/form-data">

    <!-- comment <div class="form-floating mb-3">
<input class="form-control" type="text" name="productId" required>
<label>Product ID:</label>
</div>
  form-select form
 -->
   
<div class="form-floating mb-3">
<input class="form-control" type="text" name="productName" required>
<label>Product Name:</label>
</div>
       
<!--  <div class="form-check">
<select class="form-control form-control-lg" name ="cc" id="cc">
    <option value="">Shoes</option>
    <option value="">Shirts</option>
    <option value="">Jackets</option>
    <option value="">Jewelry</option> 
</select>
       <label>Category:</label>
   </div> 
   -->
   <label>Category: </label>
   <div class="form-check">
   <input type="radio" id="shoes" name="cc" value="Shoes"/>
   <label for="shoes">Shoes</label>
   
   <input type="radio" id="shirts" name="cc"value="Shirts"/>
   <label for="shoes">Shirts</label>
   
   <input type="radio" id="jackets" name="cc" value="Jackets"/>
   <label for="shoes">Jackets</label>
  
   <input type="radio" id="jewelry" name="cc" value="Jewelry"/>
   <label for="shoes">Jewelry</label>
   </div>
      
<div class="form-floating mb-3">
    <input class="form-control" type="file" name="productImage" >
    <label>Image:</label>
</div>

<div class="form-floating mb-3">
<input class="form-control" type="text" name="price" required>
<label>Price: </label>
</div>

<!--  
<div class="form-floating mb-3">
<input class="form-control" type="text" name="longTerm" required>
<label>Long Term Quantity</label>
</div> -->

<div class="form-floating mb-3">
<input class="form-control" type="text" name="quantity" required>
<label>Quantity In Stock: </label>
</div>

 <button class="btn-btn primary" type="submit">Add Product</button>
</form>
</div>




</body>
</html>
