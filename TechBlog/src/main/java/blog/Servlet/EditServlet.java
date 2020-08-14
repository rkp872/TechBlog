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

import blog.dao.UserDao;
import blog.entities.Message;
import blog.entities.User;
import blog.helper.ConnectionProvider;


@MultipartConfig
@WebServlet("/editServlet")
public class EditServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		//fetch all data
		String userEmail=request.getParameter("userEmail");
		//System.out.println(userEmail);
		String userName=request.getParameter("userName");
		String userPassword=request.getParameter("userPassword");
		String userAbout=request.getParameter("userAbout");
		
		//get the user from session...
		HttpSession s=request.getSession();
		User user=(User)s.getAttribute("currentUser");
		
		user.setEmail(userEmail);
		user.setName(userName);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		
		//update database
		
		UserDao userDao=new UserDao(ConnectionProvider.getConnection());
		boolean ans=userDao.updateUser(user);
		PrintWriter out=response.getWriter();
		if(ans == true)
		{	

					//out.println("Profile Updated");
					
					Message msg=new Message("Profile Details Updated","success","alert-success");
					
					s.setAttribute("msg", msg);
			
		}
	else
		{
			//out.println("Not Updated");
			
			Message msg=new Message("Somethin went wrong","error","alert-danger");
			
			s.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
	}
}
