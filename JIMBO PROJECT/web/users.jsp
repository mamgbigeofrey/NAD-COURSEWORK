 

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
        <title>USER'S PAGE</title>
        <link rel="stylesheet" href="bootstrap.min.css">
    </head>
    <body>
        
        <h1>USER DETAILS</h1>
        
        <%
            
            Class.forName("com.mysql.jdbc.Driver"); 
             
            try{
          
            
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper","root","");
            Statement st = conn.createStatement();
             
            ResultSet rs=st.executeQuery("select *from users");
            out.println("<table border=1 width=50% height=50% class=table table-success table>");
            out.println("<tr><th>userId</th><th>firstName</th><th>lastName</th><th>email</th><th>age</th><th>address</th><th>timeCreated</th><th>gender</th></tr>");
            
            while(rs.next()){
               int a= rs.getInt("userId");
                String b = rs.getString("firstName");
                String c =rs.getString("lastName");
                String d =rs.getString("email");
                 int e= rs.getInt("age");
                String f =rs.getString("address");
                String g =rs.getString("timeCreated");
                String h =rs.getString("gender");
                out.println(" <tr><td>"+a+"</td><td>"+b+"</td><td>"+c+"</td><td>"+d+"</td> <td>"+e+"</td><td>"+f+"</td><td>"+g+"</td><td>"+h+"</td></tr>");
                             }
            out.println("</table>");
             
             ResultSet Date=st.executeQuery("Select count(*) from user where(timeCreated between '2022-12-09' AND '2022-12-22')");
          
             Date.next();
             out.println(Date.getInt("count(*)")+ " is " + "the number of users from 2022-12-09 to 2022-12-22");
          
            
             
            }   catch(SQLException e){
                out.println("there is an error"+e.getMessage());
           }
            %>
            
    </body>
</html>
