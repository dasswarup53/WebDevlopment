package com.rppm;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isCreated;
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
			isCreated = DbCon.createAdmin(userName, password);
			if(isCreated) {
				response.sendRedirect("http://localhost:8080/ResearchPaperManagement/admin.jsp");
				response.getOutputStream().println("<script type=\"text/javascript\">[alert('Registration Successful! You will be notified of Admin rights shortly..')]</script>");
			} else {
				response.getOutputStream().println("<script type=\"text/javascript\">[alert('Registration Failed!')]</script>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		};
	}

}
