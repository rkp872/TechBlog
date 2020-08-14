package blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.dao.LikeDao;
import blog.helper.ConnectionProvider;


@WebServlet("/likeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LikeServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		String operation=request.getParameter("operation");
		int uid=Integer.parseInt(request.getParameter("uid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
		PrintWriter out=response.getWriter();
//		out.println("Data from server ");
//		out.println(operation);
//		out.println(uid);
//		out.println(pid);
		LikeDao ldao=new LikeDao(ConnectionProvider.getConnection());
		if(operation.equals("like"))
		{
			boolean f=ldao.insertLike(pid, uid);
			out.println(f);
		}
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
