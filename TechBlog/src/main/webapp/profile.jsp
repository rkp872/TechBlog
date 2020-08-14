<%@page import="blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="blog.entities.Category"%>
<%@page import="blog.helper.ConnectionProvider"%>
<%@page import="blog.dao.PostDao"%>
<%@page import="blog.entities.Message"%>
<%@page errorPage="ErrorPage.jsp"%>
<%
	User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("LoginPage.jsp");
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<style>

body{
	background:url(img/bg2.jpg);
	background-size:cover;
	background-attachment:fixed;
}

.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 90%, 59% 100%, 31% 92%, 0 99%, 0 0);
}
</style>
<meta charset="ISO-8859-1">
<title>Profile | TechBlog</title>
</head>
<body>
	<!-- Navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<h1 class="navbar-brand" href="#">
			<span class="fa fa-asterisk"></span>Tech Blog
		</h1>

		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"><span class="fa fa-home"></span>Home <span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-user"></span>Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-model"><span
						class="fa fa-asterisk"></span>Do Post</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-sort-alpha-asc"></span>Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>

						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structures</a>
					</div></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="!"
					data-toggle="modal" data-target="#profile-model"><span
						class="fa fa-user-circle"></span><%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="logoutServlet"><span
						class="fa fa-user-plus"></span>Log Out</a></li>

			</ul>
		</div>
	</nav>



	<!-- End of navbar -->


	<%
		Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>" role="alert">
		<%=m.getContent()%>
	</div>



	<%
		session.removeAttribute("msg");
	}
	%>



	<!-- main start -->
	<main>
		<div class="container">
			<div class="row mt-4">
				<div class="col-md-4">
					<!-- categories -->

					<div class="list-group">
						<a href="#" onclick="getPosts(0,this)"
							class="c-link list-group-item list-group-item-action active">
							All Posts </a>
						<%
							PostDao d = new PostDao(ConnectionProvider.getConnection());
						ArrayList<Category> list1 = d.getAllCategories();
						for (Category cc : list1) {
						%>
						<a href="#" onclick="getPosts(<%=cc.getCid()%>,this)"
							class="c-link list-group-item list-group-item-action"><%=cc.getName()%></a>

						<%
							}
						%>

					</div>


				</div>
				<div class="col-md-8">
					<!-- posts -->
					<div class="container text-center" id="loader">
						<i class="fa fa-refresh fa-4x fa-spin"></i>
						<h3 class="mt-2">Loading...</h3>
					</div>
					<div class="container" id="post-container"></div>
				</div>
			</div>
		</div>
	</main>



	<!-- main end -->









	<!-- Profile model -->

	<!-- Modal -->
	<div class="modal fade" id="profile-model" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">

						<h5 class="modal-title mt-3" id="exampleModalLabel">
							<%=user.getName()%>
						</h5>
						<!-- Details -->
						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status</th>
										<td><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on</th>
										<td><%=user.getDateTime().toString()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- Profie edit -->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="editServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><input class="form-control" type="email"
											name="userEmail" value=<%=user.getEmail()%>></td>

									</tr>
									<tr>
										<th scope="row">Name</th>
										<td><input class="form-control" type="text"
											name="userName" value=<%=user.getName()%>></td>

									</tr>
									<tr>
										<th scope="row">Password</th>
										<td><input class="form-control" type="password"
											name="userPassword" value=<%=user.getPassword()%>></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=user.getGender().toUpperCase()%></td>

									</tr>

									<tr>
										<th scope="row">About</th>
										<td><textarea name="userAbout" class="form-control"
												rows="3"><%=user.getAbout()%></textarea></td>

									</tr>


								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>

						</div>




					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- End of model -->

	<!-- Add post Model -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-model" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="addPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cId">
								<option selected disabled>----Select Category---</option>
								<%
									PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
									}
								%>
							</select>

						</div>
						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post title"
								name="postTitle" class="form-control">
						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control"
								style="height: 200px;" placeholder="Enter your content"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control"
								style="height: 100px;" placeholder="Enter your program(if any)"></textarea>
						</div>
						<div class="form-group">
							<label>Select Pictures(if any)..</label><br> <input
								name="pic" type="file">
						</div>


						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>

						</div>
					</form>




				</div>

			</div>
		</div>
	</div>

	<!-- End Post Model -->

	<!-- Javascript -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {

			let editStatus = false;

			$('#edit-profile-button').click(function() {

				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					editStatus = false;
				}

			})
		});
	</script>
	<!-- now add post js -->
	<script>
		$(document)
				.ready(
						function(e) {

							//alert("..loaded..")
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												//this code gets called when form is submitted..
												event.preventDefault();
												console
														.log("You have clicked on submit..")

												let form = new FormData(this);

												//now requesting to server

												$
														.ajax({
															url : "addPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success
																console
																		.log(data);
																if (data.trim() === 'done') {
																	swal(
																			"Good job!",
																			"Saved Sucessfully!",
																			"success");
																} else {
																	swal(
																			"OOPS!",
																			"Something went Wrong! uper wala Try again",
																			"error");
																}
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error..
																swal(
																		"OOPS!",
																		"Something went Wrong! Try again",
																		"error");
															},
															processData : false,
															contentType : false
														})

											})

						})
	</script>

	<!-- Loading posts -->

	<script>
		function getPosts(catId,temp) {

			$("#loader").show();
			$("#post-container").hide();

			$(".c-link").removeClass('active');
			
			$.ajax({
				url : "loadPost.jsp",
				data : {
					cid : catId
				},
				success : function(data, textStatus, jqXHR) {
					console.log(data);
					 $("#loader").hide();
					 $("#post-container").show();
					$("#post-container").html(data);
					$(temp).addClass('active');

				}
			})

		}
		$(document).ready(function(e) {
			let allPostRef=$('.c-link')[0]
			getPosts(0,allPostRef)
		})
	</script>
</body>
</html>