<%@page import="com.dbConnection.DbCon"%>
<%@page import="com.DBMan.ProductDao"%>
<%@page import="com.models.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
        ProductDao pDao = new ProductDao(DbCon.getConnection());
        cartProduct = pDao.getCartProducts(cart_list);
        double total = pDao.getTotalCartPrice(cart_list);
        request.setAttribute("total", total);
        request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/head.jsp"%>
        <title>JIMBO | Your Cart</title>
        <style>

            .table tbody td{
                vertical-align: middle;
            }

            .btn-incre, .btn-decre{
                box-shadow: none;
                font-size: 25px;
            }
            body{
                height:9000px !important;
            }

            table{

                width:80%;
                margin: auto auto;
            }
            footer{
               
                position:fixed;
                bottom:0;
/*                left:0;
                right:0;*/
            }


         
        </style>
    </head>
    <body>
        <nav>
            <div id="header1">
                <span>
                    <a href="index.jsp"><h2> JIMBO</h2></a>
                </span>
                <div id="sign-in">
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
        </nav>



        <div class="container-fluid cart-display-container">
            <div class="checkout-container">
                <h3>Total Price:UGX ${(total>0)?dcf.format(total):0} </h3>
                <a class="btn btn-success" style="height:30px;  text-align: center" href="cart-check-out">Check Out</a>
            </div>
            <table id="table-cart">
                <thead>
                    <tr>
                        <th scope="col"  >Name</th>
                        <th  scope =col>Category</th>
                        <th scope="col" >Price</th>
                        <th  scope="col">Buy Now</th>
                        <th scope="col">Cancel</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if (cart_list != null) {
                            for (Cart c : cartProduct) {
                    %>
                    <tr>
                        <td><%=c.getName()%></td>
                        <td><%=c.getCategory()%></td>
                        <td><%= dcf.format(c.getPrice())%></td>

                        <td>
                            <form action="order-now" method="post" class="form-inline">
                                <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
                                <div class="form-group d-flex  ">
                                    <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
                                    <input type="text" name="quantity" style="padding: 15px 0; text-align: center; margin: 0 10px 0 10px ;width:4em;" value="<%=c.getQuantity()%>" readonly> 
                                    <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a> 

                                </div>
                                <button type="submit" style=" width: 20%; margin-left: 1em;" class="btn-success">Buy</button>
                            </form>
                        </td>
                        <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
                    </tr>

                    <%
				}}%>
                </tbody>
            </table>
        </div>
             
        
    </body>
</html>