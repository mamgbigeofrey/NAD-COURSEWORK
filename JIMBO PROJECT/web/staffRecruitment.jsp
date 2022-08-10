<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="DBConnection" %>
   <%@page import="java.sql.*" %>
<%--<%@ include file="DBConnection.java" flush="true" %>--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/styles.css"  type="text/css" rel="stylesheet"   />
<title>JIMBO | ADMIN | RECRUIT</title>

<style>

.container{
	
	width:90%;
	border:1;
	margin-left:800px;
	color:rgb(0, 64, 128);
	border-radius:5px;
	background-color:white;
	font-size:20px;
	font-weight:10px;
}

</style>
<title>STAFF RECRUITMENT</title>
</head>
<body>

<div class="container">

<h2>STAFF RECRUITMENT FORM</h2>

<form class="form m-10" method ="post" action="Recruit" style="width:400px">
		<div class="form-floating mb-3">
		<input class="form-control" type="text" name="fName">
		<label>First Name:</label>
		</div>
		
		<div class="form-floating mb-3">
		<input class="form-control" type="text" name="lName">
		<label>Last Name:</label>		
		</div>
		

		<div class="form-floating mb-3">
		<input class="form-control" type="email" name="email">
		<label>Email Address:</label>
		</div>
		
		<div class="form-floating mb-3">		
		<input class="form-control" type="text" name="address">
		<label> Address:</label>
		</div>
		
		<div class="form-floating mb-3">		
		<select class="form-select" name="gender">
		<option selected value="Null">None</option>
		<option value="MALE">MALE</option>
		<option value="FEMALE">FEMALE</option>
		</select>
		<label>Gender:</label>
		</div>
		
		<div class="form-floating mb-3">		
		<input class="form-control" type="number" name="age">
		<label> Age:</label>
		</div>
		
		
		<div class="btn">
		<input type="submit" class="btn btn-primary" name="save" value="ADD STAFF">
		<input type="reset" class="btn btn-primary" name="reset" value="CLEAR"><br><br>
		</div>

</form>

<%
Statement t=null;
DBConnection c= new DBConnection();
t=c.getStatement();


%>




</div>
</body>
</html>