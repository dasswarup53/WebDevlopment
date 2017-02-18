package com.rppm;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadDB
 */
@WebServlet("/DownloadDB")
public class DownloadDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FileInputStream fileInputStream;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadDB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			getDbInExcelFormat(request, response);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private void getDbInExcelFormat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, InterruptedException {
		File df = new File("D:/CSV/db.csv");
		if(df.exists())
			df.delete();
		final CountDownLatch latch = new CountDownLatch(1);
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				try {
					fileInputStream = DbCon.getDb();
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					latch.countDown();
				}
			}
		}).start();
		
		response.setContentType("APPLICATION/OCTET-STREAM");   
		response.setHeader("Content-Disposition","attachment; filename=\"" + "ResearchPaperDatabase.csv" + "\"");
		 
		latch.await(30, TimeUnit.SECONDS);
		
		int i;
		while ((i = fileInputStream.read()) != -1) {  
		    response.getWriter().write(i);   
	    }   
		
		fileInputStream.close();
	}
}