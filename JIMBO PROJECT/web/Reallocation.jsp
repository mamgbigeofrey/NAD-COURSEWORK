<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 
   <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/styles.css"  type="text/css" rel="stylesheet"   />
<title>JIMBO | ADMIN | ALL STAFF</title>
</head>
<body style="margin-top: 20px">
    <%
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        if(session.getAttribute("auth")==null){
        response.sendRedirect("admin_login.jsp");
        }
    
    %>

<%
      Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jimboshopper", "root", "");
		Statement st = con.createStatement();


%>
    <h3 style="margin: auto auto; width: 40%; text-align: center;"><b>RECRUITMENT STATISTICS</b></h3>

<table class="table table-striped table-bordered table-secondary " style="width:100px" >

<caption>Recruitment Statistics</caption>
<thead class="table-dark">
	<tr>
	<th scope="col">CATEGORY Line</th>
	<th scope="col">Recruited Staff</th>
	<th scope="col">Slots left </th>
	</tr>
</thead>
<%
	ResultSet rs = st.executeQuery("SELECT allocatedStaff, slots FROM categoryline WHERE lineName='SHORT-TERM'");
	while (rs.next()){

%>

<tr>
<td scope="row">Short-Term</td>
<td ><%=rs.getInt("allocatedStaff") %></td>
<td><%=rs.getInt("slots") %></td>
</tr>
<% 
}
	//count
%>

<%
	ResultSet rs1 = st.executeQuery("SELECT allocatedStaff, slots FROM categoryline WHERE lineName='MID-TERM'");
	while (rs1.next()){

%>
<tr>
	<td scope="row">Mid-Term</td>
	<td><%=rs1.getInt("allocatedStaff") %></td>
	<td><%=rs1.getInt("slots") %></td>
</tr>
<%} %>

<%
	ResultSet rs2 = st.executeQuery("SELECT allocatedStaff, slots FROM categoryline WHERE lineName='LONG-TERM'");
	while (rs2.next()){

%>
<tr>
<td scope="row">Long-Term</td>
<td><%=rs2.getInt("allocatedStaff") %></td>
<td><%=rs2.getInt("slots") %></td>
</tr>
<%} %>
</table>

<div class="mx-5">
<form class="form ml-25"method="post" action="Reallocate" style="width:900px">
<b style="color: white; text-align: center">STAFF DETAILS</b><br><br>
	
	<table class="table caption-top table-hover table-bordered table-info table-striped" id="cap"border="1">
		<thead>
		<caption>SHOES PRODUCT LINE</caption>
		<tr>
			<th scope="col">StaffID</th>
			<th scope="col">Staff Name</th>
			<th scope="col">Email Address</th>
			<th scope="col">Age</th>	
			
		</tr>
		</thead>
		<%
		ResultSet res =st.executeQuery("SELECT * FROM staff WHERE productLineID='1' ");
		
			while (res.next()){
		%>
			
			<tr>
				<td scope="row"><%= res.getString("staffID") %></td>
				<td><%= res.getString("firstName") %> <%=res.getString("lastName") %></td>
				<td> <%= res.getString("email") %></td>
				<td> <%= res.getString("age") %></td>
	
				
						
					<input type="HIDDEN" name="id" value="<%= res.getString("staffID") %>">
				<%-- href = "Reallocate?id='<%=rs.getString("staffID") %>'" --%>
				

				
			</tr>
		
			<%} %>
		
	</table>
	
</form>	

<form class="form ml-25"method="post" action="Reallocate" style="width:900px">

	
	<table class="table caption-top table-hover table-bordered table-info table-striped" id="cap"border="1">
		<thead>
		<caption>SHIRTS PRODUCT LINE</caption>
		<tr>
			<th scope="col">StaffID</th>
			<th scope="col">Staff Name</th>
			<th scope="col">Email Address</th>
			<th scope="col">Age</th>	
			
		</tr>
		</thead>
		<%
		ResultSet res1 =st.executeQuery("SELECT * FROM staff WHERE productLineID='2' ");
		
			while (res1.next()){
		%>
			
			<tr>
				<td scope="row"><%= res1.getString("staffID") %></td>
				<td><%= res1.getString("firstName") %> <%=res1.getString("lastName") %></td>
				<td> <%= res1.getString("email") %></td>
				<td> <%= res1.getString("age") %></td>
	
				
						
					<input type="HIDDEN" name="id" value="<%= res1.getString("staffID") %>">
				<%-- href = "Reallocate?id='<%=rs.getString("staffID") %>'" --%>
				
								
			</tr>
		
			<%} %>
		
	</table>
	
</form>	


<form class="form ml-25" method="post" action="Reallocate" style="width:900px">
	<table class="table caption-top table-hover table-bordered table-info table-striped" id="cap"border="1">
		<thead>
		<caption>JACKETS PRODUCT LINE</caption>
		<tr>
			<th scope="col">StaffID</th>
			<th scope="col">Staff Name</th>
			<th scope="col">Email Address</th>
			<th scope="col">Age</th>	
			
		</tr>
		</thead>
		<%
		ResultSet r =st.executeQuery("SELECT * FROM staff WHERE productLineID='3' ");
		
			while (r.next()){
		%>
			
			<tr>
				<td scope="row"><%= r.getString("staffID") %></td>
				<td><%= r.getString("firstName") %> <%=r.getString("lastName") %></td>
				<td> <%= r.getString("email") %></td>
				<td> <%= r.getString("age") %></td>
				
			
					<input type="HIDDEN" name="id" value="<%= r.getString("staffID") %>">
				<%-- href = "Reallocate?id='<%=rs.getString("staffID") %>'" --%>
				
				
				
			</tr>
		
			<%} %>
		
	</table>
</form>

<form class="form ml-25"method="post" action="Reallocate" style="width:900px">	
		<table class="table caption-top table-hover table-bordered table-info table-striped" id="cap"border="1">
		<thead>
		<caption>JEWELLERY PRODUCT LINE</caption>
		<tr>
			<th scope="col">StaffID</th>
			<th scope="col">Staff Name</th>
			<th scope="col">Email Address</th>
			<th scope="col">Age</th>	

		</tr>
		</thead>
		<%
		ResultSet result =st.executeQuery("SELECT * FROM staff WHERE productLineID='4'");
		
			while (result.next()){
		%>
			
			<tr>
				<td scope="row"><%= result.getString("staffID") %></td>
				<td><%= result.getString("firstName") %> <%=result.getString("lastName") %></td>
				<td> <%= result.getString("email") %></td>
				<td> <%= result.getString("age") %></td>
				
			
					<input type="HIDDEN" name="id" value="<%= result.getString("staffID") %>">
				<%-- href = "Reallocate?id='<%=rs.getString("staffID") %>'" --%>
				
				
				
			</tr>
		
			<%} %>
		
	</table>
</form>
</div>
</body>
</html>