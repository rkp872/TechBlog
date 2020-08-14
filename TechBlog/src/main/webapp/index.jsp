<%@page import="java.sql.*"%>
<%@page import="blog.helper.ConnectionProvider"%>

<html>
	<head>
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
		<title>Home | TechBlog</title>
	</head>
	<body>
		
		<!--navbar  -->
		<%@include file="normalNavbar.jsp" %>
		
		<!-- banner -->
		<div class="container-fluid p-0 m-0">
			
			<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h3 class="display-3">Welcome to Tech Blog </h3>
				<p>A programming language is a formal language comprising a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.</p>
				<p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Early ones preceded the invention of the digital computer, the first probably being the automatic flute player described in the 9th century by the brothers Musa in Baghdad, during the Islamic Golden Age.[1] Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.[2] The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions.</p>
				<button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start ! Its Free</button>
				<a href="LoginPage.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin" ></span> Login</a>
				
				
				</div>
			
			</div>
		
		</div>
		
		<!-- cards -->
		<div class="container">
			<div class="row mb-2">
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
				
				</div>
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
				
				</div>
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
				
				</div>
			
				
			</div>	
			<div class="row">
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
				
				</div>
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
				
				</div>
				<div class="col-md-4">
					<div class="card" style="width: 18rem;">
						  <div class="card-body">
						    <h5 class="card-title">Card title</h5>
						    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
						    <a href="#" class="btn primary-background text-white">Read More</a>
						  </div>
						</div>
				
				</div>
			
				
			</div>	
		
		</div>
		
		
		
		<!-- Javascript -->
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
	
		<script>
			
		</script>
	</body>
</html>
