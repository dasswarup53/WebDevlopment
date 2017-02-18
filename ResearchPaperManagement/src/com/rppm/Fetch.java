package com.rppm;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Fetch
 */
@WebServlet("/Fetch")
@MultipartConfig
public class Fetch extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Fetch() {
       super();
      // System.out.println("Hello");
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String issn = request.getParameter("issn/isbn");
		String name=request.getParameter("name");
		String title=request.getParameter("papertilte");
		String journal=request.getParameter("conf/journal");
		String issue=request.getParameter("issue");
		String date=request.getParameter("date");
		String page=request.getParameter("pages");
	    String domain=request.getParameter("domain");
	    String volume=request.getParameter("volume");
	    String acd_year=request.getParameter("academic_year");
	    String desg=request.getParameter("designation");
	    String stu_fac=null,lvl=null,tp=null;
	    String is_faculty[];
	    String level[];
	    String type[];
	    
	    is_faculty = request.getParameterValues("isfaculty");
	    if (is_faculty != null) 
	    {
	       for (int i = 0; i < is_faculty.length; i++) 
	       {
	    	  if(is_faculty[i] != null)
	    		  stu_fac=is_faculty[i];
	       }
	    }
	    
	    level = request.getParameterValues("level");
	    if (level != null) 
	    {
	       for (int i = 0; i < level.length; i++) 
	       {
	    	 if(level[i] != null)
	    		 lvl=level[i];
	       }
	    }
	    
	     type= request.getParameterValues("type");
	    if (type != null) 
	    {
	       for (int i = 0; i < type.length; i++) 
	       {
	    	   if(type[i] != null)
	         tp=type[i];
	       }
	    }
	    
	    
		Part pdfPart = request.getPart("paper");
		
		if(pdfPart == null)
			System.out.println("Null");
		
	    DbCon.insertInDb(name, title, journal,page, date, issn, domain, pdfPart,volume,acd_year,stu_fac,lvl,tp,issue,desg);
	    
		response.sendRedirect("http://localhost:8080/ResearchPaperManagement/details.jsp");
	}

}
