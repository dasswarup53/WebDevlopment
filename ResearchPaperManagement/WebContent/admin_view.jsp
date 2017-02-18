<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
	<% 
		boolean found = false;
		for(Cookie cookie : request.getCookies()) {
			if(cookie.getName().equals("username")) {
				found = true;
			}				
		}
		if(!found)
			response.sendRedirect("admin.jsp");
	%>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

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
						<a href="http://localhost:8080/ResearchPaperManagement/index.jsp" onclick="<% 
								%>">Logout</a>
					</li>
					<% } } %>
				</ul>
				
				
			</div>
			<div class="body">
				<div>
					<h2 align="center">Welcome Administrator</h2>
					<p align="center">
						Select from Below
					</p>
				     
				     <p>
				        <a href="auth.jsp" class="btn btn-info btn-lg">
				          <span class="glyphicon glyphicon-user"></span> User
				        </a>
				     </p>
					<p>
				        <a href="paper.jsp" class="btn btn-info btn-lg">
				          <span class="glyphicon glyphicon-file"></span> Paper
				        </a>
				     </p>
				     
				    <p>
				        <a href=<%= "\"/ResearchPaperManagement/DownloadDB" + "\"" %> class="btn btn-info btn-lg">
				          <span class="glyphicon glyphicon-file"></span> Download Database
				        </a>
				     </p>
				</div>
			</div>
		</div>
	</div>
</body>
</html>