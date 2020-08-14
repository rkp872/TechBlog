<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="ISO-8859-1">
		<title>Sorry ! Something went wrong</title>
		<!-- CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
		<link rel="stylesheet" href="css/style.css">
		<style>
			.banner-background
			{
				clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 59% 100%, 31% 92%, 0 99%, 0 0);
			}
		</style>
</head>
<body>
	<div class="container text-center">
		<img src="img/error.png" class="img-fluid" height="400px" width="400px">
		<h3 class="display-3">Sorry ! Something went wrong ...</h3>
		<%= exception %>
		<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3 mb-3">Home</a>
	</div>
</body>
</html>