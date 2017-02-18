<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
 table.imagetable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	width:400px;
	height:300px;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
table.imagetable th {
	background:#b5cfd2 url('images/cell-blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable td {
	background:#dcddc0 url('images/cell-grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
table.imagetable tr:hover{
	background-color:#ffff99;
}
</style>
<body>
	<div class="border">
		<div id="bg" style="background-size:120% 100%; ">
			background
		</div>
		<div class="page">
			<div class="sidebar">
				<a href="index.jsp" id="logo" class="logo"><img src="images/logo.png" alt="logo"></a>
				<ul>
					<li class="selected">
						<a href="http://localhost:8080/ResearchPaperManagement/index.jsp">Home</a>
					</li>
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/details.jsp">Add Details</a>
					</li>
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/browse.jsp">Browse</a>
					</li>
					
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/admin.jsp">Admin</a>
					</li>
					
					<%
						for (Cookie cookie : request.getCookies()) {
							if(cookie.getName().equals("username")) {
					%>
					<li>
						<a href="redirect.jsp">Logout</a>
					</li>
					<% } } %>
				</ul>
				
				
			</div>
			<div class="body">
				<div>
					<h2 align="center">Welcome Administrator</h2>
					<p align="center">
						<br>
						uploaded papers!..
					</p>
					<table class="imagetable">
			<tr> <th>NAME</th><th>Domain</th><th>ISSN/ISBN </th><th>Conference</th><th>Delete</th>
			</tr>
			<% Connection conn;
					try
					{
					Class.forName("com.mysql.jdbc.Driver");
					//String url="jdbc:mysql://localhost:3306/dbppm_new";
					//String username="root";
					//String password="root";
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbppm_new","root","root");
					//Connection conn=DriverManager.getConnection(url,username,password);
			        String query="select faculty.t_name,paper.dom,paper.issn_isbn,conf.j_name,faculty.t_id from faculty, paper, conf where faculty.t_id = paper.t_id and paper.p_id = conf.p_id;";
					Statement stmt=conn.createStatement();
					ResultSet rs=stmt.executeQuery(query);
					
					while(rs.next())
					{
					
					%>
					    <tr><td><a href=<%= "\"/ResearchPaperManagement/DownloadPDF?Id=" + rs.getInt(5) + "\"" %>><%=rs.getString(1) %></a></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><p>
        <a href=<%= "\"/ResearchPaperManagement/DeletePaper?Id=" + rs.getInt(5) + "\"" %>><button type="button" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-remove"></span> Remove
        </button></a>
      </p></td></tr>				    
					        <%
					
					}
					%>
					    </table>
					    <%
					    rs.close();
					    stmt.close();
					    conn.close();
					    }
					catch(Exception e)
					{
					    e.printStackTrace();
					    }
					
					
					

%>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>