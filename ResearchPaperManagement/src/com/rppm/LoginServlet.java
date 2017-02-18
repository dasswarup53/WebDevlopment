package com.rppm;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isAuth;
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			isAuth = DbCon.checkCreds(userName, password);
			if(isAuth) {
				response.getOutputStream().println("<script type=\"text/javascript\">[alert('Login Successful!')]</script>");
				Cookie cookie = new Cookie("username", userName);
				cookie.setMaxAge(60*60);
				response.addCookie(cookie);
				String url = response.encodeRedirectURL("http://localhost:8080/ResearchPaperManagement/admin_view.jsp");
				response.sendRedirect(url);
			} else {
				response.getOutputStream().println("<script type=\"text/javascript\">[alert('Login Failed!')]</script>");
				response.sendRedirect("http://localhost:8080/ResearchPaperManagement/admin.jsp");
			}
		} catch (SQLException e) {
		
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
