<%-- 
    Document   : admin_dashboard
    Created on : Aug 3, 2022, 8:48:30 PM
    Author     : Mamgbi Geofrey
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="jakarta.servlet.ServletException"%>
<%@page import="jakarta.servlet.http.HttpServlet"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.util.*,java.sql.*,java.time.*,java.time.format.DateTimeFormatter"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.models.*"%>
<%@page import="dbConnection.*"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title>  Admin Dashboard | Jimbo </title>
    <link rel="stylesheet" href="css/dashboard_style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style>
         .sidebar h4{
             color:rgba(0,0,0,0.8);
             
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
  <div class="sidebar">
    <div class="logo-details">
      <i class='bx bxl-c-plus-plus'></i>
      <span class="logo_name">Jimbo</span>
    </div>
      <ul class="nav-links">
        <li>
          <a href="#" class="active">
            <i class='bx bx-grid-alt' ></i>
            <span class="links_name">DASHBOARD</span>
          </a>
        </li>
        
        <h4>Product Management</h4>
        
        <li>
          <a href="products.jsp">
            <i class='bx bx-list-ul' ></i>
            <span class="links_name">Add Product</span>
          </a>
        </li>
        <li>
          <a href="users.jsp">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">View Product</span>
          </a>
        </li>
        <li>
          <a href="charts.jsp">
            <i class='bx bx-pie-chart-alt-2' ></i>
            <span class="links_name">Update Product</span>
          </a>
        </li>
         <h4>Staff Management</h4>
        <li>
          <a href="staffRecruitment.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Recruit Staff</span>
          </a>
        </li>
        <li>
          <a href="StaffAllocation.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Allocate staff</span>
          </a>
        </li>
        <li>
          <a href="monthlyPerformancejsp.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Reallocate Staff</span>
          </a>
        </li>
        <li>
          <a href="Reallocation.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Staff Details</span>
          </a>
        </li>
        
        
        <h4>System Reports</h4>
        <li>
          <a href="reports.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Recruit Staff</span>
          </a>
        </li>
        <li>
          <a href="#">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Allocate staff</span>
          </a>
        </li>
        <li>
          <a href="reports.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Reallocate Staff</span>
          </a>
        </li>
        <li>
          <a href="reports.jsp">
            <i class='bx bx-coin-stack' ></i>
            <span class="links_name">Staff Details</span>
          </a>
        </li>
        <li class="log_out">
            <a href="admin-logout">
            <i class='bx bx-log-out'></i>
            <span class="links_name">
                     <button type="submit" style="background: transparent; color: white; 
                            border: none;cursor: pointer;">LOGOUT</button>
                
            </span>
          </a>
        </li> 
      </ul>
  </div>
  <section class="home-section">
    <nav>
      <div class="sidebar-button">
        <i class='bx bx-menu sidebarBtn'></i>
        <span class="dashboard">Dashboard</span>
      </div>
  
      <div class="profile-details">
       <span class="admin_name">
            <%if(session.getAttribute("auth")!=null){
             Admin auth = (Admin) session.getAttribute("auth");
              out.print("Logged in as "+ auth.getUsername()) ;}
            
            %>
            <i class="fa-solid fa-user-shield" style="color:#081d45"></i> 
        </span>
       </div>
    </nav>

    <div class="home-content">
      <div class="overview-boxes">
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Orders</div>
            <div class="number">
                <%
                    Class.forName("com.mysql.jdbc.Driver"); 
                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper","root","");
                    Statement st = conn.createStatement();
                    ResultSet rs2=st.executeQuery("select count(*) from orders ");
                    rs2.next();
                    out.print(rs2.getInt("count(*)")+ "   Orders\n");
                    %>

            </div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from Today</span>
            </div>
          </div>
          <i class='bx bx-cart-alt cart'></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Customers</div>
            <div class="number" style="font-size: 20px;">
                <%
                    ResultSet rs=st.executeQuery("select count(*) from users where gender='Male'");
                    rs.next();
                    out.print(rs.getInt("count(*)")+ "   Males\n");
                    %>
                    <br>
                    <%
                    
                     ResultSet rs1=st.executeQuery("select count(*) from users where gender='Female'");
                    rs1.next();
                    out.println(rs1.getInt("count(*)")+ " Females");
                     //out.println(rs1.getInt("count(*)")+ "    Females");
                %>
            </div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from Today</span>
            </div>
          </div>
          <i class='bx bxs-cart-add cart two' ></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Stock Cost</div>
            <div class="number">
                <%
                ResultSet rs3=st.executeQuery("select sum(price*quantityInStock)  from products ");
                    rs3.next();
                    out.println(rs3.getInt("sum(price*quantityInStock)")+ " Shs.");
                    %>
                
            </div>
            <div class="indicator">
              <i class='bx bx-up-arrow-alt'></i>
              <span class="text">Up from today</span>
            </div>
          </div>
          <i class='bx bx-cart cart three' ></i>
        </div>
        <div class="box">
          <div class="right-side">
            <div class="box-topic">Total Staff</div>
            <div class="number">11,086</div>
            <div class="indicator">
              <i class='bx bx-down-arrow-alt down'></i>
              <span class="text">Down From Today</span>
            </div>
          </div>
          <i class='bx bxs-cart-download cart four' ></i>
        </div>
      </div>

      <div class="sales-boxes">
        <div class="recent-sales box">
          <div class="title">Recent Sales</div>
          <div class="sales-details">
            <ul class="details">
              <li class="topic">Date</li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
              <li><a href="#">02 Jan 2021</a></li>
            </ul>
            <ul class="details">
            <li class="topic">Customer</li>
            <li><a href="#">Alex Doe</a></li>
            <li><a href="#">David Mart</a></li>
            <li><a href="#">Roe Parter</a></li>
            <li><a href="#">Diana Penty</a></li>
            <li><a href="#">Martin Paw</a></li>
            <li><a href="#">Doe Alex</a></li>
            <li><a href="#">Aiana Lexa</a></li>
            <li><a href="#">Rexel Mags</a></li>
             <li><a href="#">Tiana Loths</a></li>
          </ul>
          <ul class="details">
            <li class="topic">Sales</li>
            <li><a href="#">Delivered</a></li>
            <li><a href="#">Pending</a></li>
            <li><a href="#">Returned</a></li>
            <li><a href="#">Delivered</a></li>
            <li><a href="#">Pending</a></li>
            <li><a href="#">Returned</a></li>
            <li><a href="#">Delivered</a></li>
             <li><a href="#">Pending</a></li>
            <li><a href="#">Delivered</a></li>
          </ul>
          <ul class="details">
            <li class="topic">Total</li>
            <li><a href="#">$204.98</a></li>
            <li><a href="#">$24.55</a></li>
            <li><a href="#">$25.88</a></li>
            <li><a href="#">$170.66</a></li>
            <li><a href="#">$56.56</a></li>
            <li><a href="#">$44.95</a></li>
            <li><a href="#">$67.33</a></li>
             <li><a href="#">$23.53</a></li>
             <li><a href="#">$46.52</a></li>
          </ul>
          </div>
          <div class="button">
              <a href="#">See All</a>
          </div>
        </div>
        <div class="top-sales box">
          <div class="title">Top Seling Product</div>
          <ul class="top-sales-details">
            <li>
            <a href="#">
              <img src="pages/admin-dashboard/images/sunglasses.jpg" alt="">
              <span class="product">Vuitton Sunglasses</span>
            </a>
            <span class="price">$1107</span>
          </li>
          <li>
            <a href="#">
              <img src="pages/admin-dashboard/images/jeans.jpg" alt="">
              <span class="product">Hourglass Jeans </span>
            </a>
            <span class="price">$1567</span>
          </li>
          <li>
            <a href="#">
              <img src="pages/admin-dashboard/images/nike.jpg" alt="">
              <span class="product">Nike Sport Shoe</span>
            </a>
            <span class="price">$1234</span>
          </li>
          <li>
            <a href="#">
              <img src="pages/admin-dashboard/images/scarves.jpg" alt="">
              <span class="product">Hermes Silk Scarves.</span>
            </a>
            <span class="price">$2312</span>
          </li>
          <li>
            <a href="#">
              <img src="pages/admin-dashboard/images/blueBag.jpg" alt="">
              <span class="product">Succi Ladies Bag</span>
            </a>
            <span class="price">$1456</span>
          </li>
          <li>
            <a href="#">
              <img src="pages/admin-dashboard/images/bag.jpg" alt="">
              <span class="product">Gucci Womens's Bags</span>
            </a>
            <span class="price">$2345</span>
          <li>
            <a href="#">
              <img src="pages/admin-dashboard/images/addidas.jpg" alt="">
              <span class="product">Addidas Running Shoe</span>
            </a>
            <span class="price">$2345</span>
          </li>
<li>
            <a href="#">
              <img src="pages/admin-dashboard/images/shirt.jpg" alt="">
              <span class="product">Bilack Wear's Shirt</span>
            </a>
            <span class="price">$1245</span>
          </li>
          </ul>
        </div>
      </div>
    </div>
  </section>
        <script src="https://kit.fontawesome.com/b53e7ecf2c.js" crossorigin="anonymous"></script>

  <script>
   let sidebar = document.querySelector(".sidebar");
let sidebarBtn = document.querySelector(".sidebarBtn");
sidebarBtn.onclick = function() {
  sidebar.classList.toggle("active");
  if(sidebar.classList.contains("active")){
  sidebarBtn.classList.replace("bx-menu" ,"bx-menu-alt-right");
}else
  sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
};
 </script>

</body>
</html>

