package blog.Servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.entities.Message;

@WebServlet("/logoutServlet")
public class LogoutServlet extends HttpServlet
{
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		HttpSession s=request.getSession();
		s.removeAttribute("currentUser");
		Message m=new Message("Log Out Sucessfully","Success","alert-success");
		s.setAttribute("msg", m);
		response.sendRedirect("LoginPage.jsp");
	}
}
