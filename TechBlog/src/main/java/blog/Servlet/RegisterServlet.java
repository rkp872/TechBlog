package blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.dao.UserDao;
import blog.entities.User;
import blog.helper.ConnectionProvider;

@WebServlet("/registerServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		PrintWriter out=response.getWriter();
		//Fetch all form data
		String check=request.getParameter("check");
		if(check==null)
		{
			out.print("Plese agree terms and condition");
		}
		else
		{
			//rest al data fetched here
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String gender=request.getParameter("user_gender");
			String about=request.getParameter("about");
			//crete user object and set all data to that oject
			
			User user=new User(name,email,password,gender,about);
			
			//create userdao object
			UserDao dao=new UserDao(ConnectionProvider.getConnection());
			if(dao.saveUser(user))
			{
				//save
				out.println("done");
			}
			else
			{
				out.println("Error");
			}
			
			
		}
		
		
	}

}
