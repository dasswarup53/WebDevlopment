package com.rppm;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.Part;

public class DbCon {
	static Connection con;
	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbppm_new","root","root");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	static void insertInDb(String f_name, String title, String j_name, String pages, String dop, String issn_isbn, String domain, Part pdfPart,String volume,String year,String stu_fac,String level,String type,String issue,String desg){  	
		try{  
			//here sonoo is database name, root is username and password
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date sqlDate = new Date(dateFormat.parse(dop).getTime());
			
			String faculty_query = "INSERT INTO faculty(t_name,desg,is_faculty) VALUES(?,?,?);";
			String paper_query = "INSERT INTO paper(t_id, p_title, pages, dop, issn_isbn,dom,type,issue,volume,pdf,acad_year) values((SELECT t_id FROM faculty WHERE t_name = '" + f_name + "'),?,?,?,?,?,?,?,?,?,?);";
			String conf_query = "INSERT INTO conf(p_id, j_name, level) values((SELECT p_id FROM paper WHERE issn_isbn='"+ issn_isbn +"'),?,?);";
			
			con.setAutoCommit(false);
			
			PreparedStatement stmtFaculty = con.prepareStatement(faculty_query);
			stmtFaculty.setString(1, f_name);
			stmtFaculty.setString(2, desg);
			stmtFaculty.setString(3, stu_fac);
			
			stmtFaculty.executeUpdate();
			
			PreparedStatement stmtPaper = con.prepareStatement(paper_query);
			stmtPaper.setString(1, title);
			//stmtPaper.setString(2, vol_issue);
			stmtPaper.setString(2, pages);
			stmtPaper.setDate(3, sqlDate);
			stmtPaper.setString(4, issn_isbn);
			stmtPaper.setString(5, domain);
			stmtPaper.setString(6, type);
			stmtPaper.setString(7, issue);
			stmtPaper.setString(8, volume);
			stmtPaper.setBlob(9, pdfPart.getInputStream());
			stmtPaper.setString(10, year);
			
			stmtPaper.executeUpdate();
			
			PreparedStatement stmtConf = con.prepareStatement(conf_query);
			stmtConf.setString(1, j_name);
			stmtConf.setString(2, level);
			
			stmtConf.executeUpdate();
			
			con.commit();
			con.close();  
		} catch(Exception e){ 
			System.out.println(e); 
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}    
	}
	
	static boolean checkCreds(String username, String password) throws SQLException {
		PreparedStatement statement = con.prepareStatement("select username, password from login where username='" + username + "' and password='" + password + "' and is_auth=1");
		ResultSet results = statement.executeQuery();
		
		return results.first();
	}
	
	static boolean createAdmin(String username, String password) throws SQLException {
		PreparedStatement statement = con.prepareStatement("insert into login (username, password, is_auth) values ('"+username+"', '"+password+"', 0);");
		
		return statement.executeUpdate() == 1 ? true : false;
	}
	
	static InputStream getPDF(int t_id) throws SQLException{
		PreparedStatement statement = con.prepareStatement("select pdf from paper where t_id=" + t_id);
		ResultSet result = statement.executeQuery();
		if(result == null)
			System.out.println("Nulll");
		if(result.first()) {
			return result.getBlob(1).getBinaryStream();
		}
		
		return null;
	}
	
	static void deletePaper(int t_id) {
		try {
		con.setAutoCommit(false);
		
		PreparedStatement statement = con.prepareStatement("delete from conf where j_id=" + t_id);
		statement.executeUpdate();
		
		statement = con.prepareStatement("delete from paper where p_id=" + t_id);
		statement.executeUpdate();
		
		statement = con.prepareStatement("delete from faculty where t_id=" + t_id);
		statement.executeUpdate();
		
		con.commit();
		} catch(SQLException e) {
			try {
				con.rollback();
			} catch(SQLException q) {
				q.printStackTrace();
			}
		}
	}
	
	static void auth(int id) throws SQLException {
		PreparedStatement statement = con.prepareStatement("update login set is_auth = 1 where id=" + id);
		statement.executeUpdate();
	}
	
	static FileInputStream getDb() throws InterruptedException, FileNotFoundException {
		final CountDownLatch latch = new CountDownLatch(1);
		final String filePath = "D:/CSV/db.csv";
		
		new Thread(new Runnable() {
			
			@Override
			public void run() {
				// TODO Auto-generated method stub
				PreparedStatement statement;
				try {
					statement = con.prepareStatement("select 'ID', 'Name', 'Designation', 'Type Of Applicant', 'Paper Title', 'Pages','Date of Pub','ISSN/ISBN','Domain','Type','issue','Volume','Academic Year','Conference', 'Level' union all select faculty.*, paper.p_title,paper.pages,paper.dop,paper.issn_isbn,paper.dom,paper.type,paper.issue,paper.volume,paper.acad_year, conf.j_name, conf.level from faculty, paper, conf where faculty.t_id=paper.t_id and paper.p_id=conf.p_id into outfile '"+filePath+"' fields terminated by ',;' lines terminated by '\r\n'");//select faculty.*, paper.p_title ,conf.* where faculty.t_id = paper.t_id and paper.p_id = conf.p_id into outfile '"+filePath+"' fields terminated by ',' from faculty, paper, conf;");
					statement.executeQuery();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					latch.countDown();
				}
			}
		}).start();
		
		latch.await(30, TimeUnit.SECONDS);
	   	
		return new FileInputStream(new File(filePath));
	}
}
