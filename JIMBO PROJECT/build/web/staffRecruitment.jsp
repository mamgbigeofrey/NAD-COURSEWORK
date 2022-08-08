<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@page import="JAVAFILES.DBConnection" %>
   <%@page import="java.sql.*" %>
<%--<%@ include file="DBConnection.java" flush="true" %>--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="styles.css"  type="text/css" rel="stylesheet"   />
<title>Insert title here</title>
</head>
<body>

<div class="container">

<h2>STAFF RECRUITMENT FORM</h2>

<form class="form" method ="post" action="Recruit">
		<label>First Name:</label>
		<input type="text" name="fName"><br><br>
		
		<label>Last Name:</label>
		<input type="text" name="lName"><br><br>
		
		<label>Address:</label>
		<input type="text" name="address"><br><br>
		
		<label>Email Address:</label>
		<input type="email" name="email"><br><br>
		
		<label>Phone Contact:</label>
		<input type="number" name="tel"><br><br>
		
		<label>Age:</label>
		<input type="number" name="age">
		
		<label>Gender:</label>
		<select name="gender">
		<option value="Null">None</option>
		<option value="MALE">MALE</option>
		<option value="FEMALE">FEMALE</option>
		</select><br><br>
		
		<label>Product Line: </label>
		<select name="productLine">
		<option value="Short-term">Short-Term</option>
		<option value="Mid-Term">Mid-Term</option>
		<option value="Long-term">Long-Term</option>
		</select><br><br>
		
		
		
		<div class="btn">
		<input type="submit" name="save" value="ADD STAFF">
		<input type="reset" name="reset" value="CLEAR"><br><br>
		</div>

</form>

<%
Statement t=null;
DBConnection c= new DBConnection();
t=c.getStatement();

%>
<b>RECRUITMENT STATISTICS</b>
<table border="1">

<tr>
<th>Product Line</th>
<th>Recruited Staff</th>
<th>Slots left </th>
</tr>

<%
ResultSet rs = t.executeQuery("SELECT COUNT(productLine) AS A FROM staffrecruit WHERE productLine='Short-Term' ");
int count =0;
while (rs.next()){
	count = rs.getInt("A");
}
%>
<tr>
<td>Short-Term</td>
<td></td>
<td></td>
</tr>

<tr>
<td>Mid-Term</td>
<td></td>
<td></td>
</tr>

<tr>
<td>Long-Term</td>
<td></td>
<td></td>
</tr>

</table>


</div>
</body>
</html>