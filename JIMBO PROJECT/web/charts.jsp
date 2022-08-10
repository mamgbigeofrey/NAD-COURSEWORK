 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
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
                    out.println(pricelabel);
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
