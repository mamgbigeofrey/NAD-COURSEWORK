<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/styles.css"  type="text/css" rel="stylesheet"   />
<title>JIMBO | MonthlyPerformance</title>
</head>
<body>

<div class="container">
	<form class="form" method="POST" action="ButtonReallocate">
	<div class="form-floating mb-3">
	<input class="form-control" type="number" place value="Eg. 1 for January" name="month">
	<label>Month for Reallocation: </label>
	</div>
	<input class="btn" type="submit" value="REALLOCATE">
	</form>
</div>

</body>
</html>