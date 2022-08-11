<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
//    request.setAttribute("person", auth);
String name = auth.getName();
}

%>  





<nav>
    <div id="header1">
        <span id="header1-left">
                    <%if(auth != null){%>
                    <i class="fa-solid sidebarBtn fa-bars"></i>
                       <%}
%>
                   <a href="index.jsp"><h2> JIMBO</h2></a>
                </span> 
        <div id="sign-in">
            <a href="index.jsp">HOME</a>
            <a href="#">CONTACT US</a>
            <%if(auth != null){
            
         %>
      
         <a href="orders.jsp">ORDERS</a>
            <a href="log-out">LOGOUT</a>
            <a href="user-dashboard.jsp"> <i class="fa-solid fa-circle-user"></i></a>
           
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
            <a href="./about.jsp" target="_blank">ABOUT</a>
                      	 <a class="nav-link" href="cart.jsp">Cart<i class="fa-solid fa-cart-shopping fa-2xl"></i><span class="badge badge-success" style="red">${cart_list.size()}</span> </a>
                        

        </div>
    </div>
    </nav>