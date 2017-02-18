package com.rppm;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeletePaper
 */
@WebServlet("/DeletePaper")
public class DeletePaper extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePaper() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		deletePaper(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		deletePaper(request, response);
	}
	
	private void deletePaper(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int t_id = Integer.parseInt(request.getParameter("Id"));
		
		DbCon.deletePaper(t_id);
		response.getOutputStream().println("<script type=\"text/javascript\">[alert('Paper Deleted!')]</script>");
		response.sendRedirect("http://localhost:8080/ResearchPaperManagement/paper.jsp");
	}
}
