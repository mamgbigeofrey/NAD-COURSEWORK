<%@page import="com.dbConnection.*"%>
<%@page import="com.DBMan.ProductDao"%>
<%@page import="com.models.*"%>
<%@page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html>

    <head><meta name="viewport" content="width=device-width,initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">

        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">


        <title>JIMBO | Home Page</title>
        <style>
            .fa-heart{
                color:white;

            }
            .card-body{
                background-color:#EBA239;

            }


        </style>

    </head>

    <body class="container-fluid">

        <header>
            <%@include file="includes/navBar.jsp" %>
        </header>
        <br>
        <!--<div class="hero">-->

        <!--carousel showcasing-->


        <div class="carousel-container" style="margin-top: 150px; width:90%;">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <img src="./images/shoesCarousel.jpg" alt="shoes" style="width:100%;">
                        <!--<h3>YOU GET NICE SHOES</h3>-->
                    </div>

                    <div class="item">
                        <img src="./images/shirtsCarousel.jpg" alt="shirts" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="./images/jewelleryCarousel.jpg" alt="jewellery" style="width:100%;">
                    </div> <div class="item">
                        <img src="./images/jewelleryCarousel.jpg" alt="jewellery" style="width:100%;">
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Prev</span>
                </a>

                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <!--<span class="sr-only">Next</span>-->
                </a>
            </div>
        </div>




        <div class="container-fluid-section product-section-container">
            <div id="product-section">

                <%
  ProductDao pd = new ProductDao(DbCon.getConnection());
  List<Product> products = pd.getAllProducts();
  ArrayList<Cart> cart_list = (ArrayList<Cart>)request.getSession().getAttribute("cart-list");
  if (cart_list != null) {
          request.setAttribute("cart_list", cart_list);
  }
                %>  

                <br>
                <h2 id="shirts-section">SHIRTS</h2>
                <br>
                <br>

                <div class="products-container">
                    <%
                            if (!products.isEmpty()) {
                                    for (Product p : products) {
                                    
                                        if(p.getCategory().equals("shirts")){
                    %>
                    <div class="product-card contentCard">
                        <div class="product-tumb">
                        <img src="product-image/shirts/<%=p.getImage()%>" alt="">
                        </div>
                        <div class="product-details">
                            <span class="product-catagory">Category: $<%=p.getCategory()%></span>
                            <h4><a href=""><%=p.getName() %></a></h4>
                            <div class="product-bottom-details">
                                <div class="product-price"><small>Price: $<%=p.getPrice() %></small></div>
                                <div class="product-links">
                                    <a  href=""><i class="fa fa-heart"></i></a>
                                    <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                                    <a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add To Cart<i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                    } }
                    } else {
                    out.println("There is no products");
                    }
                    %>
                </div> <br>
                <br>
                <br>


                <h2 id="jackets-section">JACKETS</h2>
                <br>
                <br>
                <div class="products-container">
                    <%
                            if (!products.isEmpty()) {
                                    for (Product p : products) {
                                    
                                        if( p.getCategory().equals("jackets")){
                    %>
                          <div class="product-card contentCard">
                        <div class="product-tumb">
                        <img src="product-image/jackets/<%=p.getImage()%>" alt="">
                        </div>
                        <div class="product-details">
                            <span class="product-catagory">Category: $<%=p.getCategory()%></span>
                            <h4><a href=""><%=p.getName() %></a></h4>
                            <div class="product-bottom-details">
                                <div class="product-price"><small>Price: $<%=p.getPrice() %></small></div>
                                <div class="product-links">
                                    <a  href=""><i class="fa fa-heart"></i></a>
                                    <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                                    <a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add To Cart<i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    } }
                    } else {
                    out.println("There is no products");
                    }
                    %>
                </div>
                <br>
                <br>
                <br>

                <h2 id="shoes-section">SHOES</h2>
                <br>
                <br>
                <div class="products-container">

                    <%
                            if (!products.isEmpty()) {
                       
                                    for (Product p : products) {
                                    
                                        if( p.getCategory().equals("shoes")){
                    %>
                       <div class="product-card contentCard">
                        <div class="product-tumb">
                        <img src="product-image/shoes/<%=p.getImage()%>" alt="">
                        </div>
                        <div class="product-details">
                            <span class="product-catagory">Category: $<%=p.getCategory()%></span>
                            <h4><a href=""><%=p.getName() %></a></h4>
                            <div class="product-bottom-details">
                                <div class="product-price"><small>Price: $<%=p.getPrice() %></small></div>
                                <div class="product-links">
                                    <a  href=""><i class="fa fa-heart"></i></a>
                                    <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                                    <a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add To Cart<i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    }  }
                    } else {
                    out.println("There is no products");
                    }
                    %>
                </div>
                <br>
                <br>
                <br>

                <h2 id="jewellery-section">JEWELLERY</h2>
                <br>
                <br>

                <div class="products-container">

                    <%
                            if (!products.isEmpty()) {
                       
                                    for (Product p : products) {
                                   
                                        if( p.getCategory().equals("jewellery")){
                    %>
                   <div class="product-card contentCard">
                        <div class="product-tumb">
                        <img src="product-image/jewellery/<%=p.getImage()%>" alt="">
                        </div>
                        <div class="product-details">
                            <span class="product-catagory">Category: <%=p.getCategory()%></span>
                            <h4><a href=""><%=p.getName() %></a></h4>
                            <div class="product-bottom-details">
                                <div class="product-price"><small>Price: $<%=p.getPrice() %></small></div>
                                <div class="product-links">
                                    <a  href=""><i class="fa fa-heart"></i></a>
                                    <a class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
                                    <a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark">Add To Cart<i class="fa fa-shopping-cart"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                    }  }
                    } else {
                    out.println("There is no products");
                    }
                    %>
                </div>
                <br>
                <br>
                <br>


            </div>
        </div>


        <br>
        <br>
        <!--</div>-->
        <footer>
            <div id="nad-project">
                <small>NAD PROJECT</small>
            </div>




        </footer>
        <script src="js/style.js"></script>
        <script src="https://kit.fontawesome.com/b53e7ecf2c.js" crossorigin="anonymous"></script>

        <script>
//            var heartShirts = document.getElementsByClassName("heart-shirts");
//            heartShirts.addEventListener('click',Toggle());
//            function Toggle(){
//                heartShirts.style.color='red';
//            }
//      


        </script>
<!--        <script>
            let sidebar = document.querySelector(".sidebar");
            let sidebarBtn = document.querySelector(".sidebarBtn");
            sidebarBtn.onclick = function () {
                sidebar.classList.toggle("active");
                if (sidebar.classList.contains("active")) {
                    sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
                } else
                    sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
            };
        </script>-->
    </body>
</html>