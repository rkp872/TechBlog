<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>Register | TechBlog</title>
</head>
<body>
	<%@include file="normalNavbar.jsp" %>
	<main class="primary-background  banner-background" style="padding-bottom:80px;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
					<span class="fa fa=3x fa-user-circle"></span>
					<br> 
					Register Here
					</div>
						<div  class="card-body" >
							<form id="reg-form" action="registerServlet" method="post">
								
								<div class="form-group">
							    <label for="Name">Name</label>
							    <input name="user_name" type="text" class="form-control" id="Name" aria-describedby="emailHelp" placeholder="Rachit Sakshena">
							  </div>
							
							
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="rachit872@gmail.com">
							    
							  </div>
							  
							  							  
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1">
							  </div>
							  
							  <div class="form-group">
							    <label for="gender">Select Gender</label>
							    <br>
							    <input type="radio" id="gender" name="user_gender" value="Male">Male
							    <input type="radio" id="gender"  name="user_gender" value="Female">Female
							  </div>
							  
							  <div class="form-group">
							  	<textarea name="about" class="form-control"  rows="5" placeholder="Enter something about Yourself"></textarea>
							  </div>
							  
							  <div class="form-group form-check">
							    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
							    <label class="form-check-label" for="exampleCheck1">Agree terms and condition</label>
							  </div>
							  <br>
							  <div class="container text-center" id="loader" style="display:none;">
							  	<span class="fa fa-refresh fa-spin fa-4x"></span><br>
							  	<h4>Please Wait</h4>
							  </div>
							  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
								
							</form>
						</div>
			
				</div>
			</div>
		</div>
		
	</main>

	<!-- Javascript -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
		
		<script>
			$(document).ready(function()
			{
				console.log("loaded....")
				
				$('#reg-form').on('submit',function(event)
				{
					event.preventDefault();
					
					let form = new FormData(this);
					
					$("#submit-btn").hide();
					$("#loader").show();
					//send register servlet
					
					$.ajax({
						url: "registerServlet",
						type: 'POST',
						data: form,
						success: function(data,textStatus,jqXHR)
						{
							console.log(data);
							
							$("#submit-btn").show();
							$("#loader").hide();
							
							if(data.trim()==='done')
							{
							
							
							swal("Registered Sucessfully...we are redirecting to login page")
							.then((value) => {
							  	window.location="LoginPage.jsp"
							});
							}
							else
								{
								swal(data);
								}
						},
						error: function (jqXHR,textStatus,errorThrown)
						{
							$("#submit-btn").show();
							$("#loader").hide();
							swal("Something went Wrong...try again");
							
							
						},
						processData:false,
						contentType:false
					});
					
					
					
				});
			});
		
		</script>
</body>
</html>