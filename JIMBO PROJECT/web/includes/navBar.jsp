<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}

%>  





<nav>
    <div id="header1">
                <span>
                   <a href="index.jsp"><h2> JIMBO</h2></a>
                </span>
        <div id="sign-in">
            <a href="index.jsp">HOME</a>
            <a href="#">CONTACT US</a>
            <%if(auth != null){
            
         %>
         <a href="orders.jsp">ORDERS</a>
            <a href="log-out">LOGOUT</a>
            <%}else{%>
            <a href="user_login.jsp">LOGIN</a>
            <%}%>
          
        </div>

    </div>
    <hr style="border:2px solid black;">
    <div id="header2">
        <div id="category-list">
            <a class="category-list" href="#shoes-section">SHOES</a>
            <a class="category-list" href="#jackets-section">JACKETS</a>
            <a class="category-list" href="#jewellery-section">JEWELLERY</a>
            <a class="category-list" href="#shirts-section">SHIRTS</a>
        </div>
        <div id="header2-left">
            <a href="#">ABOUT</a>
                      	 <a class="nav-link" href="cart.jsp">cart<span class="badge badge-danger">${cart_list.size()}</span> </a>
                         <!--<i class="fa-solid fa-cart-shopping fa-2xl"></i>-->

        </div>
    </div>
    </nav>