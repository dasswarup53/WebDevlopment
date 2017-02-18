package com.rppm;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadPDF
 */
@WebServlet("/DownloadPDF")
public class DownloadPDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadPDF() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	openPDF(request, response);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		openPDF(request, response);
    }

    private void close(Closeable resource) throws IOException {
        if (resource != null) {
            resource.close();
        }
    }
    
    private void openPDF(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	InputStream newattachobj = null;
		try {
			newattachobj = DbCon.getPDF(Integer.parseInt(request.getParameter("Id")));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(newattachobj == null) {
			response.sendRedirect("http://localhost:8080/ResearchPaperManagement/index.jsp");
		}
		
		try {
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[256];
            int inputStreamLength = 0;
            int length = 0;
            
            while ((length = newattachobj.read(buffer)) > 0) {
                inputStreamLength += length;
                baos.write(buffer, 0, length);
            }

            if (response instanceof HttpServletResponse) {
                HttpServletResponse httpResponse = (HttpServletResponse) response;
                httpResponse.reset();
                httpResponse.setHeader("Content-Type", "application/pdf");
                httpResponse.setHeader("Content-Length", String.valueOf(inputStreamLength));
                httpResponse.setHeader("Content-Disposition", "inline; filename=\"" + "Yooo.pdf" + "\"");
            }

            response.getOutputStream().write(baos.toByteArray(), 0, (int)inputStreamLength);

            //finally
            response.getOutputStream().flush();

            //clear
            baos = null;

            System.out.println("Yooo");
        } finally {
            // TODO Auto-generated catch block
            close(response.getOutputStream());
            close(newattachobj);
        }

    }

}
