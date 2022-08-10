<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Adding Products</title>
<link rel="stylesheet" href="bootstrap.css">
 <link rel="stylesheet" href="css/style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>


<style>
    .div{
        width: 80vw;
        margin: auto auto;
        background: #f5f5f5;
        margin-top: 40px;
    }
    .div h2{
        color: black;
        width: 70%;
        margin-top: 30px;
        margin: auto;
    }
    
    .containers{
        width:70%;
        margin:auto auto;
        background: white;
        margin-top: 30px;
        margin-bottom: 30px;
    }
    .form-floating input{
        width: 96%;
        margin: auto auto;
        height: 44px;
        margin-top: 5px;
        
    }
    .form-floating{
        margin-bottom: 15px;
    }
    button{
        width: 50%;
        margin: auto;
        color: white;
        background: seagreen;
        height: 44px;
        border-radius: 4px;
        cursor: pointer;
        margin-left: 20%;
    }
    
</style>
</head>
<body>
    <div class="div">

 <h2 style="text-align: center;">Add New Product</h2>
<div class="containers">
<form class="form m-10" action="addingProcess.jsp" method="post">
   
<div class="form-floating mb-3">
    <label>Product Name:</label>
<input class="form-control" type="text" name="productName" required>

</div>
       
<div class="form-floating mb-3">
    <label>Category:</label><!-- comment -->
<select class="form-select" name ="cc" id="cc">
    <option value="">Shoes</option>
    <option value="">Shirts</option>
    <option value="">Jackets</option>
    <option value="">Jewellery</option> 
</select>
       
   </div>
        
<div class="form-floating mb-3">
     <label>Image:</label>
    <input class="form-control" type="file" name="productImage" >
   
</div>

<div class="form-floating mb-3">
    <label>Price: </label>
<input class="form-control" type="text" name="price" required>

</div>

<div class="form-floating mb-3">
    <label>Long Term Quantity</label>
<input class="form-control" type="text" name="longTerm" required>

</div>

<div class="form-floating mb-3">
    <label>Quantity In Stock: </label>
<input class="form-control" type="text" name="quantity" required>

</div>
       
<div class="form-floating mb-3">
    <label>Long Term Period</label>
<input class="form-control" type="text" name="time" required>

</div>

 <button type="submit">Add Product</button>
</form>
</div>
    </div>
    

</body>
<%@include file="includes/footer.jsp" %>
</html>
