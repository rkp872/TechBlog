package blog.Servlet;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import blog.dao.PostDao;
import blog.entities.Post;
import blog.entities.User;
import blog.helper.ConnectionProvider;
import blog.helper.Helper;

@MultipartConfig
@WebServlet("/addPostServlet")
public class AddPostServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		
		
		PrintWriter out=response.getWriter();
		int cId=Integer.parseInt(request.getParameter("cId"));
		String pTitle=request.getParameter("pTitle");
		String pContent=request.getParameter("pContent");
		String pCode=request.getParameter("pCode");
		Part part=request.getPart("pic");
		//getting current userid
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("currentUser");
		
				
				
				
				
		//out.println("Your post title is : " + pTitle);
		//out.println(part.getSubmittedFileName());
		
		Post p=new Post(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cId,user.getId());
		
		PostDao dao=new PostDao(ConnectionProvider.getConnection());
		if(dao.savePost(p))
		{
			
			String path=request.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
			Helper.saveFile(part.getInputStream(), path);
			out.println("done");
		}
		else
		{
			out.println("Error");
		}
	}
	
}
