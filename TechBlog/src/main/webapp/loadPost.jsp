<%@page import="blog.entities.User"%>
<%@page import="blog.dao.LikeDao"%>
<%@page import="blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="blog.helper.ConnectionProvider"%>
<%@page import="blog.dao.PostDao"%>

<div class="row">

<%
	User uu=(User)session.getAttribute("currentUser");

	Thread.sleep(100);
	PostDao d=new PostDao(ConnectionProvider.getConnection());
	int cid=Integer.parseInt(request.getParameter("cid"));
	List<Post> post =null;
	if(cid==0)
	{
		 post=d.getAllPosts();
	}
	else
	{
		post=d.getPostByCatId(cid);
	}
	if(post.size()==0)
	{
		out.println("<h3 class='display-3 text-center'>No Posts in this Category</h3>");
		return;
	}
	for(Post p:post)
	{
		%>
		
		<div class="col-md-6 mt-2">
			<div class="card">
			<img class="card-img-top" alt="" src="blog_pics/<%=p.getpPic() %>">
			<div class="card-body">
				<b><%=p.getpTitle() %></b>
				<p><%=p.getpContent() %></p>
				
			</div>
			<%LikeDao ldao=new LikeDao(ConnectionProvider.getConnection()); %>
			<div class="card-footer primary-background text-center">
				<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=uu.getId() %>)"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikeOnPost(p.getPid()) %></span></a>
				<a href="show_blog_page.jsp?post_id=<%=p.getPid() %>" class="btn btn-outline-light btn-sm">Read More...</a>				
				<a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
			</div>
			</div>
		</div>
		
		<%
	}
%>

</div>

<script type="text/javascript" src="js/myjs.js"></script>