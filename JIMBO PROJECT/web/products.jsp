 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PRODUCTS TABLE PAGE</title>
        <link rel="stylesheet" href="bootstrap.min.css">
        <link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" >
    </head>
    <body>
        
        <h1>PRODUCTS TABLE</h1>
        
        <%
            
            Class.forName("com.mysql.jdbc.Driver"); 
           
            try{
          
            
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper","root","");
            Statement st = conn.createStatement();
             
            ResultSet rs=st.executeQuery("select *from products");
            out.println("<table border=1 width=50% height=50% class=table table-success table-striped>");
            out.println("<tr> <th>productId</th><th>productName</th><th>category</th><th>Price</th><th>quantityInStock</th></tr>");
            
            while(rs.next()){
               int m= rs.getInt("productID");
                String n = rs.getString("productName");
                String p =rs.getString("category");
                
//                ;
                String r =rs.getString("Price");
               
//               
                int q =rs.getInt("quantityInStock");
               
               
                out.println(" <tr><td>"+m+"</td><td>"+n+"</td><td>"+p+"</td><td>"+r+"</td><td>"+q+"</td> </tr>");
                             }
            out.println("</table>");
             
             ResultSet ret=st.executeQuery("Select count(*) from products where category='jewellery'");
            ;
          
             ret.next();
            
             out.println(ret.getInt("count(*)")+ " is " + "the number of jewellery products produced");
              
            
            
            
             
            }   catch(SQLException e){
                out.println("there is an error"+e.getMessage());
            }
            %>
            
    </body>
</html>

