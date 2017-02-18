<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
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
	width:100%;
	font-size:40px;
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
						Admin Authorization
					</p>
					<table class="imagetable">
			<tr> <th>NAME</th><th>Authorize?</th>
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
			        String query="select username, id from login where is_auth=0";
					Statement stmt=conn.createStatement();
					ResultSet rs=stmt.executeQuery(query);
					
					while(rs.next())
					{
					
					%>
					    <tr><td><%=rs.getString(1) %></td><td> <a href=<%= "\"/ResearchPaperManagement/AuthAccess?Id=" + rs.getInt(2) + "\"" %>>Yes</a></td></tr>				    
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