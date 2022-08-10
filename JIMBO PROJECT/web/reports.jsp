 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>

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
<%!Integer y[]={};%>
<%!String x[]={};%>
<%ArrayList<Integer> yvalues=new ArrayList<Integer>(Arrays.asList(y));%>
<%ArrayList<String> xvalues=new ArrayList<String>(Arrays.asList(x));%>
<%!ResultSet res;%>

<%!Integer pay[]={};%>
<%!String name[]={};%>
<%ArrayList<Integer> pricelabel=new ArrayList<Integer>(Arrays.asList(pay));%>
<%ArrayList<String> namelabel=new ArrayList<String>(Arrays.asList(name));%>
<%!ResultSet rest;%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reports Page</title>
        <link rel="stylesheet" href="css/grid.css"/>
        <link rel="stylesheet" href="css/">
    </head>
    <body>
        <h1>REPORTS</h1>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper", "root", "");
                    Statement st = conn.createStatement();
                    //out.println("Connected!");
                    //BAR CHART
                    res=st.executeQuery("select * from products");
                    while(res.next()){
                        xvalues.add("'"+res.getString("productName")+"'");
                        yvalues.add(res.getInt("price"));
                    }
                    //out.println(yvalues);
                    //PIE CHART
                    rest=st.executeQuery("select * from products");
                    while(rest.next()){
                        namelabel.add("'"+rest.getString("productName")+"'");
                        pricelabel.add(rest.getInt("price"));
                    }
                    //out.println(pricelabel);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } catch(ClassNotFoundException e) {
                e.printStackTrace();
            }
        %>
        <div
        <div class="main">
        <div class="charts">
           
            <div class="chart">
                <div>
            <canvas id="line"></canvas>
                </div>
            </div>
          
            <div class="chart">
                <div>
            <canvas id="r2"></canvas>
                </div>
            </div>
        </div>
        </div>
        
        
        
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

        <script src="./js/chart.min.js"></script>
        <script>
    
var ctx = document.getElementById("line").getContext("2d");
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <%out.println(xvalues);%>,
        datasets: [{
            label: 'Bar chart',
            data: <%out.println(yvalues);%>,
            backgroundColor: [
                'rgba(233,18,0)'

            ],
            borderColor: 'rgb(254, 99, 99)',
            borderWidth: 1
        }
        
    ]
    },
    options: {
        responsive: true,
        scales:{
        y:{
            title:{
                display:true,
                text:"ylabel"
            }
        },
        x:{
            title:{
                display:true,
                text:"xLABEL"
            }
        }
        }
    }
});


        </script>
        <script>
  var ctx2 = document.getElementById('r2').getContext('2d');
var myChart2 = new Chart(ctx2, {
    type: 'pie',
    data: {
        labels: <%out.println(namelabel);%>,

        datasets: [{
            label: 'Pie Chart',
            data: <%out.println(pricelabel);%>,
            backgroundColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderColor: [
                'rgba(41, 155, 99, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(120, 46, 139,1)'

            ],
            borderWidth: 1
        }]

    },
          options: {
            responsive: true,
            indexAxis: 'y',
            "maintainAspectRatio": false
        }
});
</script>

    </body>
</html>
