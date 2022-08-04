<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JIMBO | Home Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="bootstrap/bootstrap.min.css">

</head>

<body class="container-fluid">
<header>
    <div id="header1">
                <span>
                    <h2>JIMBO</h2>
                </span>
        <div id="sign-in">
            <a href="#">CONTACT US</a>
            <a href="pages/user_login.jsp">SIGN IN(AS USER)</a>
             <a href="pages/admin_login.jsp">SIGN IN(AS ADMIN)</a>

        </div>

    </div>
    <hr>
    <div id="header2">
        <div id="category-list">
            <a class="category-list" href="#">SHOES</a>
            <a class="category-list" href="#">JACKETS</a>
            <a class="category-list" href="#">JEWELLERY</a>
            <a class="category-list" href="#">SHIRTS</a>
        </div>
        <div id="header2-left">
            <a href="#">ABOUT</a>
            <img id="cart-img" src="./fontawesome-free-6.1.2-web/svgs/solid/cart-shopping.svg">

        </div>
    </div>
</header>
<br>
<div class="container-fluid-section">
    <div id="product-section">
    <br>
        <h2>SHIRTS</h2>

    <div class="shirts products">
        <% int counter = 0;


        while (counter < 14){
            out.print("<div class=\"product-card\"></div>");
            counter ++;}
        %>
    </div
    <br>
    <h2>JACKETS</h2>
    <div class="jackets products">

        <% int counter1 = 0;
            while (counter1 < 14){
                out.print("<div class=\"product-card\"></div>");
                counter1 ++;}
        %>
    </div>
    <br>
    <h2>SHOES</h2>
    <div class="shoes products">
        <% int counter2 = 0; while (counter2 < 14){
            out.print("<div class=\"product-card\"></div>");
            counter2 ++;}
        %>
    </div>
    <br>
    <h2>JEWELLERY</h2>
    <div class="jewellery products">
        <% int counter3 = 0;
        while (counter3 < 14){
            out.print("<div class=\"product-card\"></div>");
            counter3 ++;}
        %>
    </div>
    <br>
    <br>
</div>
</div>
<footer>
    <div id="nad-project">
        <small>NAD PROJECT</small>
    </div>
</footer>
</body>
</html>