<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <%@page import="JAVAFILES.DBConnection" %>
        <%@page import="java.sql.*" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="ISO-8859-1">
                <link rel="stylesheet" href="css/bootstrap.css">
                <link href="css/styles.css" type="text/css" rel="stylesheet" />
                <link rel="stylesheets" href="css/bootstrap.css">
                <title>JIMBO | ADMIN | ALLOCATE</title>
                <style>
                    body {
                        font-family: Tahoma, Arial, sans-serif;
                        width: 100vw;
                        margin: 0;
                        overflow-x: hidden;

                    }

                    .b {
                        padding: 20px;
                        align-items: center;
                    }

                    .btn {
                        margin-left: 500px;
                    }

                    .container {
                        width: 85%;
                        height: 90%;
                        border: 1;
                        margin auto auto;
                        color: rgb(0, 64, 128);
                        border-radius: 5px;
                        background-color: white;
                        font-size: 20px;
                        font-weight: 10px;
                    }

                    .col {
                        margin: 10px;
                        text-align: center;
                        border
                    }

                    .choices {
                        width: 60%;
                        margin: auto auto;
                        padding: 10px;
                        color: pink;
                        border-radius: 5px;
                        background-color: rgb(0, 64, 128);
                        align-items: center;
                    }

                    .row {
                        margin: 10px;
                        text-align: center;
                    }

                    .form h3 {
                        color: rgb(0, 64, 128);
                        background-color: white;
                        align-items: center;
                        margin: auto auto 20px auto;
                        text-align: center;
                        width: 85%;
                    }

                    .form {
                        width: 100%;
                        margin: auto auto;
                        padding: 20px 0 20px 0;
                        align-items: center;

                    }
                </style>
            </head>

            <body>

                <form class="form mx-5 my-5" method="post" action="Allocate">
                    <h3 class="message">${message}</h3>
                    <div class="container">



                        <header style="text-align:center"><b>STAFF ALOCATION</b></header>
                        <% Statement t=null; DBConnection c=new DBConnection();
                        t=c.getStatement(); 
                        int Total_staff=0;
                        int allocated=0;
                        %>


                      <div class="row">
                          <div scope="col" class="col-1">Select</div>
                          <div scope="col" class="col-1">StaffID</div>
                          <div scope="col" class="col-4">Staff Name</div>
                          <div scope="col" class="col-4">Email Address</div>
                          <div scope="col" class="col-2">Age</div>
                          <!--<th></th>  -->
                      </div>

                      <% ResultSet s=t.executeQuery("SELECT COUNT(staffID) AS A from staff");
                      while(s.next()) {
                          Total_staff=s.getInt("A");
                          allocated=Total_staff/4;
                          }%>
                          <input type="hidden" name="total" value="<%=Total_staff %>">
                          <% ResultSet rs=t.executeQuery("SELECT * FROM staff WHERE status='PENDING' ");

                                   while (rs.next()){ %>

                              <div class="row">
                                  <div class="col-1">
                                  <input class="form-check-input" type="checkbox" name="selected" onclick="EmployeeSelection(<%=allocated %>)" value="<%= rs.getString("staffID") %>"  >
                                  </div>
                                  <div scope="col" class="col-1"><%= rs.getString("staffID") %></div>
                                  <div class="col-4"><%= rs.getString("firstName") %> <%=rs.getString("lastName") %></div>
                                  <div class="col-4"><%=rs.getString("email")%></div>
                                  <div class="col-2"><%=rs.getInt("age")%></div>

                              </div>

                              <% } %>

                                  <div class="row choices">
                                      <div class="form-check">
                                          <input class="form-check-input" type="radio" name="choice" value="1">                       
                                          <label class="">SHOES</label>
                                      </div>

                                      <div class="form-check">
                                          <input class="form-check-input" type="radio" name="choice" value="2">
                                          <label class="form-check-label">SHIRTS</label>
                                      </div>
                                      
                                      <div class="form-check">
                                          <input class="form-check-input" type="radio" name="choice" value="3">
                                          <label class="form-check-label">JACKETS</label>
                                      </div>

                                      <div class="form-check">
                                          <input class="form-check-input" type="radio" name="choice" value="4">
                                          <label class="form-check-label">JEWELLERY</label>
                                      </div>
                                  </div>

                                  <div class="b"><input type="submit" class="btn btn-primary" value="ALLOCATE">
                                  </div>
                    </div>
                </form>

                <script type="text/javascript">


                    function EmployeeSelection(allocated) {

                        var checkboxes = document.getElementsByName("selected");


                        var numberOfCheckedItems = 0;
                        for (var i = 0; i < checkboxes.length; i++) {
                            if (checkboxes[i].checked)
                                numberOfCheckedItems++;
                        }
                        if (numberOfCheckedItems > allocated) {
                            alert("You can't select more than " + allocated + " employees!");
                            return false;
                        }
                    } 
                </script>
            </body>

            </html>