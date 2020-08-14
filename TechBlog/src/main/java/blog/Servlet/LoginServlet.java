package blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.dao.UserDao;
import blog.entities.Message;
import blog.entities.User;
import blog.helper.ConnectionProvider;
@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet
{
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		//login
		
		//fetch username and password from request
		String userEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		User u=dao.getUserByEmailAndPassword(userEmail, userPassword);
		if(u==null)
		{
			//Login Error
			//PrintWriter out=response.getWriter();
			//out.println("Invalid Details...try again");
			Message msg=new Message("Invalid Details ! Try with another","error","alert-danger");
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			response.sendRedirect("LoginPage.jsp");
		}
		else
		{
			//login sucess
			HttpSession s=request.getSession();
			s.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
			
		}
	}
}
